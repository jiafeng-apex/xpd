package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.LabourServiceGeld;
import com.xinpengdu.service.LabourServiceGeldService;
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
 * 劳务支付款信息
 */
@Controller
@RequestMapping(value = "/op/labourServiceGeld")
public class LabourServiceGeldController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private LabourServiceGeldService labourServiceGeldService;

    /**
     * 获取劳务支付款列表信息
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
                String result = labourServiceGeldService.queryList(params);
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
            return labourServiceGeldService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取劳务支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            LabourServiceGeld labourServiceGeld = (LabourServiceGeld) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceGeld.class);
            labourServiceGeldService.save(labourServiceGeld);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存劳务支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {

            LabourServiceGeld labourServiceGeld = (LabourServiceGeld) JSONObject.toBean(JSONObject.fromObject(data), LabourServiceGeld.class);
            LabourServiceGeld oldLabourServiceGeld=labourServiceGeldService.get(labourServiceGeld.getLabourServiceGeldId());
            //修改本条记录
            labourServiceGeldService.update(labourServiceGeld);
            if(oldLabourServiceGeld!=null){
               float oldPayAmount= Float.parseFloat(oldLabourServiceGeld.getPayAmount().replace(",",""));
               float payAmount= Float.parseFloat(labourServiceGeld.getPayAmount().replace(",",""));
               float differVal=payAmount-oldPayAmount;
                //修改其他记录
                labourServiceGeldService.updates(differVal,labourServiceGeld.getPayDate());
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新劳务支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            LabourServiceGeld oldLabourServiceGeld=labourServiceGeldService.get(id);
            //修改本条记录
            labourServiceGeldService.deleteById(id);
            if(oldLabourServiceGeld!=null){
                float oldPayAmount= Float.parseFloat(oldLabourServiceGeld.getPayAmount().replace(",",""));
                float differVal=0-oldPayAmount;
                //修改其他记录
                labourServiceGeldService.updates(differVal,oldLabourServiceGeld.getPayDate());
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新劳务支付款信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

}
