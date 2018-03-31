package com.xinpengdu.web.op.access.controller;

import com.alibaba.fastjson.JSONArray;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.MD5Util;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.Operater;
import com.xinpengdu.service.OperaterRoleService;
import com.xinpengdu.service.OperaterService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 公司运营账号登陆控制器
 */
@Controller
@RequestMapping("/op/login")
public class OpLoginController {

    @Autowired
    private OperaterService operaterService;

    @Autowired
    private OperaterRoleService operaterRoleService;

    @RequestMapping(method = RequestMethod.GET)
    public String loginPage(HttpServletRequest request, HttpSession session) {
        return "op/admin/login";
    }

    /**
     * 用户登录
     *
     * @param loginName
     * @param operaterPwd
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView login(@RequestParam String loginName, @RequestParam String operaterPwd, String customCompany, String type, HttpServletRequest
            request, HttpSession session) {
        if (Tool.isEmpty(customCompany)) {
            session.removeAttribute(SessionConstants.CUSTOM_COMPANY);
        } else {
            session.setAttribute(SessionConstants.CUSTOM_COMPANY, customCompany);
        }
        loginName = loginName.trim();
        operaterPwd = operaterPwd.trim();
        Operater operater = operaterService.checkOperater(loginName, MD5Util.getMD5(operaterPwd));
        if (null == operater) {
            return new ModelAndView("op/admin/login", "error", true);
        }
        //登录成功
        AccessInfo accessInfo = new AccessInfo();
        accessInfo.setOperaterId(operater.getOperaterId());             // 员工编号
        accessInfo.setLoginName(operater.getLoginName());               // 登录名
        accessInfo.setOperaterName(operater.getOperaterName());         // 姓名
        accessInfo.setDeptName(operater.getDeptName());                 // 部门
        accessInfo.setPostId(operater.getPostId());                     // 岗位
        session.setAttribute(SessionConstants.ACCESS_INFO, accessInfo);
        operaterRoleService.initializeMenuPermissionsByUser(operater.getOperaterId(), session);
        return ControllerTool.getHomePage(request);
    }

    /**
     * 获取角色对应可查看的菜单数据
     *
     * @param userId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getMenuListData", method = RequestMethod.POST)
    public String getMenuList4Permission(@RequestParam String userId) {
        JSONArray result = new JSONArray();

        List<Map<String, Object>> permissionRecordList = operaterRoleService.getMenuListByUserId(userId);
        for (Map<String, Object> map : permissionRecordList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("menuId", map.get("menuId"));
            jsonObject.put("menuName", map.get("menuName"));
            jsonObject.put("level", map.get("level"));
            jsonObject.put("menuUrl", map.get("url"));
            jsonObject.put("menuIconClass", map.get("iconClass"));
            jsonObject.put("menuParentId", map.get("parentMenuId"));

            result.add(jsonObject);
        }

        return result.toJSONString();
    }

}
