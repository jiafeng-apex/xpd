package com.xinpengdu.web.op.access.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

/**
 * 拦截根路径，跳转到项目首页
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeRedirect(HttpServletRequest request) {
		return new ModelAndView(new RedirectView(request.getContextPath() + "/op/login"));
	}

}
