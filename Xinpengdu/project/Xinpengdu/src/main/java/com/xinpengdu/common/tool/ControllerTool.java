package com.xinpengdu.common.tool;

import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.menu.MENU_CODE;
import com.xinpengdu.entity.project.Operater;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Locale;

public class ControllerTool {

    public static final String SESSION_PERMISSION_PREFIX = "PERMISSION_";
    public static final String SESSION_ACCESS_PREFIX = "ACCESS_";

    /**
     * Set SessionConstants.USER, add logon cookie to response
     *
     * @param resp
     * @param session
     * @param user
     */
    public static void addLogonCookie2Resp(HttpServletResponse resp, HttpSession session, Operater user) {
        session.setAttribute(SessionConstants.NORMAL_USER, user);
    }

    /**
     * 获取用户当前语言
     *
     * @param request
     * @return
     */
    public static Locale getCurrentUserLocale(HttpServletRequest request) {
        Locale locale = (Locale) request.getSession().getAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        return locale == null ? request.getLocale() : locale;
    }

    /**
     * 获取项目首页跳转模板
     *
     * @param request
     * @return
     */
    public static ModelAndView getHomePage(HttpServletRequest request) {
        return new ModelAndView(new RedirectView(request.getContextPath() + "/op/operater/operaterDetail"));
    }

    /**
     * 验证是否具有某个菜单的权限
     *
     * @param session
     * @param menuCode
     * @param permissionAction
     * @return
     */
    public static boolean hasPermission(HttpSession session, MENU_CODE menuCode, PERMISSION_ACTION permissionAction) {
        Boolean result = (Boolean) session.getAttribute(SESSION_PERMISSION_PREFIX + menuCode.name() + "_" + permissionAction.name());
        return result != null ? result : false;
    }

    /**
     * 获取API的登录账号
     *
     * @param request
     * @return
     */
    public static String getApiKey(HttpServletRequest request) {
        String authorizationHeader = request.getHeader("Authorization");
        String authorization = Tool.decodeBase64(authorizationHeader.substring(6));
        return authorization.substring(0, authorization.indexOf(":"));
    }


}
