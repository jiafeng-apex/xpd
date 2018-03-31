package com.xinpengdu.common.enums.access;

import com.xinpengdu.entity.access.Role;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * 全局角色
 *
 */
public enum GLOBAL_ROLE {
	
	/**
	 * 超级管理员
	 */
	SUPER_ADMIN {
		public String getRoleNameResourceId() {
			return "phrase.default.role.super.admin";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.super.admin";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 平台商
	 */
	PLATFORM {
		public String getRoleNameResourceId() {
			return "phrase.default.role.company.platform";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.company.platform";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 运营商
	 */
	COMPANY_ADMIN {
		public String getRoleNameResourceId() {
			return "phrase.default.role.company.admin";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.company.admin";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 平台商财务人员
	 */
	PLATFORM_ACCOUNTANT {
		public String getRoleNameResourceId() {
			return "phrase.default.role.platform.accountant";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.platform.accountant";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 运营商财务人员
	 */
	COMPANY_ACCOUNTANT {
		public String getRoleNameResourceId() {
			return "phrase.default.role.company.accountant";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.company.accountant";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	PLATFORM_READONLY {
		public String getRoleNameResourceId() {
			return "phrase.default.role.platform.readonly";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.platform.readonly";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	COMPANY_READONLY {
		public String getRoleNameResourceId() {
			return "phrase.default.role.company.readonly";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.company.readonly";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return ACTION.viewOnly(action);
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 维护员
	 */
//	MAINTAINER {
//		public String getRoleNameResourceId() {
//			return "phrase.default.role.maintainer";
//		}
//		public String getDescriptionResourceId() {
//			return "phrase.default.role.description.maintainer";
//		}
//		public boolean isAllowGlobalScopeAction(ACTION action) {
//			return ACTION.viewOnly(action);
//		}
//		public boolean isAllowPlatformScopeAction(ACTION action) {
//			return ACTION.viewOnly(action);
//		}
//		public boolean isAllowCompanyScopeAction(ACTION action) {
//			return true;
//		}
//		public boolean isAllowStationGroupScopeAction(ACTION action) {
//			return true;
//		}
//	},
	
	/**
	 * 分析员
	 */
//	ANALYSER {
//		public String getRoleNameResourceId() {
//			return "phrase.default.role.analyser";
//		}
//		public String getDescriptionResourceId() {
//			return "phrase.default.role.description.analyser";
//		}
//		public boolean isAllowGlobalScopeAction(ACTION action) {
//			return ACTION.viewOnly(action);
//		}
//		public boolean isAllowPlatformScopeAction(ACTION action) {
//			return ACTION.viewOnly(action);
//		}
//		public boolean isAllowCompanyScopeAction(ACTION action) {
//			return true;
//		}
//		public boolean isAllowStationGroupScopeAction(ACTION action) {
//			return true;
//		}
//	},
	
	/**
	 * 将设备信息共享给我司平台的云平台
	 */
	IN_CLOUD_PLATFORM {
		public String getRoleNameResourceId() {
			return "phrase.default.role.in.cloud.platform";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.in.cloud.platform";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 能获取我司平台设备信息的云平台
	 */
	OUT_CLOUD_PLATFORM {
		public String getRoleNameResourceId() {
			return "phrase.default.role.out.cloud.platform";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.out.cloud.platform";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return true;
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	},
	
	/**
	 * 普通用户
	 */
	NORMAL_USER {
		public String getRoleNameResourceId() {
			return "phrase.default.role.normal.user";
		}
		public String getDescriptionResourceId() {
			return "phrase.default.role.description.normal.user";
		}
		public boolean isAllowGlobalScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowPlatformScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowCompanyScopeAction(ACTION action) {
			return false;
		}
		public boolean isAllowStationGroupScopeAction(ACTION action) {
			return false;
		}
	};
	
	/**
	 * 获取默认角色名称资源ID
	 * @return
	 */
	public abstract String getRoleNameResourceId();
	
	/**
	 * 获取默认角色描述信息资源ID
	 * @return
	 */
	public abstract String getDescriptionResourceId();
	/**
	 * 获取角色名称
	 * @param locale
	 * @return
	 */
	public String getRoleName(Locale locale) {
		return getRoleNameResourceId();
	}

	/**
	 * 获取角色描述信息
	 * @param locale
	 * @return
	 */
	public String getDescription(Locale locale) {
		return getDescriptionResourceId();
	}


	/**
	 * 创建一个Role对象
	 * @param locale
	 * @return
	 */
	public Role getInstance(Locale locale) {
		Role role = new Role();
		role.setRoleName(getRoleName(locale));
		role.setDescription(getDescription(locale));
		return role;
	}
	
	/**
	 * 该角色全局作用域是否可执行对应操作
	 * VIEW: 查看具有该角色的公司用户
	 * ADD: 给一个公司账号添加本角色
	 * @param action
	 * @return
	 */
	public abstract boolean isAllowGlobalScopeAction(ACTION action);
	
	/**
	 * 该角色平台作用域是否可执行对应操作
	 * @param action
	 * @return
	 */
	public abstract boolean isAllowPlatformScopeAction(ACTION action);
	
	/**
	 * 该角色公司作用域是否可执行对应操作
	 * VIEW: 查看具有该角色的公司用户
	 * ADD: 给一个公司账号添加本角色
	 * @param action
	 * @return
	 */
	public abstract boolean isAllowCompanyScopeAction(ACTION action);
	
	/**
	 * 该角色电站组作用域是否可执行对应操作
	 * @param action
	 * @return
	 */
	public abstract boolean isAllowStationGroupScopeAction(ACTION action);
	
	/**
	 * 检测指定作用域是否可执行对应操作
	 * @param scope
	 * @param action
	 * @return
	 */
	public boolean isAllowAction(SCOPE scope, ACTION action) {
		if(SCOPE.GLOBAL.equals(scope)) {
			return isAllowGlobalScopeAction(action);
		} else if(SCOPE.PLATFORM.equals(scope)) {
			return isAllowPlatformScopeAction(action);
		} else if(SCOPE.COMPANY.equals(scope)) {
			return isAllowCompanyScopeAction(action);
		} else if(SCOPE.STATION_GROUP.equals(scope)) {
			return isAllowStationGroupScopeAction(action);
		}
		return false;
	}
	
	/**
	 * 允许指定作用域执行当前操作的全局角色集合
	 * @param scope
	 * @param action
	 * @return
	 */
	public static List<GLOBAL_ROLE> getActionAllowRoles(SCOPE scope, ACTION action) {
		List<GLOBAL_ROLE> globalRoles = new ArrayList<GLOBAL_ROLE>();
		for(GLOBAL_ROLE globalRole : GLOBAL_ROLE.values()) {
			if((SCOPE.GLOBAL.equals(scope) && globalRole.isAllowGlobalScopeAction(action))
					|| (SCOPE.PLATFORM.equals(scope) && globalRole.isAllowPlatformScopeAction(action))
					|| (SCOPE.COMPANY.equals(scope) && globalRole.isAllowCompanyScopeAction(action))
					|| (SCOPE.STATION_GROUP.equals(scope) && globalRole.isAllowStationGroupScopeAction(action))) {
				globalRoles.add(globalRole);
			}
		}
		return globalRoles;
	}
}
