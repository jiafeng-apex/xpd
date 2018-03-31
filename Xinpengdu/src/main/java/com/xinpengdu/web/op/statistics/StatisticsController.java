package com.xinpengdu.web.op.statistics;


import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.service.ProjectInfoService;
import com.xinpengdu.service.ProjectStatInfoService;
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
@RequestMapping("/op/statistics")
public class StatisticsController {

    @Autowired
    private ProjectStatInfoService projectStatInfoService;

    @Autowired
    private ProjectInfoService projectInfoService;

    private Logger logger = Logger.getLogger(StatisticsController.class);

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listPage(HttpServletRequest request, HttpSession session) {
        if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_STATS, PERMISSION_ACTION.READ)) {
            AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
            Map<String, Object> model = new HashMap<String, Object>();
            return new ModelAndView("/op/statistics/statisticsReport", model);
        } else {
            return ControllerTool.getHomePage(request);
        }
    }

//    @ResponseBody
//    @RequestMapping(value = "/list", method = RequestMethod.POST)
//    public String list(String projectContent, String projectAmountBegin, String projectAmountEnd, String
//            projectBeginTime, String projectEndTime, @RequestParam int offset, @RequestParam int limit, HttpSession
//                               session) {
//        try {
//            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
//                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
//                Map<String, Object> params = new HashMap<>();
//                params.put("offset", offset);
//                params.put("limit", limit);
//
//                params.put("projectEndTime", projectEndTime);
//                String result = null;   // projectInfoService.queryList(params);
//                return result;
//            }
//        } catch (Exception e) {
//            logger.error("操作失败:" + e.getMessage(), e);
//        }
//        return Tool.getJsonNoDataGridDataReturn();
//    }

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String projectContent, String projectAmountBegin, String projectAmountEnd, String
            projectBeginTime, String projectEndTime, @RequestParam int offset, @RequestParam int limit, HttpSession
                               session) {
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

}
