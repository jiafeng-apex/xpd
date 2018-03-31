package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.MaterialInvoice;
import com.xinpengdu.persistence.InvoiceMapper;
import com.xinpengdu.service.MaterialInvoiceService;
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
 * 材料发票信息
 */
@Controller
@RequestMapping(value = "/op/materialInvoice")
public class MaterialInvoiceController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private MaterialInvoiceService materialInvoiceService;

    @Autowired
    private InvoiceMapper invoiceMapper;

    /**
     * 获取材料发票列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String materialContractId, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("materialContractId", materialContractId);
                String result = materialInvoiceService.queryList(params);
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
            return materialInvoiceService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取材料发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            MaterialInvoice materialInvoice = (MaterialInvoice) JSONObject.toBean(JSONObject.fromObject(data), MaterialInvoice.class);
            materialInvoiceService.save(materialInvoice);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存材料发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            MaterialInvoice materialInvoice = (MaterialInvoice) JSONObject.toBean(JSONObject.fromObject(data), MaterialInvoice.class);
            materialInvoiceService.update(materialInvoice);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新材料发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            materialInvoiceService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新材料发票信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/syncInvoice", method = RequestMethod.POST)
    public String syncInvoice(@RequestParam String ids,@RequestParam String remark) {
        try {
            String[] invoiceIds=ids.split(";");
            boolean relust=materialInvoiceService.syncInvoice(invoiceIds,remark);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("材料发票转入异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

}
