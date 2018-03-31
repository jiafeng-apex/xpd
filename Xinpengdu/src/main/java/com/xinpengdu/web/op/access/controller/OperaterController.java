package com.xinpengdu.web.op.access.controller;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.common.tool.ControllerTool;
import com.xinpengdu.common.tool.MD5Util;
import com.xinpengdu.common.tool.SessionConstants;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.access.AccessInfo;
import com.xinpengdu.entity.project.Operater;
import com.xinpengdu.service.MenuService;
import com.xinpengdu.service.OperaterService;
import com.xinpengdu.service.UserPermissionRecordService;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * 操作人信息
 */
@Controller
@RequestMapping(value = "/op/operater")
public class OperaterController {
    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private OperaterService operaterService;

    @Autowired
    private UserPermissionRecordService userPermissionRecordService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listPage(HttpServletRequest request, HttpSession session) {
        if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_USER, PERMISSION_ACTION.READ)) {
            AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
            Map<String, Object> model = new HashMap<String, Object>();
            return new ModelAndView("/op/operater/operaterList", model);
        } else {
            return ControllerTool.getHomePage(request);
        }
    }

    /**
     * 获取操作人列表信息
     *
     * @param offset
     * @param limit
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(String loginName, String operaterName, @RequestParam int offset, @RequestParam int limit, HttpSession session) {
        try {
            if (ControllerTool.hasPermission(session, MENU_CODE.MENU_PROJECT_INFO, PERMISSION_ACTION.READ)) {
                AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
                Map<String, Object> params = new HashMap<>();
                params.put("offset", offset);
                params.put("limit", limit);
                params.put("loginName", loginName);
                params.put("operaterName", operaterName);
                String result = operaterService.queryList(params);
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
            return operaterService.getInfoById(id);
        } catch (Exception e) {
            logger.error("获取操作人信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public String saveInfo(@RequestParam String data) {
        try {
            System.out.println(data);
            Operater operater = (Operater) JSONObject.toBean(JSONObject.fromObject(data), Operater.class);
            //密码加密
            operater.setOperaterPwd(MD5Util.getMD5(operater.getOperaterPwd()));
            operaterService.save(operater);
            Operater newOperater = operaterService.getOperaterByLoginName(operater.getLoginName());
            if(newOperater!=null){
                //添加初始权限
                if("1".equals(operater.getPostId())){
                    userPermissionRecordService.initSystemUserPermission(Long.parseLong(newOperater.getOperaterId()));
                }else if ("2".equals(operater.getPostId())){
                    userPermissionRecordService.initNormalUserPermission(Long.parseLong(newOperater.getOperaterId()));
                }
            }
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("保存操作人信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
    public String updateInfo(@RequestParam String data) {
        try {
            Operater operater = (Operater) JSONObject.toBean(JSONObject.fromObject(data), Operater.class);
            operaterService.update(operater);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新操作人信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam String id) {
        try {
            operaterService.deleteById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("更新操作人信息异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

    /**
     * 访问用户信息页面
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/operaterDetail", method = RequestMethod.GET)
    public ModelAndView getDetail(HttpServletRequest request, HttpSession session) {
        Map<String, Object> model = new HashMap<String, Object>();
        AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
        if(accessInfo != null){
            Operater operater = operaterService.get(accessInfo.getOperaterId());
            model.put("operater", operater);
            return new ModelAndView("/op/operater/operaterDetail", model);
        }
        return new ModelAndView(new RedirectView(request.getContextPath() + "/op/login"));
    }

    /**
     * 访问修改登录密码页面
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/modifyPassword", method = RequestMethod.GET)
    public ModelAndView personalModifyPasswordPage(HttpServletRequest request, HttpSession session) {
        AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
        if (accessInfo != null) {
            return new ModelAndView("/op/operater/modifyPassword");
        }
        return ControllerTool.getHomePage(request);
    }

    /**
     * 个人修改密码
     *
     * @param oldPassword
     * @param newPassword
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
    public String personalModifyPassword(@RequestParam String oldPassword, @RequestParam String newPassword, HttpServletRequest request, HttpSession session) {
        AccessInfo accessInfo = (AccessInfo) session.getAttribute(SessionConstants.ACCESS_INFO);
        return operaterService.personalModifyPassword(accessInfo, oldPassword.trim(), newPassword.trim());
    }


    /**
     * 获取所有菜单列表
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAllMenuList", method = RequestMethod.POST)
    public String getAllMenuList(@RequestParam int userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("level", 1);//菜单 一级
            params.put("userId", userId);
            String result = menuService.queryList(params);
            return result;
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    /**
     * 获取菜单下的模块列表
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getModelListByMenuId", method = RequestMethod.POST)
    public String getModelListByMenuId(@RequestParam int menuId,@RequestParam int userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("parentMenuId", menuId);//菜单 id
            params.put("userId", userId);
            String result = menuService.queryList(params);
            return result;
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    /**
     * 授权提交处理
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/grant", method = RequestMethod.POST)
    public String grant(@RequestParam Long userId,@RequestParam String chkValues) {
        try {
            operaterService.doGrant(userId,chkValues);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("操作失败:" + e.getMessage(), e);
        }
        return Tool.getJsonNoDataGridDataReturn();
    }

    /**
     * 重置密码
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String resetOperaterPwd(@RequestParam String id) {
        try {
            operaterService.resetPwdById(id);
            return Tool.getSuccessReturnJSONObject().toString();
        } catch (Exception e) {
            logger.error("重置操作人密码异常:" + e.getMessage(), e);
        }
        return Tool.getFailureReturnJSONObject().toString();
    }

}
