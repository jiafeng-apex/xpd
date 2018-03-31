package com.xinpengdu.web.op.project;


import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.service.ProjectInfoService;
import com.xinpengdu.service.ProjectStatInfoService;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/op/projectInfo")
public class ProjectInfoController {

    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private ProjectInfoService projectInfoService;

    @Autowired
    private ProjectStatInfoService projectStatInfoService;


    private static final int EXCEL_MAX_SIZE = 65536 - 1;    //excel支持的最大行数，除去表头

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listPage(HttpServletRequest request, HttpSession session) {
//        if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
        AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("/op/project/projectList", model);
//        } else {
//            return ControllerTool.getHomePage(request);
//        }
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String projectContent, String projectAmountBegin, String projectAmountEnd, String projectBeginTime, String projectEndTime,
                       @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                // 获取搜索内容
                logger.info("输入的搜索条件为：" + projectContent);
                // 如果搜索的项目内容不为空，就按照空格进行拆分，最多搜索三个
                if (null != projectContent && !projectContent.equals("")) {
                    String[] contents = projectContent.split(" ");
                    List<String> contentList = new ArrayList<String>();
                    for (int i = 0; i < contents.length; i++) {
                        contentList.add(contents[i]);
                        params.put("content" + (i + 1), contents[i]);
                        if (i >= 2) {
                            break;
                        }
                    }
                    params.put("contentSize", contentList.size());
                    params.put("contentList", contentList);
                }
                params.put("projectContent", projectContent);
                // 金额起始值和结束值
                params.put("projectAmountBegin", projectAmountBegin);
                params.put("projectAmountEnd", projectAmountEnd);
                // 时间起始值和结束值
                params.put("projectBeginTime", projectBeginTime);
                params.put("projectEndTime", projectEndTime);
                String result = projectInfoService.queryList(params);
                return result;
            }
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    @RequestMapping(value = "/addProjectInfo", method = RequestMethod.GET)
    public ModelAndView createProjectInfo() {
        try {
            return new ModelAndView("op/project/projectInfoForm");
        } catch (Exception e) {
            logger.error("获取工程信息异常:" + e.getMessage(), e);
        }
        return new ModelAndView("/op/project/projectList");
    }

    @RequestMapping(value = "/projectInfoForm1", method = RequestMethod.GET)
    public ModelAndView editProjectInfo1(@RequestParam String projectId, HttpServletRequest request, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                Map<String, Object> model = new HashMap();
                model.put("projectId", projectId);
                return new ModelAndView("op/project/projectInfoForm1", model);
            }
            return ControllerTool.getHomePage(request);
        } catch (Exception e) {
            logger.error("获取工程信息异常:" + e.getMessage(), e);
        }
        return new ModelAndView("/op/project/projectList");
    }

    @RequestMapping(value = "/projectInfoForm", method = RequestMethod.GET)
    public ModelAndView editProjectInfo(@RequestParam String projectId, HttpServletRequest request, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                Map<String, Object> model = new HashMap();
                model.put("projectId", projectId);
                return new ModelAndView("op/project/projectInfoForm", model);
            }
            return ControllerTool.getHomePage(request);
        } catch (Exception e) {
            logger.error("获取工程信息异常:" + e.getMessage(), e);
        }
        return new ModelAndView("/op/project/projectList");
    }

    @ResponseBody
    @RequestMapping(value = "/getInfo", method = RequestMethod.POST)
    public String getInfo(@RequestParam String id) {
        try {
            return projectInfoService.getProjectInfoById(id);
        } catch (Exception e) {
            logger.error("获取工程信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            String projectId = projectInfoService.save(data);
            JSONObject result = Tool.getSuccessReturnJSONObject();
            result.put("projectId", projectId);
            return result.toString();
        } catch (Exception e) {
            logger.error("保存工程信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            projectInfoService.update(data);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新工程信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            projectInfoService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("删除工程信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


    @ResponseBody
    @RequestMapping(value = "/getProjectInfoStat", method = RequestMethod.POST)
    public String getProjectInfoStat(@RequestParam String projectId) {
        try {
            return projectStatInfoService.getProjectInfoStat(projectId);
        } catch (Exception e) {
            logger.error("获取工程统计异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/getInvoiceStat", method = RequestMethod.POST)
    public String getgetInvoiceStat(@RequestParam String projectId) {
        try {
            return projectStatInfoService.getInvoiceStat(projectId);
        } catch (Exception e) {
            logger.error("获取发票统计异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/getLabourserviceinvoiceStat", method = RequestMethod.POST)
    public String getLabourserviceinvoiceStat(@RequestParam String projectId) {
        try {
            return projectStatInfoService.getLabourserviceinvoiceStat(projectId);
        } catch (Exception e) {
            logger.error("获取劳务费统计异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/getMaterialContractStat", method = RequestMethod.POST)
    public String getMaterialContractStat(@RequestParam String projectId) {
        try {
            return projectStatInfoService.getMaterialContractStat(projectId);
        } catch (Exception e) {
            logger.error("获取劳务费统计异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }


}
