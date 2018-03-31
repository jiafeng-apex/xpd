package com.xinpengdu.common.enums.menu;

import com.xinpengdu.common.enums.access.GLOBAL_ROLE;
import com.xinpengdu.common.enums.access.PERMISSION_ACTION;
import com.xinpengdu.common.enums.access.SCOPE;

/**
 * 菜单枚举
 * @author 杨龙
 *
 */
public enum MENU {

	/**
	 * 当前账号、一级菜单
	 */
	MENU_ACCOUNT_1 {
		public String getResourceId() {
			return "format.menu.account";
		}
		public String getUrl() {
			return "/op/system/urp/user/personal/show";
		}
		public String getIconClass() {
			return "img-circle";
		}
		public int getLevel() {
			return 1;
		}
		public MENU getParentMenu() {
			return null;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return true;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 个人信息、二级菜单
	 */
	MENU_USER_INFO_2 {
		public String getResourceId() {
			return "format.menu.user.info";
		}
		public String getUrl() {
			return "/op/system/urp/user/personal/show";
		}
		public String getIconClass() {
			return "icons-menu-user-info";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_ACCOUNT_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return true;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return true;
		}
	},

	/**
	 * 修改密码、二级菜单
	 */
	MENU_MODIFY_PASSWORD_2 {
		public String getResourceId() {
			return "format.menu.user.modify.password";
		}
		public String getUrl() {
			return "/op/system/urp/user/personal/modifyPassword";
		}
		public String getIconClass() {
			return "icons-menu-modify-password";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_ACCOUNT_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return true;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return true;
		}
	},

	/**
	 * 退出登录、二级菜单
	 */
	MENU_EXIT_2 {
		public String getResourceId() {
			return "format.menu.logout";
		}
		public String getUrl() {
			return "/op/logout";
		}
		public String getIconClass() {
			return "icons-menu-logout";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_ACCOUNT_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return true;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return true;
		}
	},

	/**
	 * 运营概要、一级菜单
	 */
	MENU_OVERVIEW_1 {
		public String getResourceId() {
			return "format.menu.analyze";
		}
		public String getUrl() {
			return "#";
		}
		public String getIconClass() {
			return "icons-menu-overview";
		}
		public int getLevel() {
			return 1;
		}
		public MENU getParentMenu() {
			return null;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 系统概览、二级菜单
	 */
	MENU_CHARGE_DATA_STATISTICS_2 {
		public String getResourceId() {
			return "format.menu.analyze.charge.data.statistics";
		}
		public String getUrl() {
			return "/op/analyze/charge/data/statistics";
		}
		public String getIconClass() {
			return "icons-menu-order-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
				case PLATFORM_ACCOUNTANT:
				case COMPANY_ACCOUNTANT:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 监控概览、二级菜单
	 */
	MENU_MONITOR_OVERVIEW_2 {
		public String getResourceId() {
			return "format.menu.overview";
		}
		public String getUrl() {
			return "/op/monitor/overview";
		}
		public String getIconClass() {
			return "icons-menu-analyze-overview";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
					return true;
				default:
					return true;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return true;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 运营概要、二级菜单
	 */
	MENU_ANALYZE_OVERVIEW_2 {
		public String getResourceId() {
			return "format.menu.analyze";
		}
		public String getUrl() {
			return "/op/analyze/overview";
		}
		public String getIconClass() {
			return "icons-menu-analyze-overview";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			if(PERMISSION_ACTION.WRITE.equals(permissionAction)) {
				switch(globalRole) {
					case SUPER_ADMIN:
					case PLATFORM:
					case PLATFORM_ACCOUNTANT:
					case PLATFORM_READONLY:
					case COMPANY_ADMIN:
					case COMPANY_ACCOUNTANT:
					case COMPANY_READONLY:
						return true;
					default:
						return false;
				}
			}
			return true;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return true;
		}
	},

	/**
	 * 站点指标、二级菜单
	 */
	MENU_ANALYZE_STATION_2 {
		public String getResourceId() {
			return "format.menu.analyze.station";
		}
		public String getUrl() {
			return "/op/analyze/station";
		}
		public String getIconClass() {
			return "icons-menu-analyze-station";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case PLATFORM_ACCOUNTANT:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 服务清单、二级菜单
	 */
	MENU_ANALYZE_ORDER_2 {
		public String getResourceId() {
			return "format.menu.analyze.order.list";
		}
		public String getUrl() {
			return "/op/analyze/order/list";
		}
		public String getIconClass() {
			return "icons-menu-order-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
				case PLATFORM_ACCOUNTANT:
				case COMPANY_ACCOUNTANT:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 充值记录、二级菜单
	 */
	MENU_APP_USER_RECHARGE_2 {
		public String getResourceId() {
			return "format.menu.analyze.recharge.list";
		}
		public String getUrl() {
			return "/op/analyze/appuser/recharge";
		}
		public String getIconClass() {
			return "icons-menu-order-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case PLATFORM_ACCOUNTANT:
					return true;
				case PLATFORM_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.PLATFORM);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 数据统计、二级菜单
	 */
	MENU_DATA_STATISTICS_2 {
		public String getResourceId() {
			return "format.menu.analyze.data.statistics";
		}
		public String getUrl() {
			return "/op/analyze/data/statistics";
		}
		public String getIconClass() {
			return "icons-menu-order-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
				case PLATFORM_ACCOUNTANT:
				case COMPANY_ACCOUNTANT:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 充电数据分析、二级菜单
	 */
	MENU_DATA_STATISTICS_ANALYZE_2 {
		public String getResourceId() {
			return "format.menu.analyze.charge.data.statistics.analyze";
		}
		public String getUrl() {
			return "/op/analyze/charge/data/statistics/analyze";
		}
		public String getIconClass() {
			return "icons-menu-order-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_OVERVIEW_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
				case PLATFORM_ACCOUNTANT:
				case COMPANY_ACCOUNTANT:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 配置管理、一级菜单
	 */
	MENU_CONFIG_1 {
		public String getResourceId() {
			return "format.menu.config";
		}
		public String getUrl() {
			return "#";
		}
		public String getIconClass() {
			return "icons-menu-config";
		}
		public int getLevel() {
			return 1;
		}
		public MENU getParentMenu() {
			return null;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 电站综合管理、二级菜单
	 */
	MENU_CONFIG_STATION_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.config.station.management";
		}
		public String getUrl() {
			return "/op/config/device/management/list";
		}
		public String getIconClass() {
			return "icons-menu-stations";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
//			case MAINTAINER:
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 电站组管理、二级菜单
	 */
	MENU_CONFIG_STATION_GROUP_2 {
		public String getResourceId() {
			return "format.menu.config.station.group";
		}
		public String getUrl() {
			return "/op/config/station/group/list";
		}
		public String getIconClass() {
			return "icons-menu-stations";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
//			case MAINTAINER:
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 电站管理、二级菜单
	 */
	MENU_CONFIG_STATION_2 {
		public String getResourceId() {
			return "format.menu.config.station";
		}
		public String getUrl() {
			return "/op/config/station/list";
		}
		public String getIconClass() {
			return "icons-menu-station";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 综合查询、二级菜单
	 */
	MENU_CONFIG_SUMMARY_SEARCH_2 {
		public String getResourceId() {
			return "format.menu.config.summary.search";
		}
		public String getUrl() {
			return "/op/config/summarySearch";
		}
		public String getIconClass() {
			return "icons-menu-config-param";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * EN-Gate管理、二级菜单
	 */
	MENU_CONFIG_EN_GATE_2 {
		public String getResourceId() {
			return "format.menu.config.device.engate";
		}
		public String getUrl() {
			return "/op/config/device/engate/list";
		}
		public String getIconClass() {
			return "icons-menu-engate";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 充电桩管理、二级菜单
	 */
	MENU_CONFIG_CHARGER_2 {
		public String getResourceId() {
			return "format.menu.config.device.charger";
		}
		public String getUrl() {
			return "/op/config/device/charger/list";
		}
		public String getIconClass() {
			return "icons-menu-charger";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 优惠活动、二级菜单
	 */
	MENU_CONFIG_PROMOTION_2 {
		public String getResourceId() {
			return "format.menu.config.promotion";
		}
		public String getUrl() {
			return "/op/config/promotion";
		}
		public String getIconClass() {
			return "icons-menu-config-param";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 运营参数、二级菜单
	 */
	MENU_CONFIG_PARAM_2 {
		public String getResourceId() {
			return "format.menu.config.param";
		}
		public String getUrl() {
			return "/op/config/param";
		}
		public String getIconClass() {
			return "icons-menu-config-param";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 电桩操作、二级菜单
	 */
	MENU_CONFIG_CHARGER_CONTROL_2 {
		public String getResourceId() {
			return "format.menu.config.control";
		}
		public String getUrl() {
			return "/op/config/device/charger/control";
		}
		public String getIconClass() {
			return "icons-menu-charger";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_CONFIG_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return false;
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 故障维修、一级菜单
	 */
	MENU_MAINTAIN_1 {
		public String getResourceId() {
			return "format.menu.maintain";
		}
		public String getUrl() {
			return "#";
		}
		public String getIconClass() {
			return "icons-menu-maintain";
		}
		public int getLevel() {
			return 1;
		}
		public MENU getParentMenu() {
			return null;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 原始告警列表、二级菜单
	 */
	MENU_MAINTAIN_ALARM_LIST_2 {
		public String getResourceId() {
			return "format.menu.maintain.alarm.list";
		}
		public String getUrl() {
			return "/op/maintain/event/list";
		}
		public String getIconClass() {
			return "icons-menu-alarm-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.GLOBAL);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 事件管理、二级菜单
	 */
	MENU_MAINTAIN_EVENT_LIST_2 {
		public String getResourceId() {
			return "format.menu.maintain.alarm.key.event.list";
		}
		public String getUrl() {
			return "/op/maintain/event/keyEventList";
		}
		public String getIconClass() {
			return "icons-menu-alarm-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
//			case MAINTAINER:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 异常事件管理、二级菜单
	 */
	MENU_MAINTAIN_EXCEPTION_EVENT_LIST_2 {
		public String getResourceId() {
			return "format.menu.maintain.alarm.key.exception.event.list";
		}
		public String getUrl() {
			return "/op/maintain/event/customEventList";
		}
		public String getIconClass() {
			return "icons-menu-alarm-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 告警通知配置、二级菜单
	 */
	MENU_MAINTAIN_ALARM_NOTICE_2 {
		public String getResourceId() {
			return "format.menu.maintain.alarm.notice";
		}
		public String getUrl() {
			return "/op/maintain/event/notice";
		}
		public String getIconClass() {
			return "icons-menu-alarm-config";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
//			case MAINTAINER:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 通讯调试、二级菜单
	 */
	MENU_MAINTAIN_DEBUG_COMMU_2 {
		public String getResourceId() {
			return "format.menu.maintain.debug.commu";
		}
		public String getUrl() {
			return "/op/maintain/debug/communicate";
		}
		public String getIconClass() {
			return "icons-menu-commu-debug";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 工作数据、二级菜单
	 */
	MENU_MAINTAIN_WORKING_DATA_2 {
		public String getResourceId() {
			return "format.menu.maintain.working.data";
		}
		public String getUrl() {
			return "/op/maintain/working/data";
		}
		public String getIconClass() {
			return "icons-menu-work-data";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_MAINTAIN_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_READONLY:
				case COMPANY_ADMIN:
					return true;
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 系统管理、一级菜单
	 */
	MENU_SYSTEM_1 {
		public String getResourceId() {
			return "format.menu.system";
		}
		public String getUrl() {
			return "#";
		}
		public String getIconClass() {
			return "icons-menu-system";
		}
		public int getLevel() {
			return 1;
		}
		public MENU getParentMenu() {
			return null;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			return false;
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 运营公司管理、二级菜单
	 */
	MENU_COMPANY_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.company";
		}
		public String getUrl() {
			return "/op/system/company/list";
		}
		public String getIconClass() {
			return "icons-menu-company-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
					return true;
				case PLATFORM_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return true;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 运营用户管理、二级菜单
	 */
	MENU_COMPANY_USER_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.company.user";
		}
		public String getUrl() {
			return "/op/system/urp/user/list";
		}
		public String getIconClass() {
			return "icons-menu-company-user-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return true;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * IC卡用户管理、二级菜单
	 */
	MENU_IC_CARD_USER_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.card.user";
		}
		public String getUrl() {
			return "/op/system/card/user/list";
		}
		public String getIconClass() {
			return "icons-menu-ic-user";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return true;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 车主管理、二级菜单
	 */
	MENU_APP_USER_MANAGER_2 {
		public String getResourceId() {
			return "format.menu.system.app.user";
		}
		public String getUrl() {
			return "/op/app/user/list";
		}
		public String getIconClass() {
			return "icons-menu-company-user-list";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
					return true;
				case PLATFORM_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.PLATFORM);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 费率推送记录、二级菜单
	 */
	MENU_ELEC_FEE_PUSH_RECORD_2 {
		public String getResourceId() {
			return "format.menu.analyze.push.record";
		}
		public String getUrl() {
			return "/op/analyze/push/record";
		}
		public String getIconClass() {
			return "icons-user-funds";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 角色权限管理、二级菜单
	 */
	MENU_ROLE_PERMISSION_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.role.permission";
		}
		public String getUrl() {
			return "/op/system/urp/role/list";
		}
		public String getIconClass() {
			return "icons-menu-role-permission";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM:
				case COMPANY_ADMIN:
					return true;
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return true;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 平台商资金管理、二级菜单
	 */
	MENU_PLATFORM_FUND_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.platform.fund";
		}
		public String getUrl() {
			return "/op/system/platformFund";
		}
		public String getIconClass() {
			return "icons-menu-platform-fund";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				case PLATFORM:
				case PLATFORM_ACCOUNTANT:
					return true;
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.PLATFORM);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 平台商资金打款、二级菜单
	 */
	MENU_COMPANY_FUND_LIST_2 {
		public String getResourceId() {
			return "format.menu.system.company.fund.list";
		}
		public String getUrl() {
			return "/op/system/companyFund/list";
		}
		public String getIconClass() {
			return "icons-menu-platform-payment";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				case PLATFORM:
				case PLATFORM_ACCOUNTANT:
					return true;
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.PLATFORM);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 运营商资金管理、二级菜单
	 */
	MENU_COMPANY_FUND_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.company.fund";
		}
		public String getUrl() {
			return "/op/system/companyFund";
		}
		public String getIconClass() {
			return "icons-menu-company-fund";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			switch(globalRole) {
				case SUPER_ADMIN:
				case PLATFORM_READONLY:
				case COMPANY_READONLY:
					return PERMISSION_ACTION.READ.equals(permissionAction);
				case COMPANY_ADMIN:
				case COMPANY_ACCOUNTANT:
					return true;
				default:
					return false;
			}
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return scope != null && scope.ge(SCOPE.COMPANY);
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 平台参数管理、二级菜单
	 */
	MENU_PLATFORM_INFO_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.platform.info";
		}
		public String getUrl() {
			return "/op/system/platformInfo/list";
		}
		public String getIconClass() {
			return "icons-menu-platform-param";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 对接系统管理、二级菜单
	 */
	MENU_API_API_SYS_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.api.sys.info";
		}
		public String getUrl() {
			return "/op/api/sys/list";
		}
		public String getIconClass() {
			return "icons-menu-platform-param";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 邮件发送配置、二级菜单
	 */
	MENU_MAIL_SENDER_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.mail.sender";
		}
		public String getUrl() {
			return "/op/system/mailSender";
		}
		public String getIconClass() {
			return "icons-menu-mail-sender";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},

	/**
	 * 服务器集群管理、二级菜单
	 */
	MENU_SERVER_MANAGE_2 {
		public String getResourceId() {
			return "format.menu.system.server";
		}
		public String getUrl() {
			return "/op/system/server/list";
		}
		public String getIconClass() {
			return "icons-menu-server";
		}
		public int getLevel() {
			return 2;
		}
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}
		public boolean allowEveryOneAccess() {
			return false;
		}
	},
	MENU_SYSTEM_MENU_MANAGE_2 {
		@Override
		public String getResourceId() {
			return "format.menu.system.menu.manage";
		}

		@Override
		public String getUrl() {
			return "/op/system/urp/permission/menu/list";
		}

		@Override
		public String getIconClass() {
			return "icons-menu-server";
		}

		@Override
		public int getLevel() {
			return 2;
		}

		@Override
		public MENU getParentMenu() {
			return MENU_SYSTEM_1;
		}

		@Override
		public boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction) {
			return GLOBAL_ROLE.SUPER_ADMIN.equals(globalRole);
		}

		@Override
		public boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction) {
			switch(permissionAction) {
				case READ:
				case WRITE:
					return true;
				default:
					return false;
			}
		}

		@Override
		public boolean checkScopeActionPermission(SCOPE scope) {
			return false;
		}

		@Override
		public boolean allowEveryOneAccess() {
			return false;
		}
	};

	/**
	 * 获取资源ID
	 * @return
	 */
	public abstract String getResourceId();

	/**
	 * 获取跳转相对路径
	 * @return
	 */
	public abstract String getUrl();

	/**
	 * 获取菜单对应的图片CSS类
	 * @return
	 */
	public abstract String getIconClass();

	/**
	 * 获取菜单级别
	 * @return
	 */
	public abstract int getLevel();

	/**
	 * 获取父菜单
	 * @return
	 */
	public abstract MENU getParentMenu();

	/**
	 * 检测某个角色是否具有本菜单的相关操作权限
	 * @param globalRole
	 * @param permissionAction
	 * @return
	 */
	public abstract boolean checkRolePermissionAction(GLOBAL_ROLE globalRole, PERMISSION_ACTION permissionAction);

	/**
	 * 检测某个页面是否有对应的权限操作存在
	 * @param permissionAction
	 * @return
	 */
	public abstract boolean checkPermissionActionExist(PERMISSION_ACTION permissionAction);

	/**
	 * 检测各作用域的用户是否有权限分配本菜单权限
	 * @param scope
	 * @return
	 */
	public abstract boolean checkScopeActionPermission(SCOPE scope);

	/**
	 * 允许任何人访问
	 * @return
	 */
	public abstract boolean allowEveryOneAccess();

}
