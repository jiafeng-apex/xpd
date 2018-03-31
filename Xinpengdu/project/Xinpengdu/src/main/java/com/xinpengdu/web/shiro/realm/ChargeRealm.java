package com.xinpengdu.web.shiro.realm;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

/**
 * @author
 */
public class ChargeRealm extends AuthorizingRealm {
//
//	@Autowired
//	private PlatformApiKeyRecordService platformApiKeyRecordService;

	/**
	 * 为当前登录的Subject授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		String currentUsername = (String) super.getAvailablePrincipal(principals);
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		// 实际中可能会从数据库取得角色权限信息
		if (currentUsername != null) {
			// 添加一个角色,不是配置意义上的添加,而是证明该用户拥有APP角色
			simpleAuthorInfo.addRole("APP");
			// 添加权限
			simpleAuthorInfo.addStringPermission("APP:XINPENGDU");
			System.out.println("已为用户[" + currentUsername + "]赋予了[APP]角色和[APP:XINPENGDU]权限");
			return simpleAuthorInfo;
		}
		// 若该方法什么都不做直接返回null的话,就会导致任何用户访问时都会自动跳转到unauthorizedUrl指定的地址
		// 详见applicationContext.xml中的<bean id="shiroFilter">的配置
		return null;
	}

	/**
	 * 验证当前登录的Subject
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		// TODO Auto-generated method stub
		// 获取基于用户名和密码的令牌
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		// 两个token的引用都是一样的
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("验证当前Subject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		// 此处无需比对,比对的逻辑Shiro会做,我们只需返回一个和令牌相关的正确的验证信息
		// 说白了就是第一个参数填登录用户名,第二个参数填合法的登录密码(可以是从数据库中取到的,本例中为了演示就硬编码了)
		// 这样一来,在随后的登录页面上就只有这里指定的用户和密码才能通过验证
//		PlatformApiKeyRecord platformApiKeyRecord = platformApiKeyRecordService.getPlatformApiKeyRecord(token.getUsername());
//		if (platformApiKeyRecord != null) {
//			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(platformApiKeyRecord.getApiKey(), platformApiKeyRecord.getApiPassword(), this.getName());
//			this.setSession("currentUser", platformApiKeyRecord.getApiKey());
//			return authcInfo;
//		}
		// 没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
		return null;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}

}
