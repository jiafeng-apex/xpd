package com.xinpengdu.common.enums.access;

import java.util.ArrayList;
import java.util.List;

/**
 * 作用域（权限、角色、费用模板等）
 * @author 杨龙
 *
 */
public enum SCOPE {
	
	/**
	 * 网站全局, 一般只给超级管理员
	 */
	GLOBAL {
		public String getScopeNameResourceId() {
			return "phrase.scope.global";
		}
	},
	
	/**
	 * 平台商, 提供平台供运营商运营, 能查看名下所有运营商相关信息
	 */
	PLATFORM {
		public String getScopeNameResourceId() {
			return "phrase.scope.platform";
		}
	},
	
	/**
	 * 公司范围内，运营商账号多半拥有这种权限范围
	 */
	COMPANY {
		public String getScopeNameResourceId() {
			return "phrase.scope.company";
		}
	},
	
	/**
	 * 限定电站组范围内
	 */
	STATION_GROUP {
		public String getScopeNameResourceId() {
			return "phrase.scope.station.group";
		}
	};
	
	/**
	 * 权限作用域是否小于
	 * @param scope
	 * @return
	 */
	public boolean lt(SCOPE scope) {
		return ordinal() > scope.ordinal();
	}
	
	/**
	 * 权限作用域是否小于等于
	 * @param scope
	 * @return
	 */
	public boolean le(SCOPE scope) {
		return ordinal() >= scope.ordinal();
	}
	
	/**
	 * 权限作用域是否大于
	 * @param scope
	 * @return
	 */
	public boolean gt(SCOPE scope) {
		return ordinal() < scope.ordinal();
	}
	
	/**
	 * 权限作用域是否大于等于
	 * @param scope
	 * @return
	 */
	public boolean ge(SCOPE scope) {
		return ordinal() <= scope.ordinal();
	}
	
	/**
	 * 获取作用域名称资源ID
	 * @return
	 */
	public abstract String getScopeNameResourceId();
	
	/**
	 * 获取当前作用域能操作的作用域
	 * @param action
	 * @return
	 */
	public List<SCOPE> getAllowScopes() {
		List<SCOPE> scopes = new ArrayList<SCOPE>();
		for(SCOPE scope : SCOPE.values()) {
			if(SCOPE.GLOBAL.equals(scope)														//禁止操作全局操作域
					|| (SCOPE.GLOBAL.equals(this) && !SCOPE.PLATFORM.equals(scope))				//全局操作域只能操作公司层级
					|| (SCOPE.PLATFORM.equals(this) && !SCOPE.COMPANY.equals(scope))) {			//平台作用域只能操作公司层级
				continue;
			}
			if(scope.le(this)) {
				scopes.add(scope);
			}
		}
		return scopes;
	}
	
}
