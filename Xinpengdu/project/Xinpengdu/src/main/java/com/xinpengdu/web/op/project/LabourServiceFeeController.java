package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.LabourServiceFee;
import com.xinpengdu.service.LabourServiceFeeService;
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
 * 劳务费信息
 */
@Controller
@RequestMapping(value = "/op/labourServiceFee")
public class LabourServiceFeeController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private LabourServiceFeeService labourServiceFeeService;

    /**
     * 获取劳务费列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String projectId, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("projectId", projectId);
                String result = labourServiceFeeService.queryList(params);
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
            return labourServiceFeeService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取劳务费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            LabourServiceFee labourServiceFee = (LabourServiceFee) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceFee.class);
            labourServiceFeeService.save(labourServiceFee);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存劳务费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            LabourServiceFee labourServiceFee = (LabourServiceFee) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceFee.class);
            labourServiceFeeService.update(labourServiceFee);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新劳务费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            String resultInfo = labourServiceFeeService.deleteById(id);
            return resultInfo;
        } catch (Exception e) {
            logger.error("删除劳务费信息异常:" + e.getMessage(), e);
            return Tool.getJsonMsgReturn(false, "Error");
        }
    }

}
