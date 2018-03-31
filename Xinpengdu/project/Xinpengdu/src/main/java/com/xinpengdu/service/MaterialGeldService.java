package com.xinpengdu.service;

import com.xinpengdu.common.tool.DataUtil;
import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.MaterialContract;
import com.xinpengdu.entity.project.MaterialGeld;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.MaterialContractMapper;
import com.xinpengdu.persistence.MaterialGeldMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * 材料支付款信息服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MaterialGeldService {

    @Autowired
    private MaterialGeldMapper materialGeldMapper;

    @Autowired
    private MaterialContractMapper materialContractMapper;

    @Autowired
    private ProjectTollService projectTollService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = materialGeldMapper.count(params);
        List<Map<String, Object>> list = materialGeldMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        return jsonObject.toString();
    }

    public List<MaterialGeld> query(Object value) {
        return materialGeldMapper.query(value);
    }

    public void save(MaterialGeld materialGeld) {
        String materialGeldId = UUID.randomUUID().toString();
        String createDate = DateUtil.dateTime2String(new Date());

        // 如果需要转入到工程收费中
        if (materialGeld.getIsAutoTransfer().equals("1")) {
            // 摘要 = 付材料款（材料商名称）
            String summary = "付材料款";
            MaterialContract materialContract = materialContractMapper.get(materialGeld.getMaterialContractId());
            if (materialContract != null) {
                summary += "(" + materialContract.getSupplierName() + ")";
            }
            ProjectToll projectToll = new ProjectToll();
            projectToll.setProjectId(materialGeld.getProjectId());
            projectToll.setSummary(summary);
            projectToll.setMaterialGeld(materialGeld.getPayAmount());
            projectToll.setProjectTollDate(materialGeld.getPayDate());
            projectToll.setExternalGeldId(materialGeldId);
            projectToll.setAutomaticCalculation("0");
            projectToll.setLocalBankDepositBak("0");

            // 材料支付款
            double materialGeld_D = new BigDecimal(DataUtil.delComma(materialGeld.getPayAmount())).doubleValue();
            double balanceBak = 0 - materialGeld_D;
            projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

            projectTollService.save(projectToll);
        }

        materialGeld.setMaterialGeldId(materialGeldId);
        materialGeld.setCreateDate(createDate);
        materialGeld.setLastUpdateDate(createDate);
        materialGeldMapper.save(materialGeld);
    }

    public MaterialGeld get(String id) {
        return materialGeldMapper.get(id);
    }

    public MaterialGeld getMaterialGeldEditInfo(Map<String, Object> params) {
        return materialGeldMapper.getMaterialGeldEditInfo(params);
    }

    public void update(MaterialGeld materialGeld) {
        String materialGeldId = materialGeld.getMaterialGeldId();
        String updateDate = DateUtil.dateTime2String(new Date());
        // 如果需要转入到工程收费中
        if (materialGeld.getIsAutoTransfer().equals("1")) {
            // 摘要 = 付材料款（材料商名称）
            String summary = "付材料款";
            MaterialContract materialContract = materialContractMapper.get(materialGeld.getMaterialContractId());
            if (materialContract != null) {
                summary += "(" + materialContract.getSupplierName() + ")";
            }
            // 更新工程收费中的材料支付款金额
            ProjectToll projectToll = projectTollService.getByExternalGeldId(materialGeldId);
            if (projectToll != null) {
                String projectTollDate_old = projectToll.getProjectTollDate();
                projectToll.setSummary(summary);
                projectToll.setMaterialGeld(materialGeld.getPayAmount());
                projectToll.setProjectTollDate(materialGeld.getPayDate());

                // 材料支付款
                double materialGeld_D = new BigDecimal(DataUtil.delComma(materialGeld.getPayAmount())).doubleValue();
                double balanceBak = 0 - materialGeld_D;
                projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

                // 如果修改了日期
                if (!materialGeld.getPayDate().equals(projectTollDate_old)) {
                    // 先删除本条记录，再重新插入数据
                    projectTollService.deleteById(projectToll.getProjectTollId());
                    projectTollService.save(projectToll);
                } else {
                    projectTollService.updateInfo(projectToll);
                }
            } else {
                // 如果为空，就新增一条
                projectToll = new ProjectToll();
                projectToll.setProjectId(materialGeld.getProjectId());
                projectToll.setProjectTollDate(materialGeld.getPayDate());
                projectToll.setSummary(summary);
                projectToll.setMaterialGeld(materialGeld.getPayAmount());
                projectToll.setProjectTollDate(materialGeld.getPayDate());
                projectToll.setExternalGeldId(materialGeldId);
                projectToll.setAutomaticCalculation("0");
                projectToll.setLocalBankDepositBak("0");

                // 材料支付款
                double materialGeld_D = new BigDecimal(DataUtil.delComma(materialGeld.getPayAmount())).doubleValue();
                double balanceBak = 0 - materialGeld_D;
                projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

                projectTollService.save(projectToll);
            }
        }
        // 更新材料支付款数据
        materialGeld.setLastUpdateDate(updateDate);
        materialGeldMapper.update(materialGeld);
    }

    public void deleteById(String id) {
        // 删除工程收费中的数据
        projectTollService.deleteByExternalGeldId(id);
        // 删除材料支付款
        materialGeldMapper.deleteById(id);
    }

    public void updates(float differVal, String date) {
        Map<String, Object> params = new HashMap<>();
        params.put("differVal", differVal);
        params.put("date", date);
        materialGeldMapper.updates(params);
    }
}
