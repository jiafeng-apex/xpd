package com.xinpengdu.service;

import com.xinpengdu.common.tool.DataUtil;
import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.LabourServiceFee;
import com.xinpengdu.entity.project.LabourServiceGeld;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.LabourServiceFeeMapper;
import com.xinpengdu.persistence.LabourServiceGeldMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

/**
 * 劳务支付款服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class LabourServiceGeldService {

    @Autowired
    private LabourServiceGeldMapper labourServiceGeldMapper;

    @Autowired
    private LabourServiceFeeMapper labourServiceFeeMapper;

    @Autowired
    private ProjectTollService projectTollService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = labourServiceGeldMapper.count(params);
        List<Map<String, Object>> list = labourServiceGeldMapper.queryList(params);
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

    public List<LabourServiceGeld> query(Object value) {
        return labourServiceGeldMapper.query(value);
    }

    public void save(LabourServiceGeld labourServiceGeld) {
        String labourServiceGeldId = UUID.randomUUID().toString();
        String createDate = DateUtil.dateTime2String(new Date());
        // 如果需要自动转入到工程收费中
        if (labourServiceGeld.getIsAutoTransfer().equals("1")) {
            // 摘要 = 付劳务费（劳务商名称）
            String summary = "付劳务费";
            LabourServiceFee labourServiceFee = labourServiceFeeMapper.get(labourServiceGeld.getLabourServiceFeeId());
            if (labourServiceFee != null) {
                summary += "(" + labourServiceFee.getServiceBusinessName() + ")";
            }
            ProjectToll projectToll = new ProjectToll();
            projectToll.setProjectId(labourServiceGeld.getProjectId());
            projectToll.setSummary(summary);
            projectToll.setLabourServiceFee(labourServiceGeld.getPayAmount());
            projectToll.setProjectTollDate(labourServiceGeld.getPayDate());
            projectToll.setExternalGeldId(labourServiceGeldId);
            projectToll.setAutomaticCalculation("0");
            projectToll.setLocalBankDepositBak("0");

            // 劳务费
            double labourServiceFee_D = new BigDecimal(DataUtil.delComma(labourServiceGeld.getPayAmount())).doubleValue();
            double balanceBak = 0 -  labourServiceFee_D;
            projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

            projectTollService.save(projectToll);
        }
        // 保存劳务费信息
        labourServiceGeld.setLabourServiceGeldId(labourServiceGeldId);
        labourServiceGeld.setCreateDate(createDate);
        labourServiceGeld.setLastUpdateDate(createDate);
        labourServiceGeldMapper.save(labourServiceGeld);
    }

    public LabourServiceGeld get(String id) {
        return labourServiceGeldMapper.get(id);
    }

    public LabourServiceGeld getLabourServiceGeldEditInfo(Map<String, Object> params) {
        return labourServiceGeldMapper.getLabourServiceGeldEditInfo(params);
    }

    public void update(LabourServiceGeld labourServiceGeld) {
        String labourServiceGeldId = labourServiceGeld.getLabourServiceGeldId();
//        String updateDate = DateUtil.dateTime2String(new Date());
        // 如果需要自动转入到工程收费中
        if (labourServiceGeld.getIsAutoTransfer().equals("1")) {
            // 摘要 = 付劳务费（劳务商名称）
            String summary = "付劳务费";
            LabourServiceFee labourServiceFee = labourServiceFeeMapper.get(labourServiceGeld.getLabourServiceFeeId());
            if (labourServiceFee != null) {
                summary += "(" + labourServiceFee.getServiceBusinessName() + ")";
            }
            ProjectToll projectToll = projectTollService.getByExternalGeldId(labourServiceGeldId);
            if (projectToll != null) {
                String projectTollDate_old = projectToll.getProjectTollDate();
                projectToll.setSummary(summary);
                projectToll.setLabourServiceFee(labourServiceGeld.getPayAmount());
                projectToll.setProjectTollDate(labourServiceGeld.getPayDate());

                // 劳务费
                double labourServiceFee_D = new BigDecimal(DataUtil.delComma(labourServiceGeld.getPayAmount())).doubleValue();
                double balanceBak = 0 -  labourServiceFee_D;
                projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

                // 如果修改了日期
                if (!labourServiceGeld.getPayDate().equals(projectTollDate_old)) {
                    // 先删除本条记录，再重新插入数据
                    projectTollService.deleteById(projectToll.getProjectTollId());
                    projectTollService.save(projectToll);
                } else {
                    projectTollService.updateInfo(projectToll);
                }
            } else {
                projectToll = new ProjectToll();
                projectToll.setProjectId(labourServiceGeld.getProjectId());
                projectToll.setSummary(summary);
                projectToll.setLabourServiceFee(labourServiceGeld.getPayAmount());
                projectToll.setProjectTollDate(labourServiceGeld.getPayDate());
                projectToll.setExternalGeldId(labourServiceGeldId);
                projectToll.setAutomaticCalculation("0");

                // 劳务费
                double labourServiceFee_D = new BigDecimal(DataUtil.delComma(labourServiceGeld.getPayAmount())).doubleValue();
                double balanceBak = 0 -  labourServiceFee_D;
                projectToll.setBalanceBak(DataUtil.insertComma(balanceBak + "", 2));

                projectTollService.save(projectToll);
            }
        }
        // 更新劳务费
        labourServiceGeld.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        labourServiceGeldMapper.update(labourServiceGeld);
    }

    public void deleteById(String id) {
        // 删除工程收费中的数据
        projectTollService.deleteByExternalGeldId(id);
        // 删除劳务支付款
        labourServiceGeldMapper.deleteById(id);
    }

    public void updates(float differVal, String date) {
        Map<String, Object> params = new HashMap<>();
        params.put("differVal", differVal);
        params.put("date", date);
        labourServiceGeldMapper.updates(params);
    }
}
