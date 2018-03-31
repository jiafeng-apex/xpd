package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.LabourServiceInvoice;
import com.xinpengdu.service.LabourServiceInvoiceService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * 劳务发票信息
 */
@Controller
@RequestMapping(value = "/op/labourServiceInvoice")
public class LabourServiceInvoiceController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private LabourServiceInvoiceService labourServiceInvoiceService;

    /**
     * 获取劳务发票列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String labourServiceFeeId, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("labourServiceFeeId", labourServiceFeeId);
                String result = labourServiceInvoiceService.queryList(params);
                return result;
            }
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    @ResponseBody
    @RequestMapping(value = "/getInfo", method = RequestMethod.POST)
    public String getInfo(@RequestParam String id) {
        try {
            return labourServiceInvoiceService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取劳务发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            LabourServiceInvoice labourServiceInvoice = (LabourServiceInvoice) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceInvoice.class);
            labourServiceInvoiceService.save(labourServiceInvoice);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存劳务发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            LabourServiceInvoice labourServiceInvoice = (LabourServiceInvoice) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceInvoice.class);
            labourServiceInvoiceService.update(labourServiceInvoice);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新劳务发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            labourServiceInvoiceService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新劳务发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/syncInvoice", method = RequestMethod.POST)
    public String syncInvoice(@RequestParam String ids,@RequestParam String remark) {
        try {
            String[] invoiceIds=ids.split(";");
            boolean relust=labourServiceInvoiceService.syncInvoice(invoiceIds,remark);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("劳务发票转入异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }
}
