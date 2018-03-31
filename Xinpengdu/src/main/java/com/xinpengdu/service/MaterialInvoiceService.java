package com.xinpengdu.service;

import com.xinpengdu.common.tool.*;
import com.xinpengdu.entity.project.MaterialInvoice;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.InvoiceMapper;
import com.xinpengdu.persistence.MaterialInvoiceMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 材料发票服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MaterialInvoiceService {

    @Autowired
    private MaterialInvoiceMapper materialInvoiceMapper;

    @Autowired
    private InvoiceMapper invoiceMapper;

    @Autowired
    private ProjectTollService projectTollService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = materialInvoiceMapper.count(params);
        List<Map<String, Object>> list = materialInvoiceMapper.queryList(params);
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

    public List<MaterialInvoice> query(Object value) {
        return materialInvoiceMapper.query(value);
    }

    public void save(MaterialInvoice materialInvoice) {
        materialInvoice.setMaterialInvoiceId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        materialInvoice.setCreateDate(createDate);
        materialInvoice.setLastUpdateDate(createDate);
        materialInvoiceMapper.save(materialInvoice);
    }

    public MaterialInvoice get(String id) {
        return materialInvoiceMapper.get(id);
    }

    public MaterialInvoice getMaterialInvoiceEditInfo(Map<String, Object> params) {
        return materialInvoiceMapper.getMaterialInvoiceEditInfo(params);
    }

    public void update(MaterialInvoice materialInvoice) {
        MaterialInvoice db_materialInvoice = materialInvoiceMapper.get(materialInvoice.getMaterialInvoiceId());
        if (!StringUtil.isEmpty(db_materialInvoice.getExternalInvoiceId())) {
            //删除工程收费中导入的数据
            projectTollService.deleteById(db_materialInvoice.getExternalInvoiceId());
            //清除之前同一批转入的发票 记录
            materialInvoiceMapper.updateByExternalInvoiceId(db_materialInvoice.getExternalInvoiceId());
        }

        materialInvoice.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        materialInvoiceMapper.update(materialInvoice);
    }

    public void deleteById(String id) {
        MaterialInvoice materialInvoice=materialInvoiceMapper.get(id);
        //删除工程收费中导入的数据
        if(!StringUtil.isEmpty(materialInvoice.getExternalInvoiceId())){
            projectTollService.deleteById(materialInvoice.getExternalInvoiceId());
            materialInvoiceMapper.updateByExternalInvoiceId(materialInvoice.getExternalInvoiceId());
        }

        // 删除工程发票中的数据
        invoiceMapper.deleteByExternalInvoiceId(id);

        // 删除材料发票
        materialInvoiceMapper.deleteById(id);
    }

    public List<MaterialInvoice> getNeedSyncList(int day){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("invoiceSyncDate",day);
        return materialInvoiceMapper.getNeedSyncList(map);
    }

    public List<MaterialInvoice> getChooseSyncList(String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("ids",ids);
        return materialInvoiceMapper.getChooseSyncList(map);
    }

    public boolean syncInvoice(String[] ids, String remark) {
        String projectTollId = UUID.randomUUID().toString();
        List<MaterialInvoice> materialInvoices = getChooseSyncList(ids);
        if (materialInvoices != null && materialInvoices.size() > 0) {
            String projectId = materialInvoices.get(0).getProjectId();
            double totalTaxAmount = 0;
            for (MaterialInvoice materialInvoice : materialInvoices) {
                String strTaxAmount = materialInvoice.getTaxAmount().replaceAll(",", "");
                totalTaxAmount += Double.parseDouble(strTaxAmount);
                materialInvoice.setExternalInvoiceId(projectTollId);
                materialInvoiceMapper.update(materialInvoice);
            }

            //保存工程收费信息
            ProjectToll projectToll = new ProjectToll();
            projectToll.setProjectTollId(projectTollId);
            projectToll.setProjectId(projectId);
            projectToll.setProjectTollDate(DateUtil.date2String(new Date()));
            projectToll.setSummary(remark);
            projectToll.setVatIncomeTax(BigDecimalUtil.decimalFormatNumber(totalTaxAmount));    // vatIncomeTax
            projectToll.setAutomaticCalculation("0");
            projectToll.setLocalBankDepositBak("0");
            projectToll.setRemark("手动转入材料发票");
            projectToll.setExternalGeldId(ids[0]);
            // 余额
            projectToll.setBalanceBak(DataUtil.insertComma(totalTaxAmount + "", 2));

            projectTollService.save(projectToll);
        }
        return true;
    }
}
