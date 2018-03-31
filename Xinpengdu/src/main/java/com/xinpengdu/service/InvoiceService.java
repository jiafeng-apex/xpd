package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.Invoice;
import com.xinpengdu.entity.project.InvoiceTaxBill;
import com.xinpengdu.persistence.InvoiceMapper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 发票信息服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class InvoiceService {
    private Logger logger = Logger.getLogger(InvoiceService.class);

    @Autowired
    private InvoiceMapper invoiceMapper;

    @Autowired
    private InvoiceTaxBillService invoiceTaxBillService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = invoiceMapper.count(params);
        List<Map<String, Object>> list = invoiceMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        List<Map<String, Object>> invoiceTaxBillList = invoiceTaxBillService.query(id);
        if (invoiceTaxBillList != null && invoiceTaxBillList.size() > 0) {
            JSONArray array = new JSONArray();
            for (Map<String, Object> invoiceTaxBill : invoiceTaxBillList) {
                JSONObject obj = new JSONObject();
                for (Map.Entry<String, Object> entry : invoiceTaxBill.entrySet()) {
                    obj.put(entry.getKey(), entry.getValue());
                }
                array.add(obj);
            }
            jsonObject.put("invoiceTaxBill", array);
        }
        return jsonObject.toString();
    }

    /**
     * 获取工程下最新的一条工程发票信息
     * @param projectId
     * @return
     * @throws Exception
     */
    public String getNewInfo(String projectId) throws Exception {
        Invoice invoice = invoiceMapper.getNewestInvoiceInfo(projectId);
        if (invoice != null) {
            Map<String, Object> map = Tool.transBean2Map(invoice);
            JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jsonObject.put(entry.getKey(), entry.getValue());
            }
            List<Map<String, Object>> invoiceTaxBillList = invoiceTaxBillService.query(invoice.getInvoiceId());
            if (invoiceTaxBillList != null && invoiceTaxBillList.size() > 0) {
                JSONArray array = new JSONArray();
                for (Map<String, Object> invoiceTaxBill : invoiceTaxBillList) {
                    JSONObject obj = new JSONObject();
                    for (Map.Entry<String, Object> entry : invoiceTaxBill.entrySet()) {
                        obj.put(entry.getKey(), entry.getValue());
                    }
                    array.add(obj);
                }
                jsonObject.put("invoiceTaxBill", array);
            }
            return jsonObject.toString();
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    public List<Invoice> query(Object value) {
        return invoiceMapper.query(value);
    }

    public void saveInfo(String data) throws Exception {
        Invoice invoice = (Invoice) JSONObject.toBean(JSONObject.fromObject(data), Invoice.class);
        String invoiceId = UUID.randomUUID().toString();
        invoice.setInvoiceId(invoiceId);
        String createDate = DateUtil.dateTime2String(new Date());
        invoice.setCreateDate(createDate);
        invoice.setLastUpdateDate(createDate);
        invoiceMapper.save(invoice);

        String invoiceTaxBillStr = invoice.getInvoiceTaxBill();
        if (invoiceTaxBillStr != "" && !invoiceTaxBillStr.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBillStr), InvoiceTaxBill.class);
            invoiceTaxBill.setInvoiceId(invoiceId);
            invoiceTaxBillService.save(invoiceTaxBill);
        }

        String invoiceTaxBill_1Str = invoice.getInvoiceTaxBill_1();
        if (invoiceTaxBill_1Str != "" && !invoiceTaxBill_1Str.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBill_1Str), InvoiceTaxBill.class);
            invoiceTaxBill.setInvoiceId(invoiceId);
            invoiceTaxBillService.save(invoiceTaxBill);
        }
        String invoiceTaxBill_2Str = invoice.getInvoiceTaxBill_2();
        if (invoiceTaxBill_2Str != "" && !invoiceTaxBill_2Str.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBill_2Str), InvoiceTaxBill.class);
            invoiceTaxBill.setInvoiceId(invoiceId);
            invoiceTaxBillService.save(invoiceTaxBill);
        }
    }

    public Invoice get(String id) {
        return invoiceMapper.get(id);
    }

    public Invoice getInvoiceEditInfo(Map<String, Object> params) {
        return invoiceMapper.getInvoiceEditInfo(params);
    }


    public void updateInfo(String data) throws Exception {
        Invoice invoice = (Invoice) JSONObject.toBean(JSONObject.fromObject(data), Invoice.class);
        update(invoice);

        String invoiceTaxBillStr = invoice.getInvoiceTaxBill();
        if (invoiceTaxBillStr != "" && !invoiceTaxBillStr.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBillStr), InvoiceTaxBill.class);
            invoiceTaxBillService.update(invoiceTaxBill);
        }

        String invoiceTaxBill_1Str = invoice.getInvoiceTaxBill_1();
        if (invoiceTaxBill_1Str != "" && !invoiceTaxBill_1Str.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBill_1Str), InvoiceTaxBill.class);
            invoiceTaxBillService.update(invoiceTaxBill);
        }
        String invoiceTaxBill_2Str = invoice.getInvoiceTaxBill_2();
        if (invoiceTaxBill_2Str != "" && !invoiceTaxBill_2Str.equals("")) {
            InvoiceTaxBill invoiceTaxBill = (InvoiceTaxBill) JSONObject.toBean(JSONObject.fromObject(invoiceTaxBill_2Str), InvoiceTaxBill.class);
            invoiceTaxBillService.update(invoiceTaxBill);
        }
    }

    public void update(Invoice invoice) {
        invoice.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        invoiceMapper.update(invoice);
    }

    public void deleteById(String id) {
        invoiceMapper.deleteById(id);
    }

    public void deleteByExternalInvoiceId(String id) {
        invoiceMapper.deleteByExternalInvoiceId(id);
    }

}
