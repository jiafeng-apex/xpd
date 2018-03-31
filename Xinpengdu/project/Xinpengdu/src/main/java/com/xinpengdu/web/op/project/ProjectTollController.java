package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.service.ProjectTollService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 工程收费信息
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:46:52
 */
@Controller
@RequestMapping(value = "/op/projectToll")
public class ProjectTollController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private ProjectTollService projectTollService;

    /**
     * 获取工程收费列表信息
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
                String result = projectTollService.queryList(params);
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
            return projectTollService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取工程收费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            ProjectToll projectToll = (ProjectToll) JSONObject.toBean(JSONObject.fromObject(data), ProjectToll.class);
            projectToll.setProjectTollId(UUID.randomUUID().toString());
            projectTollService.save(projectToll);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存工程收费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            ProjectToll projectToll = (ProjectToll) JSONObject.toBean(JSONObject.fromObject(data), ProjectToll.class);
            String projectTollId = projectToll.getProjectTollId();  // 工程收费的id
            if (projectToll == null) {
                return Tool.getFailureReturnJSONObject().toString();
            }
            // 获取数据库中该条工程收费的数据
            ProjectToll projectToll_old = projectTollService.get(projectToll.getProjectTollId());
            // 如果修改了工程收费的日期
            if (!projectToll_old.getProjectTollDate().equals(projectToll.getProjectTollDate())) {
                // 先删除本条记录，再重新插入数据
                projectTollService.deleteById(projectTollId);
                projectTollService.save(projectToll);
            } else {
                // 更新工程收费信息
                projectTollService.updateInfo(projectToll);
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新工程收费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    /**
     * 获取最近的五个摘要
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getLatelyTollSummary", method = RequestMethod.POST)
    public String getTollLatelySummary() {
        try {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("latelySummary", projectTollService.getLatelySummary());
            return jsonObject.toString();
        } catch (Exception e) {
            logger.error("更新工程收费信息异常:" + e.getMessage(), e);
        }
        return "";
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            projectTollService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新工程收费信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    /**
     * 获取本地银行存款
     *
     * @param projectId
     * @param response
     * @return
     */
    @RequestMapping(value = "/getImportAmountTotal", method = RequestMethod.POST)
    @ResponseBody
    public String getImportAmountTotal(@RequestParam String projectId, HttpServletResponse response) {
        try {
            String importAmountTotal = projectTollService.getImportAmountTotal(projectId);
            if(importAmountTotal == null){
                importAmountTotal = "0";
            }
            JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
            jsonObject.put("importAmountTotal", importAmountTotal);
            return jsonObject.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return Tool.getFailureReturnJSONObject().toString();
        }
    }

}
