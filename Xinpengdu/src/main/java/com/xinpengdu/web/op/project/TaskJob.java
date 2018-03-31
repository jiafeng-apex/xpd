package com.xinpengdu.web.op.project;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.entity.project.Invoice;
import com.xinpengdu.entity.project.LabourServiceInvoice;
import com.xinpengdu.entity.project.MaterialInvoice;
import com.xinpengdu.persistence.InvoiceMapper;
import com.xinpengdu.service.LabourServiceInvoiceService;
import com.xinpengdu.service.MaterialInvoiceService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * desc
 *
 * @author xlguo
 * @create 2017-10-15 16:09
 **/
@Component("taskJob")
public class TaskJob {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private MaterialInvoiceService materialInvoiceService;

    @Autowired
    private LabourServiceInvoiceService labourServiceInvoiceService;

    @Autowired
    private InvoiceMapper invoiceMapper;

    //@Scheduled(cron = "0 0 2 * * ?") //每天凌晨两点触发
    public void invoiceSyncJob() {
        logger.info("发票同步任务启动。。。");
        Calendar c = Calendar.getInstance();
        int day = c.get(Calendar.DATE);//当前日期
        logger.info("开始同步，项目发票同步日期为"+day+"号的发票");
        //获取待同步的材料合同发票
        List<MaterialInvoice> materialInvoiceList = materialInvoiceService.getNeedSyncList(day);
        if(materialInvoiceList!=null && materialInvoiceList.size()>0){
            logger.info("材料合同发票待同步条数："+materialInvoiceList.size());
            for (MaterialInvoice materialInvoice : materialInvoiceList) {
                Invoice invoice = new Invoice();
                String invoiceId = UUID.randomUUID().toString();
                invoice.setInvoiceId(invoiceId);
                invoice.setProjectId(materialInvoice.getProjectId());
                invoice.setExternalInvoiceId(materialInvoice.getMaterialInvoiceId());
                invoice.setInvoiceNumber(materialInvoice.getInvoiceNumber());
                invoice.setInvoiceDate(materialInvoice.getInvoiceDate());
                invoice.setSummary(materialInvoice.getSummary());
                invoice.setTaxRate(materialInvoice.getTaxRate());
                invoice.setInvoiceAmount(materialInvoice.getAmount());
                invoice.setTaxTotal(materialInvoice.getTaxPrice());
                invoice.setTax(materialInvoice.getTaxAmount());
                invoice.setInvoiceType(materialInvoice.getInvoiceType());
                invoice.setIncomeTaxCalcType("1");
                invoice.setRemark(materialInvoice.getRemark());
                String createDate = DateUtil.dateTime2String(new Date());
                invoice.setCreateDate(createDate);
                invoice.setLastUpdateDate(createDate);
                invoiceMapper.save(invoice);
            }
        }
        logger.info("材料合同发票同步结束");

        try {
            Thread.sleep(60000);//休息1分钟
        } catch (InterruptedException ie){
            logger.error(ie);
        }

        //获取待同步的劳务费发票
        List<LabourServiceInvoice> labourServiceInvoiceList = labourServiceInvoiceService.getNeedSyncList(day);
        if(materialInvoiceList!=null && materialInvoiceList.size()>0) {
            logger.info("劳务费发票待同步条数：" + materialInvoiceList.size());
            for (LabourServiceInvoice labourServiceInvoice : labourServiceInvoiceList) {
                Invoice invoice = new Invoice();
                String invoiceId = UUID.randomUUID().toString();
                invoice.setInvoiceId(invoiceId);
                invoice.setProjectId(labourServiceInvoice.getProjectId());
                invoice.setExternalInvoiceId(labourServiceInvoice.getLabourServiceInvoiceId());
                invoice.setInvoiceNumber(labourServiceInvoice.getInvoiceNumber());
                invoice.setInvoiceDate(labourServiceInvoice.getInvoiceDate());
                invoice.setSummary(labourServiceInvoice.getSummary());
                invoice.setTaxRate(labourServiceInvoice.getTaxRates());
                invoice.setInvoiceAmount(labourServiceInvoice.getAmount());
                invoice.setTaxTotal(labourServiceInvoice.getTaxPriceAmount());
                invoice.setTax(labourServiceInvoice.getTaxAmount());
                invoice.setInvoiceType(labourServiceInvoice.getInvoiceType());
                invoice.setIncomeTaxCalcType("1");
                invoice.setRemark(labourServiceInvoice.getRemark());
                String createDate = DateUtil.dateTime2String(new Date());
                invoice.setCreateDate(createDate);
                invoice.setLastUpdateDate(createDate);
                invoiceMapper.save(invoice);
            }
        }
        logger.info("劳务费发票同步结束");
    }

    @Scheduled(cron = "0 0 2 * * ?") //每天两点触发
    public void dbBackups() {
        logger.info("数据库备份任务启动。。。");
    }

}
