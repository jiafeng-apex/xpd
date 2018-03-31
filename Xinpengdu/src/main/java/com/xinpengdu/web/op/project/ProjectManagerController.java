package com.xinpengdu.web.op.project;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.ProjectManager;
import com.xinpengdu.service.ProjectInfoService;
import com.xinpengdu.service.ProjectManagerService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 项目经理信息
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午9:46:52
 */
@Controller
@RequestMapping(value = "/op/projectManager")
public class ProjectManagerController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private ProjectManagerService projectManagerService;

    @Autowired
    private ProjectInfoService projectInfoService;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listPage(HttpServletRequest request, HttpSession session) {
        if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_PM, PERMISSION_ACTION.READ)) {
            AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
            Map<String, Object> model = new HashMap<String, Object>();
            return new ModelAndView("/op/projectManager/pmList", model);
        } else {
            return ControllerTool.getHomePage(request);
        }
    }

    /**
     * 获取项目经理列表信息
     *
     * @param pmName
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String pmName, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_PM, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("pmName", pmName);
                String result = projectManagerService.queryList(params);
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
            return projectManagerService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取项目经理信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            ProjectManager projectManager = (ProjectManager) JSONObject.toBean(JSONObject.fromObject(data), ProjectManager.class);
            projectManagerService.save(projectManager);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存项目经理信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            ProjectManager projectManager = (ProjectManager) JSONObject.toBean(JSONObject.fromObject(data), ProjectManager.class);
            projectManagerService.update(projectManager);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新项目经理信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            String result = projectManagerService.deleteById(id);
            return result;
        } catch (Exception e) {
            logger.error("更新项目经理信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


}
