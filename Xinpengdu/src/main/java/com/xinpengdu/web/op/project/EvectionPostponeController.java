package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.EvectionPostpone;
import com.xinpengdu.service.EvectionPostponeService;
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
 * 外出证延期信息
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:46:52
 */
@Controller
@RequestMapping(value = "/op/projectEvectionPostpone")
public class EvectionPostponeController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private EvectionPostponeService evectionPostponeService;

    /**
     * 获取外出证延期列表信息
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
                String result = evectionPostponeService.queryList(params);
                return result;
            }
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    /**
     * 获取外出证延期列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list2", method = RequestMethod.POST)
    public String queryByEvectionId(String evectionId, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("evectionId", evectionId);
                String result = evectionPostponeService.queryList(params);
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
            return evectionPostponeService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取外出证延期信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            EvectionPostpone evectionPostpone = (EvectionPostpone) JSONObject.toBean(JSONObject.fromObject(data), EvectionPostpone.class);
            evectionPostponeService.save(evectionPostpone);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存外出证延期信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            EvectionPostpone evectionPostpone = (EvectionPostpone) JSONObject.toBean(JSONObject.fromObject(data), EvectionPostpone.class);
            evectionPostponeService.update(evectionPostpone);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新外出证延期信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            evectionPostponeService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新外出证延期信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


}
