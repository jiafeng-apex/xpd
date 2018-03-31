


--- sunjf 2017-12-22
alter table projectToll add localBankDepositBak varchar(32) not null;

--- sunjf 2017-12-2
-- projectInfo 表添加 isAddBankInfo字段
alter table projectInfo add isAddBankInfo varchar(2) not null;
update projectInfo set isAddBankInfo=1; -- 设置默认值
-- projectInfo 表修改 invoiceSyncDate可以为空
alter table projectInfo modify invoiceSyncDate varchar(2) null;




