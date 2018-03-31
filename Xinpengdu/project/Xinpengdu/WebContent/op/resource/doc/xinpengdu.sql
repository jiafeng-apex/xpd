-- 操作人员管理
drop table if exists operater;
create table operater(
  operaterId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,      -- 员工编号
  loginName varchar(32) not null,                                 -- 登录名
  operaterName varchar(32) not null,                              -- 姓名
  operaterPwd varchar(32) not null,                               -- 密码
  deptName varchar(32) not null,                                  -- 部门
  postId varchar(50) not null,                                    -- 岗位
  createDate varchar(32) not null,                                -- 创建时间
  lastUpdateDate varchar(32) not null                             -- 最后更新时间
);
insert into operater(loginName,operaterName,operaterPwd,deptName,postId,createDate,lastUpdateDate) values
  ('admin','admin','admin123',1,1,now(),now());

-- 工程基本信息
drop table if exists projectInfo;
create table projectInfo(
  projectId varchar(50) PRIMARY KEY,
  tellPhone varchar(32) not null,
  partyName varchar(32) not null,
  projectName varchar(32) not null,
  isFinish varchar(32) not null,
  addValueTaxType varchar(32) not null,
  invoiceSyncDate varchar(32) not null,
  isAddBankInfo varchar(2) not null,
  signedDate varchar(32) not null,
  contractAcount varchar(32) not null,
  clearingAcount varchar(32),
  projectType varchar(32) not null,
  projectTypeName varchar(32),
  projectAddr varchar(32),
  pmId varchar(50) not null,
  pmName varchar(32),
  projectRateId varchar(50),
  remarkOne varchar(32),
  remarkTwo varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 项目经理
drop table if exists projectManager;
create table projectManager(
  pmId varchar(50) PRIMARY KEY,
  pmName varchar(32) not null,
  pmSex varchar(32),
  pmPhone varchar(32) not null,
  pmTelphone varchar(32),
  pmFax varchar(32),
  pmEmail varchar(32),
  projectTotal varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 工程费率
drop table if exists projectRate;
create table projectRate(
  projectRateId varchar(50)  PRIMARY KEY,
  projectId varchar(50) not null,
  projectTollId varchar(50),
  manageRate varchar(32) not null,
  warrantyRate varchar(32) not null,
  supplementaryBusinessTax varchar(32) not null,
  corporateIncomeTax varchar(32) not null,
  individualIncomeTax varchar(32) not null,
  stampDutyRate varchar(32) not null,
  otherTaxRate varchar(32) not null,
  vatSalesTax varchar(32) not null,
  cityBuildTax varchar(32) not null,
  localEducationAttached varchar(32) not null,
  educationSurcharge varchar(32) not null,
  waterBuildIncome varchar(32) not null,
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 工程收费
drop table if exists projectToll;
create table projectToll(
  projectTollId varchar(50) PRIMARY KEY,
  projectId varchar(50) not null,
  projectRateId varchar(50),
  externalGeldId varchar(50),
  projectTollDate varchar(32),
  automaticCalculation varchar(32),
  summary varchar(32),
  importAmount varchar(32),
  exportAmount varchar(32),
  materialGeld varchar(32),
  labourServiceFee varchar(32),
  manageCost varchar(32),
  warrantyAmount varchar(32),
  backWarrantyAmount varchar(32),
  otherAmount varchar(32),
  vatSalesTax varchar(32),
  vatIncomeTax varchar(32),
  cityBuildTax varchar(32),
  educationSurcharge varchar(32),
  localEducationAttached varchar(32),
  stampDuty varchar(32),
  individualIncomeTax varchar(32),
  corporateIncomeTax varchar(32),
  waterBuildIncome varchar(32),
  otherTax varchar(32),
  supplementaryBusinessTax varchar(32),
  interest varchar(32),
  companyFunds varchar(32),
  localBankDeposit varchar(32),
  localBankDepositBak varchar(32),
  balance varchar(32),
  balanceBak varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);


-- 发票
drop table if exists invoice;
create table invoice(
  invoiceId varchar(50) PRIMARY KEY,
  projectId varchar(50) not null,
  externalInvoiceId varchar(50),
  invoiceNumber varchar(32),
  invoiceDate varchar(32),
  summary varchar(32),
  taxRate varchar(32),
  invoiceAmount varchar(32),
  taxTotal varchar(32),
  tax varchar(32),
  invoiceType varchar(32),
  incomeTaxCalcType varchar(2),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);


-- 发票税单
drop table if exists invoiceTaxBill;
create table invoiceTaxBill(
  invoiceTaxBillId varchar(50) PRIMARY KEY,
  invoiceId varchar(50) not null,
  projectId varchar(50) not null,
  tollageType varchar(5) not null,
  addedValueTax varchar(32),
  addedValueTaxValue varchar(32),
  constructionTax varchar(32),
  constructionTaxValue varchar(32),
  areaEducationalSurtax varchar(32),
  areaEducationalSurtaxValue varchar(32),
  educationalSurtax varchar(32),
  educationalSurtaxValue varchar(32),
  individualIncomeTax varchar(32),
  individualIncomeTaxValue varchar(32),
  corporateIncomeTax varchar(32),
  corporateIncomeTaxValue varchar(32),
  otherTax varchar(32),
  otherTaxValue varchar(32),
  stampDuty varchar(32),
  stampDutyValue varchar(32),
  waterBuildTax varchar(32),
  waterBuildTaxValue varchar(32),
  taxPeriod varchar(32),
  taxBillTotal varchar(32),
  szSubtotal varchar(32),
  localSubtotal varchar(32),
  nationalTaxBillNo varchar(32),
  landTaxNo varchar(200),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 收据
drop table if exists receipt;
create table receipt(
  receiptId varchar(50) PRIMARY KEY,
  projectId varchar(50) not null,
  receiptDate varchar(32),
  receiptNO varchar(32),
  receiptAmount varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 银行录入信息
drop table if exists bankInput;
create table bankInput(
  bankId varchar(50) PRIMARY KEY,
  projectId varchar(50),
  bankName varchar(32)  NOT NULL,
  depositBank varchar(32)  NOT NULL,
  bankAccount varchar(32)  NOT NULL,
  cachet varchar(32)  NOT NULL,
  financialSeal varchar(32)  NOT NULL,
  personalSeal varchar(32)  NOT NULL,
  depositBankAddr varchar(32)  NOT NULL,
  otherSeal varchar(32),
  remark varchar(32),
  createDate varchar(32)  NOT NULL,
  lastUpdateDate varchar(32)  NOT NULL
);

-- 授权人信息
drop table if exists certigier;
create table certigier(
  certigierId varchar(50)  PRIMARY KEY,
  projectId varchar(50) not null,
  certigierName varchar(32),
  certigierTel varchar(32),
  accreditStart varchar(32),
  accreditEnd varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 外出证管理
drop table if exists evection;
create table evection(
  evectionId varchar(50) PRIMARY KEY,
  projectId varchar(50) not null,
  evectionNO varchar(32),
  startDate varchar(32),
  endDate varchar(32),
  evectionAmount varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

--  外出证延期信息
drop table if exists evectionPostpone;
create table evectionPostpone(
  postponeId varchar(50) PRIMARY KEY,
  evectionId varchar(50) not null,
  postponeNumber varchar(32),
  postponeStartDate varchar(32),
  postponeEndDate varchar(32),
  postponeAmount varchar(32),
  remark varchar(32),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);


-- 材料合同
drop table if exists  materialContract;
create table materialContract(
  materialContractId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  supplierName varchar(32),
  telephone varchar(32),
  address varchar(32),
  openingBank varchar(32),
  accountNumber varchar(32),
  signingDate varchar(32),
  materialName varchar(32),
  taxIdentificationNumber varchar(32),
  quantity varchar(32),
  unitPrice varchar(32),
  contractAmount varchar(32),
  settlementAmount varchar(32),
  remark varchar(200),
  createDate varchar(32) not null,
  lastUpdateDate varchar(32) not null
);

-- 材料支付款
drop table if exists  materialGeld;
create table materialGeld(
  materialGeldId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  materialContractId varchar(50),
  payDate varchar(32),
  summary varchar(32),
  payAmount varchar(32),
  cumulativePayAmount varchar(32),
  noPayAmount varchar(32),
  isAutoTransfer varchar(32),
  remark varchar(200),
  createDate varchar(32),
  lastUpdateDate varchar(32)
);

-- 材料发票
drop table if exists  materialInvoice;
create table materialInvoice(
  materialInvoiceId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  materialContractId varchar(50),
  invoiceNumber varchar(32),
  registrationDate varchar(32),
  summary varchar(32),
  invoiceDate varchar(32),
  amount varchar(32),
  taxRate varchar(32),
  taxAmount varchar(32),
  taxPrice varchar(32),
  goodsName varchar(32),
  invoiceType varchar(32),
  remark varchar(32),
  externalInvoiceId varchar(50),
  createDate varchar(32),
  lastUpdateDate varchar(32)
);

-- 劳务费
drop table if exists labourServiceFee;
create table labourServiceFee(
  labourServiceFeeId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  serviceBusinessName varchar(32),
  telephone varchar(32),
  address varchar(32),
  companyOpeningBank varchar(32),
  accountOpeningAaccount varchar(32),
  signingDate varchar(32),
  laburServiceMaterial varchar(50),
  taxIdentificationNumber varchar(32),
  quantity varchar(32),
  unitPrice varchar(32),
  contractAmount varchar(32),
  settlementAmount varchar(32),
  remark varchar(32),
  createDate varchar(32),
  lastUpdateDate varchar(32)
);

-- 劳务支付款
drop table if exists labourServiceGeld;
create table labourServiceGeld(
  labourServiceGeldId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  labourServiceFeeId varchar(50),
  payDate varchar(32),
  summary varchar(32),
  payAmount varchar(32),
  cumulativePayAmount varchar(32),
  noPayAmount varchar(32),
  isAutoTransfer varchar(32),
  remark varchar(32),
  createDate varchar(32),
  lastUpdateDate varchar(32)
);

-- 劳务发票
drop table if exists  labourServiceInvoice;
create table labourServiceInvoice(
  labourServiceInvoiceId  varchar(50) PRIMARY KEY,
  projectId varchar(50),
  labourServiceFeeId varchar(50),
  invoiceNumber varchar(32),
  registrationDate varchar(32),
  summary varchar(32),
  invoiceDate varchar(32),
  amount varchar(32),
  taxRates varchar(32),
  taxAmount varchar(32),
  taxPriceAmount varchar(32),
  goodsName varchar(32),
  invoiceType varchar(32),
  remark varchar(32),
  externalInvoiceId varchar(50),
  createDate varchar(32),
  lastUpdateDate varchar(32)
);

-- 菜单
drop table if exists  t_menu;
create table t_menu (
  menuId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  menuName varchar(20) NOT NULL,
  menuCode varchar(40) NOT NULL,
  url varchar(100) NOT NULL,
  iconClass varchar(50) NOT NULL,
  level int(11) NOT NULL,
  parentMenuId bigint(20) DEFAULT NULL,
  configurable bit(1) NOT NULL,
  createTime datetime NOT NULL,
  menuOrder int(11) NOT NULL
);
insert into t_menu(menuId,menuName,menuCode,url,iconClass,level,parentMenuId,configurable,createTime,menuOrder) values
  (1,'工程核算','MENU_PROJECT_INFO','/op/projectInfo/list','icons-menu-project',1,null,1,now(),1),
  (2,'统计报表','MENU_PROJECT_STATS','/op/statistics/list','icons-menu-stats',1,null,1,now(),2),
  (3,'项目经理','MENU_PROJECT_PM','/op/projectManager/list','icons-menu-pm',1,null,1,now(),3),
  (4,'银行账户','MENU_PROJECT_BANK','/op/projectBank/list','icons-menu-bank',1,null,1,now(),4),
  (5,'用户管理','MENU_PROJECT_USER','/op/operater/list','icons-menu-operater',1,null,1,now(),5),
  (6,'工程收费','MODEL_PROJECT_TOLL','','',2,1,1,now(),6),
  (7,'工程发票','MODEL_PROJECT_INVOICE','','',2,1,1,now(),7),
  (8,'授权人','MODEL_PROJECT_CERTIGIER','','',2,1,1,now(),8),
  (9,'工程收据','MODEL_PROJECT_RECEIPT','','',2,1,1,now(),9),
  (10,'银行','MODEL_PROJECT_BANK','','',2,1,1,now(),10),
  (11,'外出证','MODEL_PROJECT_EVECTION','','',2,1,1,now(),11),
  (12,'材料合同','MODEL_PROJECT_MATERIALCONTRACT','','',2,1,1,now(),12),
  (13,'材料支付款','MODEL_PROJECT_MATERIALGELD','','',2,1,1,now(),13),
  (14,'材料发票','MODEL_PROJECT_MATERIALINVOICE','','',2,1,1,now(),14),
  (15,'劳务费','MODEL_PROJECT_LABOURSERVICEFEE','','',2,1,1,now(),15),
  (16,'劳务支付款','MODEL_PROJECT_LABOURSERVICEGELD','','',2,1,1,now(),16),
  (17,'劳务发票','MODEL_PROJECT_LABOURSERVICEINVOICE','','',2,1,1,now(),17),
  (18,'外出证延期','MODEL_EVECTION_POSTPONE','','',2,1,1,now(),18);


-- 权限
drop table if exists  t_role;
create table t_role (
  roleId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  roleName varchar(30) NOT NULL,
  requiredUserType varchar(20) DEFAULT NULL,
  editable bit(1) DEFAULT NULL,
  remarks varchar(255) DEFAULT NULL
);
insert into t_role(roleName,requiredUserType,editable,remarks) VALUES
  ('系统管理员','SYSTEM_ADMIN',0,'管理员，拥有网站最高权限');
insert into t_role(roleName,requiredUserType,editable,remarks) VALUES
  ('一般管理员','NORMAL_ADMIN',0,'一般管理员，默认只有工程核算的读权限');


-- 权限分配表 按角色
drop table if exists  t_role_permission_record;
create table t_role_permission_record (
  recordId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  roleId bigint(20) NOT NULL,
  permissionCode varchar(10) NOT NULL,
  menuId bigint(20) NOT NULL
);
insert into t_role_permission_record(roleId,permissionCode,menuId) values
  (1,'READ',1),
  (1,'WRITE',1),
  (1,'READ',2),
  (1,'WRITE',2),
  (1,'READ',3),
  (1,'WRITE',3),
  (1,'READ',4),
  (1,'WRITE',4),
  (1,'READ',5),
  (1,'WRITE',5);

-- 权限分配表 按用户
drop table if exists  t_user_permission_record;
create table t_user_permission_record (
  recordId bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userId bigint(20) NOT NULL,
  permissionCode varchar(10) NOT NULL,
  menuId bigint(20) NOT NULL
);

insert into t_user_permission_record(userId,permissionCode,menuId) values
  (1,'READ',1),
  (1,'WRITE',1),
  (1,'READ',2),
  (1,'WRITE',2),
  (1,'READ',3),
  (1,'WRITE',3),
  (1,'READ',4),
  (1,'WRITE',4),
  (1,'READ',5),
  (1,'WRITE',5),
  (1,'READ',6),
  (1,'WRITE',6),
  (1,'READ',7),
  (1,'WRITE',7),
  (1,'READ',8),
  (1,'WRITE',8),
  (1,'READ',9),
  (1,'WRITE',9),
  (1,'READ',10),
  (1,'WRITE',10),
  (1,'READ',11),
  (1,'WRITE',11),
  (1,'READ',12),
  (1,'WRITE',12),
  (1,'READ',13),
  (1,'WRITE',13),
  (1,'READ',14),
  (1,'WRITE',14),
  (1,'READ',15),
  (1,'WRITE',15),
  (1,'READ',16),
  (1,'WRITE',16),
  (1,'READ',17),
  (1,'WRITE',17),
  (1,'READ',18),
  (1,'WRITE',18);