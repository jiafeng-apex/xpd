package com.xinpengdu.common.enums.access;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * 权限枚举
 *
 */
public enum PERMISSION {
	
	/**
	 * 公司管理权限
	 */
	COMPANY_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.company.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.company.manage";
		}
	},
	
	/**
	 * 运营账号管理权限
	 */
	COMPANY_USER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.company.user.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.company.user.manage";
		}
	},
	
	/**
	 * 角色管理权限
	 */
	ROLE_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.role.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.role.manage";
		}
	},
	
	/**
	 * 查看监控数据
	 */
	VIEW_MONITOR {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			return true;
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.view.monitor";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.view.monitor";
		}
	},
	
	/**
	 * 统计分析
	 */
	OPERATE_ANALYZE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case PLATFORM_ACCOUNTANT:
			case COMPANY_ADMIN:
			case COMPANY_ACCOUNTANT:
//			case ANALYSER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.analyze";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.analyze";
		}
	},
	
	/**
	 * 运营参数管理权限
	 */
	OPERATE_PARAM_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.description.station.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.operate.param.manage";
		}
	},
	
	/**
	 * 平台商参数管理权限
	 */
	PLATFORM_INFO_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.platform.info.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.platform.info.manage";
		}
	},
	
	/**
	 * 邮件发送管理权限
	 */
	MAIL_SENDER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.mail.sender.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.mail.sender.manage";
		}
	},
	
	/**
	 * 服务器集群管理权限
	 */
	SERVER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.server.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.server.manage";
		}
	},
	
	/**
	 * 调试通讯权限
	 */
	DEBUG_COMMUNICATE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.debug.communicate";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.debug.communicate";
		}
		
	},
	
	/**
	 * 远程升级权限
	 */
	REMOTE_UPDATE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}
		
		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.remote.update";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.remote.update";
		}
	},
	
	/**
	 * 电站组管理权限
	 */
	STATION_GROUP_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case MAINTAINER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.station.group.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.station.group.manage";
		}
	},
	
	/**
	 * 电站管理权限
	 */
	STATION_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case MAINTAINER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.station.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.station.manage";
		}
	},
	
	/**
	 * EN-Gate管理
	 */
	DEVICE_GATE_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case MAINTAINER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.device.gate.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.device.gate.manage";
		}
	},
	
	/**
	 * 充电桩管理
	 */
	DEVICE_CHARGER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case MAINTAINER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.device.charger.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.device.charger.manage";
		}
	},
	
	/**
	 * 业务管理
	 */
	ORDER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case ANALYSER:
			case PLATFORM_ACCOUNTANT:
			case COMPANY_ACCOUNTANT:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.order.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.order.manage";
		}
	},
	
	/**
	 * 优惠活动管理
	 */
	PROMOTION_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case COMPANY_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.promotion.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.promotion.manage";
		}
	},
	
	/**
	 * 告警事件管理
	 */
	EVENT_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case COMPANY_ADMIN:
//			case MAINTAINER:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return true;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.event.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.event.manage";
		}
	},
	
	/**
	 * 运营商资金管理
	 */
	COMPNAY_FUND_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
//			case PLATFORM:
			case COMPANY_ADMIN:
//			case PLATFORM_ACCOUNTANT:
			case COMPANY_ACCOUNTANT:
				return true;
			default:
				return false;
			}
		}
		
		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.company.fund.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.company.fund.manage";
		}
	},
	
	/**
	 * 平台商资金管理
	 */
	PLATFORM_FUND_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
			case PLATFORM:
			case PLATFORM_ACCOUNTANT:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.platform.fund.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.platform.fund.manage";
		}
	},
	
	/**
	 * 批量上传充电桩序列号权限
	 */
	UPLOAD_DEVICE_CHARGER_MANAGE {
		public boolean check(GLOBAL_ROLE globalRoleEnum) {
			switch(globalRoleEnum) {
			case SUPER_ADMIN:
				return true;
			default:
				return false;
			}
		}

		public boolean allowCustomize(SCOPE scope) {
			if(scope.equals(SCOPE.GLOBAL)) {
				return true;
			}
			return false;
		}
		public String getPermissionNameResourceId() {
			return "phrase.permission.upload.device.charger.manage";
		}
		public String getPermissionDescriptionResourceId() {
			return "phrase.permission.description.upload.device.charger.manage";
		}
	};
	
	/**
	 * 检测某个全局角色是否拥有该权限
	 * @param globalRoleEnum
	 * @return
	 */
	public abstract boolean check(GLOBAL_ROLE globalRoleEnum);
	
	/**
	 * 该权限是否允许分配给自定义角色
	 * @param scope 当前操作账号的权限作用域
	 * @return
	 */
	public abstract boolean allowCustomize(SCOPE scope);
	
	/**
	 * 获取所有允许被关联给自定义角色的权限
	 * @param scope 当前操作账号的权限作用域
	 * @return
	 */
	public static List<PERMISSION> getAllowCustomizePermissions(SCOPE scope) {
		List<PERMISSION> permissions = new ArrayList<PERMISSION>();
		for(PERMISSION permission : PERMISSION.values()) {
			if(permission.allowCustomize(scope)) {
				permissions.add(permission);
			}
		}
		return permissions;
	}
	
	/**
	 * 获取权限名称资源ID
	 * @return
	 */
	public abstract String getPermissionNameResourceId();
	
	/**
	 * 获取权限描述资源ID
	 * @return
	 */
	public abstract String getPermissionDescriptionResourceId();
	
	/**
	 * 获取权限名称
	 * @param locale
	 * @return
	 */
	public String getPermissionName(Locale locale) {
		return getPermissionNameResourceId();
	}
	
	/**
	 * 获取权限描述信息
	 * @param locale
	 * @return
	 */
	public String getPermissionDescription(Locale locale) {
		return getPermissionDescriptionResourceId();
	}
	
}
