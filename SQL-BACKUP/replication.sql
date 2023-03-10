/****** Scripting replication configuration. Script Date: 11/04/2022 6:35:20 pm ******/
/****** Please Note: For security reasons, all password parameters were scripted with either NULL or an empty string. ******/

/****** Begin: Script to be run at Publisher ******/

/****** Installing the server as a Distributor. Script Date: 11/04/2022 6:35:20 pm ******/
use master
exec sp_adddistributor @distributor = N'TUANBUI-NOV09', @password = N''
GO

-- Adding the agent profiles
-- Updating the agent profile defaults
exec sp_MSupdate_agenttype_default @profile_id = 1
GO
exec sp_MSupdate_agenttype_default @profile_id = 2
GO
exec sp_MSupdate_agenttype_default @profile_id = 4
GO
exec sp_MSupdate_agenttype_default @profile_id = 6
GO
exec sp_MSupdate_agenttype_default @profile_id = 11
GO

-- Adding the distribution databases
use master
exec sp_adddistributiondb @database = N'distribution', @data_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data', @data_file = N'distribution.MDF', @data_file_size = 77, @log_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data', @log_file = N'distribution.LDF', @log_file_size = 137, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @deletebatchsize_xact = 5000, @deletebatchsize_cmd = 2000, @security_mode = 1
GO

-- Adding the distribution publishers
exec sp_adddistpublisher @publisher = N'TUANBUI-NOV09', @distribution_db = N'distribution', @security_mode = 0, @login = N'sa', @password = N'', @working_directory = N'\\Tuanbui-nov09\repldata', @trusted = N'false', @thirdparty_flag = 0, @publisher_type = N'MSSQLSERVER'
GO


/****** End: Script to be run at Publisher ******/


-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'TN_CSDLPT', @optname = N'merge publish', @value = N'true'
GO

-- Adding the merge publication
use [TN_CSDLPT]
exec sp_addmergepublication @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @description = N'Cơ Sở 1', @sync_mode = N'native', @retention = 14, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_subdirectory = N'ftp', @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @dynamic_filters = N'false', @conflict_retention = 14, @keep_partition_changes = N'false', @allow_synctoalternate = N'false', @max_concurrent_merge = 0, @max_concurrent_dynamic_snapshots = 0, @use_partition_groups = N'true', @publication_compatibility_level = N'100RTM', @replicate_ddl = 1, @allow_subscriber_initiated_snapshot = N'false', @allow_web_synchronization = N'false', @allow_partition_realignment = N'true', @retention_period_unit = N'days', @conflict_logging = N'both', @automatic_reinitialization_policy = 0
GO


exec sp_addpublication_snapshot @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 500, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 0, @publisher_login = N'sa', @publisher_password = N''
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'DESKTOP-PRQ0DNG\t0168'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'NT Service\MSSQLSERVER'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @login = N'distributor_admin'
GO

-- Adding the merge articles
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'COSO', @source_owner = N'dbo', @source_object = N'COSO', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'[MACS] =''CS1''', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'MONHOC', @source_owner = N'dbo', @source_object = N'MONHOC', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'KHOA', @source_owner = N'dbo', @source_object = N'KHOA', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'GIAOVIEN', @source_owner = N'dbo', @source_object = N'GIAOVIEN', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'LOP', @source_owner = N'dbo', @source_object = N'LOP', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SINHVIEN', @source_owner = N'dbo', @source_object = N'SINHVIEN', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'BODE', @source_owner = N'dbo', @source_object = N'BODE', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'BANGDIEM', @source_owner = N'dbo', @source_object = N'BANGDIEM', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'GIAOVIEN_DANGKY', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @source_owner = N'dbo', @source_object = N'CT_BAITHI', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'true', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'CAUSO', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'MASV', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'MAMH', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'LAN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'CAUHOI', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'DACHON', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @column = N'rowguid', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'MY_SP_LAY_CAUHOI', @source_owner = N'dbo', @source_object = N'MY_SP_LAY_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'MY_SP_LAY_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_GHI_VAO_BANGDIEM', @source_owner = N'dbo', @source_object = N'SP_GHI_VAO_BANGDIEM', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_GHI_VAO_BANGDIEM', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_GIAOVIEN_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_GIAOVIEN_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_GIAOVIEN_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_KHOA_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_KHOA_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_KHOA_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_LOP_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_LOP_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_LOP_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_MONHOC_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_MONHOC_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_MONHOC_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_SINHVIEN_DATHI', @source_owner = N'dbo', @source_object = N'SP_KT_SINHVIEN_DATHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SINHVIEN_DATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_SINHVIEN_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_SINHVIEN_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SINHVIEN_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_SUA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_KT_SUA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SUA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_KT_XOA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_KT_XOA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_XOA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_DS_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_DS_KHOA', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_DS_LOP', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_DS_MONHOC', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @source_owner = N'dbo', @source_object = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_TT_GIANGVIEN_LOGIN', @source_owner = N'dbo', @source_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAY_TT_SV', @source_owner = N'dbo', @source_object = N'SP_LAY_TT_SV', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_TT_SV', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_LAYCAUHOI', @source_owner = N'dbo', @source_object = N'SP_LAYCAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAYCAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_REPORT_BANGDIEM_MONHOC', @source_owner = N'dbo', @source_object = N'SP_REPORT_BANGDIEM_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_BANGDIEM_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @source_owner = N'dbo', @source_object = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_REPORT_DS_DANGKY_THI', @source_owner = N'dbo', @source_object = N'SP_REPORT_DS_DANGKY_THI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_DS_DANGKY_THI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_REPORT_KETQUATHI', @source_owner = N'dbo', @source_object = N'SP_REPORT_KETQUATHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_KETQUATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_SUA_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_GIAOVIEN_IGNORE_FK', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN_IGNORE_FK', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN_IGNORE_FK', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_KHOA', @source_owner = N'dbo', @source_object = N'SP_SUA_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_LOP', @source_owner = N'dbo', @source_object = N'SP_SUA_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_MONHOC', @source_owner = N'dbo', @source_object = N'SP_SUA_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_SUA_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_SUA_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_THEM_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_THEM_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_THEM_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_KHOA', @source_owner = N'dbo', @source_object = N'SP_THEM_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_LOP', @source_owner = N'dbo', @source_object = N'SP_THEM_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_MONHOC', @source_owner = N'dbo', @source_object = N'SP_THEM_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_THEM_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_THEM_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_TIM_MONTHI', @source_owner = N'dbo', @source_object = N'SP_TIM_MONTHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_TIM_MONTHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_XOA_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_XOA_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_XOA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_KHOA', @source_owner = N'dbo', @source_object = N'SP_XOA_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_LOP', @source_owner = N'dbo', @source_object = N'SP_XOA_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_MONHOC', @source_owner = N'dbo', @source_object = N'SP_XOA_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SP_XOA_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_XOA_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @source_owner = N'dbo', @source_object = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @type = N'func schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @source_owner = N'dbo', @source_object = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @type = N'func schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @force_reinit_subscription = 1
GO

-- Adding the merge article join filters
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'KHOA', @filtername = N'KHOA_COSO', @join_articlename = N'COSO', @join_filterclause = N'[KHOA].[MACS] = [COSO].[MACS]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'LOP', @filtername = N'LOP_KHOA', @join_articlename = N'KHOA', @join_filterclause = N'[LOP].[MAKH] = [KHOA].[MAKH]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'GIAOVIEN_DANGKY', @filtername = N'GIAOVIEN_DANGKY_LOP', @join_articlename = N'LOP', @join_filterclause = N'[GIAOVIEN_DANGKY].[MALOP] = [LOP].[MALOP]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'SINHVIEN', @filtername = N'SINHVIEN_LOP', @join_articlename = N'LOP', @join_filterclause = N'[SINHVIEN].[MALOP] = [LOP].[MALOP]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'BANGDIEM', @filtername = N'BANGDIEM_SINHVIEN', @join_articlename = N'SINHVIEN', @join_filterclause = N'[BANGDIEM].[MASV] = [SINHVIEN].[MASV]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @article = N'CT_BAITHI', @filtername = N'CT_BAITHI_SINHVIEN', @join_articlename = N'SINHVIEN', @join_filterclause = N'[SINHVIEN].[MASV] = [CT_BAITHI].[MASV]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO

-- Adding the merge subscriptions
use [TN_CSDLPT]
exec sp_addmergesubscription @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER01', @subscriber_db = N'TN_CSDLPT', @subscription_type = N'Push', @sync_type = N'Automatic', @subscriber_type = N'Global', @subscription_priority = 75, @description = N'', @use_interactive_resolver = N'False'
exec sp_addmergepushsubscription_agent @publication = N'TN_CSDLPT_LOP_DK_THITN_CS1', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER01', @subscriber_db = N'TN_CSDLPT', @job_login = null, @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @publisher_security_mode = 1, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0
GO

-- Adding the merge publication
use [TN_CSDLPT]
exec sp_addmergepublication @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @description = N'Cơ Sở 2', @sync_mode = N'native', @retention = 14, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_subdirectory = N'ftp', @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @dynamic_filters = N'false', @conflict_retention = 14, @keep_partition_changes = N'false', @allow_synctoalternate = N'false', @max_concurrent_merge = 0, @max_concurrent_dynamic_snapshots = 0, @use_partition_groups = N'true', @publication_compatibility_level = N'100RTM', @replicate_ddl = 1, @allow_subscriber_initiated_snapshot = N'false', @allow_web_synchronization = N'false', @allow_partition_realignment = N'true', @retention_period_unit = N'days', @conflict_logging = N'both', @automatic_reinitialization_policy = 0
GO


exec sp_addpublication_snapshot @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 500, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 0, @publisher_login = N'sa', @publisher_password = N''
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'DESKTOP-PRQ0DNG\t0168'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'NT Service\MSSQLSERVER'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @login = N'distributor_admin'
GO

-- Adding the merge articles
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'COSO', @source_owner = N'dbo', @source_object = N'COSO', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'[MACS] =''CS2''', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'MONHOC', @source_owner = N'dbo', @source_object = N'MONHOC', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'KHOA', @source_owner = N'dbo', @source_object = N'KHOA', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'GIAOVIEN', @source_owner = N'dbo', @source_object = N'GIAOVIEN', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'LOP', @source_owner = N'dbo', @source_object = N'LOP', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SINHVIEN', @source_owner = N'dbo', @source_object = N'SINHVIEN', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'BODE', @source_owner = N'dbo', @source_object = N'BODE', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'BANGDIEM', @source_owner = N'dbo', @source_object = N'BANGDIEM', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'GIAOVIEN_DANGKY', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @source_owner = N'dbo', @source_object = N'CT_BAITHI', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'true', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'CAUSO', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'MASV', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'MAMH', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'LAN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'CAUHOI', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'DACHON', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @column = N'rowguid', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'MY_SP_LAY_CAUHOI', @source_owner = N'dbo', @source_object = N'MY_SP_LAY_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'MY_SP_LAY_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_GHI_VAO_BANGDIEM', @source_owner = N'dbo', @source_object = N'SP_GHI_VAO_BANGDIEM', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_GHI_VAO_BANGDIEM', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_GIAOVIEN_DANGKY_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_GIAOVIEN_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_GIAOVIEN_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_GIAOVIEN_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_KHOA_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_KHOA_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_KHOA_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_LOP_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_LOP_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_LOP_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_MONHOC_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_MONHOC_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_MONHOC_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_SINHVIEN_DATHI', @source_owner = N'dbo', @source_object = N'SP_KT_SINHVIEN_DATHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SINHVIEN_DATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_SINHVIEN_DATONTAI', @source_owner = N'dbo', @source_object = N'SP_KT_SINHVIEN_DATONTAI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SINHVIEN_DATONTAI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_SUA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_KT_SUA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_SUA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_KT_XOA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_KT_XOA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_KT_XOA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_DS_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_DS_KHOA', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_DS_LOP', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_DS_MONHOC', @source_owner = N'dbo', @source_object = N'SP_LAY_DS_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_DS_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @source_owner = N'dbo', @source_object = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_STT_CAUHOI_TIEPTHEO', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_TT_GIANGVIEN_LOGIN', @source_owner = N'dbo', @source_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAY_TT_SV', @source_owner = N'dbo', @source_object = N'SP_LAY_TT_SV', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_TT_SV', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_LAYCAUHOI', @source_owner = N'dbo', @source_object = N'SP_LAYCAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAYCAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_REPORT_BANGDIEM_MONHOC', @source_owner = N'dbo', @source_object = N'SP_REPORT_BANGDIEM_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_BANGDIEM_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @source_owner = N'dbo', @source_object = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_BANGDIEM_MONHOC_THONGTIN_LOPMON', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_REPORT_DS_DANGKY_THI', @source_owner = N'dbo', @source_object = N'SP_REPORT_DS_DANGKY_THI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_DS_DANGKY_THI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_REPORT_KETQUATHI', @source_owner = N'dbo', @source_object = N'SP_REPORT_KETQUATHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_KETQUATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_REPORT_KETQUATHI_THONGTIN_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_SUA_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_GIAOVIEN_IGNORE_FK', @source_owner = N'dbo', @source_object = N'SP_SUA_GIAOVIEN_IGNORE_FK', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_GIAOVIEN_IGNORE_FK', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_KHOA', @source_owner = N'dbo', @source_object = N'SP_SUA_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_LOP', @source_owner = N'dbo', @source_object = N'SP_SUA_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_MONHOC', @source_owner = N'dbo', @source_object = N'SP_SUA_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_SUA_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_SUA_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_SUA_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_THEM_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_THEM_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_THEM_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_KHOA', @source_owner = N'dbo', @source_object = N'SP_THEM_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_LOP', @source_owner = N'dbo', @source_object = N'SP_THEM_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_MONHOC', @source_owner = N'dbo', @source_object = N'SP_THEM_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_THEM_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_THEM_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_THEM_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_TIM_MONTHI', @source_owner = N'dbo', @source_object = N'SP_TIM_MONTHI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_TIM_MONTHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_CAUHOI', @source_owner = N'dbo', @source_object = N'SP_XOA_CAUHOI', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_CAUHOI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_GIAOVIEN', @source_owner = N'dbo', @source_object = N'SP_XOA_GIAOVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_GIAOVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_GIAOVIEN_DANGKY', @source_owner = N'dbo', @source_object = N'SP_XOA_GIAOVIEN_DANGKY', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_GIAOVIEN_DANGKY', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_KHOA', @source_owner = N'dbo', @source_object = N'SP_XOA_KHOA', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_KHOA', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_LOP', @source_owner = N'dbo', @source_object = N'SP_XOA_LOP', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_LOP', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_MONHOC', @source_owner = N'dbo', @source_object = N'SP_XOA_MONHOC', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_MONHOC', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SP_XOA_SINHVIEN', @source_owner = N'dbo', @source_object = N'SP_XOA_SINHVIEN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_XOA_SINHVIEN', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @source_owner = N'dbo', @source_object = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @type = N'func schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'UDF_KIEMTRA_GV_DANGKY_DATHI', @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @source_owner = N'dbo', @source_object = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @type = N'func schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'UDF_LAY_DIEMCHU_TU_DIEMSO', @force_reinit_subscription = 1
GO

-- Adding the merge article join filters
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'KHOA', @filtername = N'KHOA_COSO', @join_articlename = N'COSO', @join_filterclause = N'[KHOA].[MACS] = [COSO].[MACS]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'LOP', @filtername = N'LOP_KHOA', @join_articlename = N'KHOA', @join_filterclause = N'[LOP].[MAKH] = [KHOA].[MAKH]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'GIAOVIEN_DANGKY', @filtername = N'GIAOVIEN_DANGKY_LOP', @join_articlename = N'LOP', @join_filterclause = N'[GIAOVIEN_DANGKY].[MALOP] = [LOP].[MALOP]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'SINHVIEN', @filtername = N'SINHVIEN_LOP', @join_articlename = N'LOP', @join_filterclause = N'[SINHVIEN].[MALOP] = [LOP].[MALOP]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'BANGDIEM', @filtername = N'BANGDIEM_SINHVIEN', @join_articlename = N'SINHVIEN', @join_filterclause = N'[BANGDIEM].[MASV] = [SINHVIEN].[MASV]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergefilter @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @article = N'CT_BAITHI', @filtername = N'CT_BAITHI_SINHVIEN', @join_articlename = N'SINHVIEN', @join_filterclause = N'[SINHVIEN].[MASV] = [CT_BAITHI].[MASV]', @join_unique_key = 1, @filter_type = 1, @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO

-- Adding the merge subscriptions
use [TN_CSDLPT]
exec sp_addmergesubscription @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER02', @subscriber_db = N'TN_CSDLPT', @subscription_type = N'Push', @sync_type = N'Automatic', @subscriber_type = N'Global', @subscription_priority = 75, @description = N'', @use_interactive_resolver = N'False'
exec sp_addmergepushsubscription_agent @publication = N'TN_CSDLPT_LOP_DK_THITN_CS2', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER02', @subscriber_db = N'TN_CSDLPT', @job_login = null, @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @publisher_security_mode = 1, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0
GO

-- Adding the merge publication
use [TN_CSDLPT]
exec sp_addmergepublication @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @description = N'Site tra cứu', @sync_mode = N'native', @retention = 14, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_subdirectory = N'ftp', @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @dynamic_filters = N'false', @conflict_retention = 14, @keep_partition_changes = N'false', @allow_synctoalternate = N'false', @max_concurrent_merge = 0, @max_concurrent_dynamic_snapshots = 0, @use_partition_groups = N'false', @publication_compatibility_level = N'100RTM', @replicate_ddl = 1, @allow_subscriber_initiated_snapshot = N'false', @allow_web_synchronization = N'false', @allow_partition_realignment = N'true', @retention_period_unit = N'days', @conflict_logging = N'both', @automatic_reinitialization_policy = 0
GO


exec sp_addpublication_snapshot @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 500, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 0, @publisher_login = N'sa', @publisher_password = N''
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'DESKTOP-PRQ0DNG\t0168'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'NT Service\MSSQLSERVER'
GO
exec sp_grant_publication_access @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @login = N'distributor_admin'
GO

-- Adding the merge articles
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'LOP', @source_owner = N'dbo', @source_object = N'LOP', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'false', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @source_owner = N'dbo', @source_object = N'SINHVIEN', @type = N'table', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000010C034FD1, @identityrangemanagementoption = N'none', @destination_owner = N'dbo', @force_reinit_subscription = 1, @column_tracking = N'false', @subset_filterclause = N'', @vertical_partition = N'true', @verify_resolver_signature = 1, @allow_interactive_resolver = N'false', @fast_multicol_updateproc = N'true', @check_permissions = 0, @subscriber_upload_options = 0, @delete_tracking = N'true', @compensate_for_errors = N'false', @stream_blob_columns = N'true', @partition_options = 0
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'MASV', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'HO', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'TEN', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'MATKHAU', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'MALOP', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_mergearticlecolumn @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SINHVIEN', @column = N'rowguid', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TN_CSDLPT]
exec sp_addmergearticle @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @article = N'SP_LAY_TT_GIANGVIEN_LOGIN', @source_owner = N'dbo', @source_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @type = N'proc schema only', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_owner = N'dbo', @destination_object = N'SP_LAY_TT_GIANGVIEN_LOGIN', @force_reinit_subscription = 1
GO

-- Adding the merge subscriptions
use [TN_CSDLPT]
exec sp_addmergesubscription @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER03', @subscriber_db = N'TN_CSDLPT', @subscription_type = N'Push', @sync_type = N'Automatic', @subscriber_type = N'Global', @subscription_priority = 75, @description = N'', @use_interactive_resolver = N'False'
exec sp_addmergepushsubscription_agent @publication = N'TN_CSDLPT_TRACUU_LOP_SV', @subscriber = N'TUANBUI-NOV09\MSSQLSERVER03', @subscriber_db = N'TN_CSDLPT', @job_login = null, @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'sa', @subscriber_password = null, @publisher_security_mode = 1, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0
GO



