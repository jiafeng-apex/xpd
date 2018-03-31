package com.xinpengdu.service;

import com.xinpengdu.common.tool.*;
import com.xinpengdu.entity.project.LabourServiceInvoice;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.InvoiceMapper;
import com.xinpengdu.persistence.LabourServiceInvoiceMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 劳务发票信息服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class LabourServiceInvoiceService {

    @Autowired
    private LabourServiceInvoiceMapper labourServiceInvoiceMapper;

    @Autowired
    private InvoiceMapper invoiceMapper;

    @Autowired
    private ProjectTollService projectTollService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = labourServiceInvoiceMapper.count(params);
        List<Map<String, Object>> list = labourServiceInvoiceMapper.queryList(params);
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

    public List<LabourServiceInvoice> query(Object value) {
        return labourServiceInvoiceMapper.query(value);
    }

    public void save(LabourServiceInvoice labourServiceInvoice) {
        labourServiceInvoice.setLabourServiceInvoiceId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        labourServiceInvoice.setCreateDate(createDate);
        labourServiceInvoice.setLastUpdateDate(createDate);
        labourServiceInvoiceMapper.save(labourServiceInvoice);
    }

    public LabourServiceInvoice get(String id) {
        return labourServiceInvoiceMapper.get(id);
    }

    public LabourServiceInvoice getLabourServiceInvoiceEditInfo(Map<String, Object> params) {
        return labourServiceInvoiceMapper.getLabourServiceInvoiceEditInfo(params);
    }

    public void update(LabourServiceInvoice labourServiceInvoice) {
        LabourServiceInvoice db_labourServiceInvoice=labourServiceInvoiceMapper.get(labourServiceInvoice.getLabourServiceInvoiceId());
        if(!StringUtil.isEmpty(db_labourServiceInvoice.getExternalInvoiceId())){
            //删除工程收费中导入的数据
            projectTollService.deleteById(db_labourServiceInvoice.getExternalInvoiceId());
            //清除之前同一批转入的发票 记录
            labourServiceInvoiceMapper.updateByExternalInvoiceId(db_labourServiceInvoice.getExternalInvoiceId());
        }

        labourServiceInvoice.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        labourServiceInvoiceMapper.update(labourServiceInvoice);
    }

    public void deleteById(String id) {
        LabourServiceInvoice labourServiceInvoice=labourServiceInvoiceMapper.get(id);
        //删除工程收费中导入的数据
        if(!StringUtil.isEmpty(labourServiceInvoice.getExternalInvoiceId())){
            projectTollService.deleteById(labourServiceInvoice.getExternalInvoiceId());
            labourServiceInvoiceMapper.updateByExternalInvoiceId(labourServiceInvoice.getExternalInvoiceId());
        }

        // 删除工程发票中的数据
        invoiceMapper.deleteByExternalInvoiceId(id);
        // 删除劳务发票
        labourServiceInvoiceMapper.deleteById(id);
    }

    public List<LabourServiceInvoice> getNeedSyncList(int day){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("invoiceSyncDate",day);
        return labourServiceInvoiceMapper.getNeedSyncList(map);
    }

    public List<LabourServiceInvoice> getChooseSyncList(String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("ids",ids);
        return labourServiceInvoiceMapper.getChooseSyncList(map);
    }

    public boolean syncInvoice( String[] ids,String remark){
        String projectTollId = UUID.randomUUID().toString();
        List<LabourServiceInvoice> labourServiceInvoices=getChooseSyncList(ids);
        if(labourServiceInvoices!=null && labourServiceInvoices.size()>0){
            String projectId=labourServiceInvoices.get(0).getProjectId();
            double totalTaxAmount=0;
            for (LabourServiceInvoice labourServiceInvoice : labourServiceInvoices) {
                String strTaxAmount=labourServiceInvoice.getTaxAmount().replaceAll(",","");
                totalTaxAmount+=Double.parseDouble(strTaxAmount);
                labourServiceInvoice.setExternalInvoiceId(projectTollId);
                labourServiceInvoiceMapper.update(labourServiceInvoice);
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
