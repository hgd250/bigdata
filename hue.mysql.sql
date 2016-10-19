/*
Navicat SQLite Data Transfer

Source Server         : desktop
Source Server Version : 30808
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30808
File Encoding         : 65001

Date: 2016-10-19 10:28:46
*/

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS  auth_group;
CREATE TABLE auth_group (
    id integer auto_increment NOT NULL PRIMARY KEY,
    name varchar(80) NOT NULL UNIQUE
);

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS  auth_group_permissions;
CREATE TABLE auth_group_permissions (
    id integer auto_increment NOT NULL PRIMARY KEY,
    group_id integer NOT NULL,
    permission_id integer NOT NULL REFERENCES auth_permission (id),
    UNIQUE (group_id, permission_id)
);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS  auth_permission;
CREATE TABLE auth_permission (
    id integer auto_increment NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename varchar(100) NOT NULL,
    UNIQUE (content_type_id, codename)
);

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS  auth_user;
CREATE TABLE auth_user (
    id integer auto_increment NOT NULL PRIMARY KEY,
    password varchar(128) NOT NULL,
    last_login datetime NOT NULL,
    is_superuser bool NOT NULL,
    username varchar(30) NOT NULL UNIQUE,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    email varchar(75) NOT NULL,
    is_staff bool NOT NULL,
    is_active bool NOT NULL,
    date_joined datetime NOT NULL
);

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS  auth_user_groups;
CREATE TABLE auth_user_groups (
    id integer auto_increment NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    group_id integer NOT NULL REFERENCES auth_group (id),
    UNIQUE (user_id, group_id)
);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS  auth_user_user_permissions;
CREATE TABLE auth_user_user_permissions (
    id integer auto_increment NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    permission_id integer NOT NULL REFERENCES auth_permission (id),
    UNIQUE (user_id, permission_id)
);

-- ----------------------------
-- Table structure for axes_accessattempt
-- ----------------------------
DROP TABLE IF EXISTS  axes_accessattempt;
CREATE TABLE axes_accessattempt (
    id integer auto_increment NOT NULL PRIMARY KEY,
    user_agent varchar(255) NOT NULL,
    ip_address char(39),
    username varchar(255),
    trusted bool NOT NULL,
    http_accept varchar(1025) NOT NULL,
    path_info varchar(255) NOT NULL,
    attempt_time datetime NOT NULL,
    get_data text NOT NULL,
    post_data text NOT NULL,
    failures_since_start integer unsigned NOT NULL
);

-- ----------------------------
-- Table structure for axes_accesslog
-- ----------------------------
DROP TABLE IF EXISTS  axes_accesslog;
CREATE TABLE axes_accesslog (
    id integer auto_increment NOT NULL PRIMARY KEY,
    user_agent varchar(255) NOT NULL,
    ip_address char(39),
    username varchar(255),
    trusted bool NOT NULL,
    http_accept varchar(1025) NOT NULL,
    path_info varchar(255) NOT NULL,
    attempt_time datetime NOT NULL,
    logout_time datetime
);

-- ----------------------------
-- Table structure for beeswax_metainstall
-- ----------------------------
DROP TABLE IF EXISTS  beeswax_metainstall;
CREATE TABLE beeswax_metainstall (installed_example bool NOT NULL, id integer auto_increment NOT NULL PRIMARY KEY);

-- ----------------------------
-- Table structure for beeswax_queryhistory
-- ----------------------------
DROP TABLE IF EXISTS  beeswax_queryhistory;
CREATE TABLE beeswax_queryhistory (extra text NOT NULL, notify bool NOT NULL, query text NOT NULL, id integer auto_increment PRIMARY KEY, last_state integer NOT NULL, log_context varchar(1024), server_id varchar(1024), design_id integer, server_name varchar(128) NOT NULL, server_host varchar(128) NOT NULL, server_port integer unsigned NOT NULL, owner_id integer NOT NULL, submission_date datetime NOT NULL, server_type varchar(128) NOT NULL, query_type smallint NOT NULL, server_guid varchar(1024), is_redacted bool NOT NULL, is_cleared bool NOT NULL, statement_number smallint NOT NULL, operation_type smallint, modified_row_count real, has_results bool NOT NULL);

-- ----------------------------
-- Table structure for beeswax_savedquery
-- ----------------------------
DROP TABLE IF EXISTS  beeswax_savedquery;
CREATE TABLE beeswax_savedquery (name varchar(80) NOT NULL, type integer NOT NULL, is_auto bool NOT NULL, mtime datetime NOT NULL, is_redacted bool NOT NULL, `desc` text NOT NULL, data text NOT NULL, id integer auto_increment PRIMARY KEY, is_trashed bool NOT NULL, owner_id integer NOT NULL);

-- ----------------------------
-- Table structure for beeswax_session
-- ----------------------------
DROP TABLE IF EXISTS  beeswax_session;
CREATE TABLE beeswax_session (last_used datetime NOT NULL, status_code smallint unsigned NOT NULL, server_protocol_version smallint NOT NULL, properties text NOT NULL, application varchar(128) NOT NULL, secret text NOT NULL, guid text NOT NULL, id integer auto_increment PRIMARY KEY, owner_id integer NOT NULL);

-- ----------------------------
-- Table structure for defaultconfiguration_groups
-- ----------------------------
DROP TABLE IF EXISTS  defaultconfiguration_groups;
CREATE TABLE defaultconfiguration_groups (id integer NOT NULL PRIMARY KEY, defaultconfiguration_id integer NOT NULL, group_id integer NOT NULL);

-- ----------------------------
-- Table structure for desktop_defaultconfiguration
-- ----------------------------
DROP TABLE IF EXISTS  desktop_defaultconfiguration;
CREATE TABLE desktop_defaultconfiguration (is_default bool NOT NULL, app varchar(32) NOT NULL, user_id integer, properties text NOT NULL, id integer auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for desktop_document
-- ----------------------------
DROP TABLE IF EXISTS  desktop_document;
CREATE TABLE desktop_document (content_type_id integer NOT NULL, extra text NOT NULL, object_id integer unsigned NOT NULL, name varchar(255) NOT NULL, version smallint NOT NULL, last_modified datetime NOT NULL, owner_id integer NOT NULL, id integer auto_increment PRIMARY KEY, description text NOT NULL);

-- ----------------------------
-- Table structure for desktop_document2
-- ----------------------------
DROP TABLE IF EXISTS  desktop_document2;
CREATE TABLE desktop_document2 (search text, description text NOT NULL, extra text NOT NULL, type varchar(32) NOT NULL, parent_directory_id integer, uuid varchar(36) NOT NULL, is_history bool NOT NULL, version smallint NOT NULL, last_modified datetime NOT NULL, is_managed bool NOT NULL, owner_id integer NOT NULL, data text NOT NULL, id integer auto_increment PRIMARY KEY, name varchar(255) NOT NULL);

-- ----------------------------
-- Table structure for desktop_document2permission
-- ----------------------------
DROP TABLE IF EXISTS  desktop_document2permission;
CREATE TABLE desktop_document2permission (perms varchar(10) NOT NULL, doc_id integer NOT NULL, id int auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for desktop_document2_dependencies
-- ----------------------------
DROP TABLE IF EXISTS  desktop_document2_dependencies;
CREATE TABLE desktop_document2_dependencies (id integer auto_increment NOT NULL PRIMARY KEY, from_document2_id integer NOT NULL, to_document2_id integer NOT NULL);

-- ----------------------------
-- Table structure for desktop_documentpermission
-- ----------------------------
DROP TABLE IF EXISTS  desktop_documentpermission;
CREATE TABLE desktop_documentpermission (perms varchar(10) NOT NULL, doc_id integer NOT NULL, id integer auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for desktop_documenttag
-- ----------------------------
DROP TABLE IF EXISTS  desktop_documenttag;
CREATE TABLE desktop_documenttag (tag varchar(50) NOT NULL, id integer auto_increment PRIMARY KEY, owner_id integer NOT NULL);

-- ----------------------------
-- Table structure for desktop_document_tags
-- ----------------------------
DROP TABLE IF EXISTS  desktop_document_tags;
CREATE TABLE desktop_document_tags (id integer auto_increment NOT NULL PRIMARY KEY, document_id integer NOT NULL, documenttag_id integer NOT NULL);

-- ----------------------------
-- Table structure for desktop_settings
-- ----------------------------
DROP TABLE IF EXISTS  desktop_settings;
CREATE TABLE desktop_settings (tours_and_tutorials bool NOT NULL, id integer auto_increment PRIMARY KEY, collect_usage bool NOT NULL);

-- ----------------------------
-- Table structure for desktop_userpreferences
-- ----------------------------
DROP TABLE IF EXISTS  desktop_userpreferences;
CREATE TABLE desktop_userpreferences (`value` text NOT NULL, user_id integer NOT NULL, `id` integer PRIMARY KEY,`key` varchar(20) NOT NULL);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS  django_admin_log;
CREATE TABLE django_admin_log (
    id integer auto_increment NOT NULL PRIMARY KEY,
    action_time datetime NOT NULL,
    user_id integer NOT NULL REFERENCES auth_user (id),
    content_type_id integer REFERENCES django_content_type (id),
    object_id text,
    object_repr varchar(200) NOT NULL,
    action_flag smallint unsigned NOT NULL,
    change_message text NOT NULL
);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS  django_content_type;
CREATE TABLE django_content_type (
    id integer auto_increment NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL,
    UNIQUE (app_label, model)
);

-- ----------------------------
-- Table structure for django_openid_auth_association
-- ----------------------------
DROP TABLE IF EXISTS  django_openid_auth_association;
CREATE TABLE django_openid_auth_association (
    id integer auto_increment NOT NULL PRIMARY KEY,
    server_url text NOT NULL,
    handle varchar(255) NOT NULL,
    secret text NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type text NOT NULL
);

-- ----------------------------
-- Table structure for django_openid_auth_nonce
-- ----------------------------
DROP TABLE IF EXISTS  django_openid_auth_nonce;
CREATE TABLE django_openid_auth_nonce (
    id integer auto_increment NOT NULL PRIMARY KEY,
    server_url varchar(1000) NOT NULL,
    timestamp integer NOT NULL,
    salt varchar(40) NOT NULL
);

-- ----------------------------
-- Table structure for django_openid_auth_useropenid
-- ----------------------------
DROP TABLE IF EXISTS  django_openid_auth_useropenid;
CREATE TABLE django_openid_auth_useropenid (
    id integer NOT NULL PRIMARY KEY,
    user_id integer NOT NULL REFERENCES auth_user (id),
    claimed_id varchar(255) NOT NULL UNIQUE,
    display_id text NOT NULL
);

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS  django_session;
CREATE TABLE django_session (
    session_key varchar(40) NOT NULL PRIMARY KEY,
    session_data text NOT NULL,
    expire_date datetime NOT NULL
);

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS  django_site;
CREATE TABLE django_site (
    id integer auto_increment NOT NULL PRIMARY KEY,
    domain varchar(100) NOT NULL,
    name varchar(50) NOT NULL
);

-- ----------------------------
-- Table structure for documentpermission2_groups
-- ----------------------------
DROP TABLE IF EXISTS  documentpermission2_groups;
CREATE TABLE documentpermission2_groups (id integer auto_increment NOT NULL PRIMARY KEY, document2permission_id integer NOT NULL, group_id integer NOT NULL);

-- ----------------------------
-- Table structure for documentpermission2_users
-- ----------------------------
DROP TABLE IF EXISTS  documentpermission2_users;
CREATE TABLE documentpermission2_users (id integer auto_increment NOT NULL PRIMARY KEY, document2permission_id integer NOT NULL, user_id integer NOT NULL);

-- ----------------------------
-- Table structure for documentpermission_groups
-- ----------------------------
DROP TABLE IF EXISTS  documentpermission_groups;
CREATE TABLE documentpermission_groups (id integer auto_increment NOT NULL PRIMARY KEY, documentpermission_id integer NOT NULL, group_id integer NOT NULL);

-- ----------------------------
-- Table structure for documentpermission_users
-- ----------------------------
DROP TABLE IF EXISTS  documentpermission_users;
CREATE TABLE documentpermission_users (id integer auto_increment NOT NULL PRIMARY KEY, documentpermission_id integer NOT NULL, user_id integer NOT NULL);

-- ----------------------------
-- Table structure for jobsub_checkforsetup
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_checkforsetup;
CREATE TABLE jobsub_checkforsetup (setup_run bool NOT NULL, id integer auto_increment PRIMARY KEY, setup_level integer NOT NULL);

-- ----------------------------
-- Table structure for jobsub_jobdesign
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_jobdesign;
CREATE TABLE jobsub_jobdesign (description varchar(1024) NOT NULL, data text NOT NULL, name varchar(40) NOT NULL, last_modified datetime NOT NULL, type varchar(128) NOT NULL, id integer auto_increment PRIMARY KEY, owner_id integer NOT NULL);

-- ----------------------------
-- Table structure for jobsub_jobhistory
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_jobhistory;
CREATE TABLE jobsub_jobhistory (owner_id integer NOT NULL, submission_date datetime NOT NULL, design_id integer NOT NULL, id integer auto_increment NOT NULL PRIMARY KEY, job_id varchar(128) NOT NULL);

-- ----------------------------
-- Table structure for jobsub_oozieaction
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_oozieaction;
CREATE TABLE jobsub_oozieaction (id integer auto_increment NOT NULL PRIMARY KEY, action_type varchar(64) NOT NULL);

-- ----------------------------
-- Table structure for jobsub_ooziedesign
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_ooziedesign;
CREATE TABLE jobsub_ooziedesign (description varchar(1024) NOT NULL, last_modified datetime NOT NULL, owner_id integer NOT NULL, id integer auto_increment NOT NULL PRIMARY KEY, root_action_id integer NOT NULL, name varchar(64) NOT NULL);

-- ----------------------------
-- Table structure for jobsub_ooziejavaaction
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_ooziejavaaction;
CREATE TABLE jobsub_ooziejavaaction (files varchar(512) NOT NULL, oozieaction_ptr_id integer auto_increment PRIMARY KEY, jar_path varchar(512) NOT NULL, java_opts varchar(256) NOT NULL, args text NOT NULL, job_properties text NOT NULL, archives varchar(512) NOT NULL, main_class varchar(256) NOT NULL);

-- ----------------------------
-- Table structure for jobsub_ooziemapreduceaction
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_ooziemapreduceaction;
CREATE TABLE jobsub_ooziemapreduceaction (files varchar(512) NOT NULL, job_properties text NOT NULL, oozieaction_ptr_id integer auto_increment PRIMARY KEY, archives varchar(512) NOT NULL, jar_path varchar(512) NOT NULL);

-- ----------------------------
-- Table structure for jobsub_ooziestreamingaction
-- ----------------------------
DROP TABLE IF EXISTS  jobsub_ooziestreamingaction;
CREATE TABLE jobsub_ooziestreamingaction (files varchar(512) NOT NULL, mapper varchar(512) NOT NULL, oozieaction_ptr_id integer auto_increment PRIMARY KEY, reducer varchar(512) NOT NULL, job_properties text NOT NULL, archives varchar(512) NOT NULL);

-- ----------------------------
-- Table structure for oozie_bundle
-- ----------------------------
DROP TABLE IF EXISTS  oozie_bundle;
CREATE TABLE oozie_bundle (kick_off_time datetime NOT NULL, job_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_bundledcoordinator
-- ----------------------------
DROP TABLE IF EXISTS  oozie_bundledcoordinator;
CREATE TABLE oozie_bundledcoordinator (coordinator_id integer NOT NULL, parameters text NOT NULL, id integer auto_increment NOT NULL auto_increment PRIMARY KEY, bundle_id integer NOT NULL);

-- ----------------------------
-- Table structure for oozie_coordinator
-- ----------------------------
DROP TABLE IF EXISTS  oozie_coordinator;
CREATE TABLE oozie_coordinator (end datetime NOT NULL, timeout smallint, frequency_number smallint NOT NULL, frequency_unit varchar(20) NOT NULL, job_properties text NOT NULL, job_ptr_id integer auto_increment PRIMARY KEY, start datetime NOT NULL, workflow_id integer, concurrency smallint unsigned, timezone varchar(24) NOT NULL, throttle smallint unsigned, execution varchar(10));

-- ----------------------------
-- Table structure for oozie_datainput
-- ----------------------------
DROP TABLE IF EXISTS  oozie_datainput;
CREATE TABLE oozie_datainput (coordinator_id integer NOT NULL, dataset_id integer NOT NULL UNIQUE, id integer NOT NULL auto_increment PRIMARY KEY, name varchar(40) NOT NULL);

-- ----------------------------
-- Table structure for oozie_dataoutput
-- ----------------------------
DROP TABLE IF EXISTS  oozie_dataoutput;
CREATE TABLE oozie_dataoutput (coordinator_id integer NOT NULL, dataset_id integer NOT NULL UNIQUE, id integer NOT NULL auto_increment PRIMARY KEY, name varchar(40) NOT NULL);

-- ----------------------------
-- Table structure for oozie_dataset
-- ----------------------------
DROP TABLE IF EXISTS  oozie_dataset;
CREATE TABLE oozie_dataset (coordinator_id integer NOT NULL, description varchar(1024) NOT NULL, frequency_number smallint NOT NULL, advanced_start_instance varchar(128) NOT NULL, uri varchar(1024) NOT NULL, frequency_unit varchar(20) NOT NULL, start datetime NOT NULL, instance_choice varchar(10) NOT NULL, timezone varchar(24) NOT NULL, advanced_end_instance varchar(128) NOT NULL, done_flag varchar(64) NOT NULL, id integer auto_increment PRIMARY KEY, name varchar(40) NOT NULL);

-- ----------------------------
-- Table structure for oozie_decision
-- ----------------------------
DROP TABLE IF EXISTS  oozie_decision;
CREATE TABLE oozie_decision (node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_decisionend
-- ----------------------------
DROP TABLE IF EXISTS  oozie_decisionend;
CREATE TABLE oozie_decisionend (node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_distcp
-- ----------------------------
DROP TABLE IF EXISTS  oozie_distcp;
CREATE TABLE oozie_distcp (prepares text NOT NULL, job_xml varchar(512) NOT NULL, params text NOT NULL, job_properties text NOT NULL, node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_email
-- ----------------------------
DROP TABLE IF EXISTS  oozie_email;
CREATE TABLE oozie_email (cc text NOT NULL, `to` text NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, `body` text NOT NULL, `subject` text NOT NULL);

-- ----------------------------
-- Table structure for oozie_end
-- ----------------------------
DROP TABLE IF EXISTS  oozie_end;
CREATE TABLE oozie_end (node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_fork
-- ----------------------------
DROP TABLE IF EXISTS  oozie_fork;
CREATE TABLE oozie_fork (node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_fs
-- ----------------------------
DROP TABLE IF EXISTS  oozie_fs;
CREATE TABLE oozie_fs (mkdirs text NOT NULL, touchzs text NOT NULL, chmods text NOT NULL, node_ptr_id integer NOT NULL auto_increment PRIMARY KEY, moves text NOT NULL, deletes text NOT NULL);

-- ----------------------------
-- Table structure for oozie_generic
-- ----------------------------
DROP TABLE IF EXISTS  oozie_generic;
CREATE TABLE oozie_generic (xml text NOT NULL, node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_history
-- ----------------------------
DROP TABLE IF EXISTS  oozie_history;
CREATE TABLE oozie_history (submission_date datetime NOT NULL, job_id integer NOT NULL, properties text NOT NULL, oozie_job_id varchar(128) NOT NULL, submitter_id integer NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_hive
-- ----------------------------
DROP TABLE IF EXISTS  oozie_hive;
CREATE TABLE oozie_hive (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, job_properties text NOT NULL, params text NOT NULL, archives text NOT NULL, prepares text NOT NULL, script_path varchar(256) NOT NULL);

-- ----------------------------
-- Table structure for oozie_java
-- ----------------------------
DROP TABLE IF EXISTS  oozie_java;
CREATE TABLE oozie_java (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, jar_path varchar(512) NOT NULL, java_opts varchar(256) NOT NULL, args text NOT NULL, job_properties text NOT NULL, capture_output bool NOT NULL, main_class varchar(256) NOT NULL, archives text NOT NULL, prepares text NOT NULL);

-- ----------------------------
-- Table structure for oozie_job
-- ----------------------------
DROP TABLE IF EXISTS  oozie_job;
CREATE TABLE oozie_job (is_shared bool NOT NULL, name varchar(255) NOT NULL, parameters text NOT NULL, deployment_dir varchar(1024) NOT NULL, schema_version varchar(128) NOT NULL, last_modified datetime NOT NULL, owner_id integer NOT NULL, data text NOT NULL, id integer auto_increment PRIMARY KEY, is_trashed bool NOT NULL, description varchar(1024) NOT NULL);

-- ----------------------------
-- Table structure for oozie_join
-- ----------------------------
DROP TABLE IF EXISTS  oozie_join;
CREATE TABLE oozie_join (node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_kill
-- ----------------------------
DROP TABLE IF EXISTS  oozie_kill;
CREATE TABLE oozie_kill (message varchar(256) NOT NULL, node_ptr_id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for oozie_link
-- ----------------------------
DROP TABLE IF EXISTS  oozie_link;
CREATE TABLE oozie_link (comment varchar(1024) NOT NULL, name varchar(40) NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY, parent_id integer NOT NULL, child_id integer NOT NULL);

-- ----------------------------
-- Table structure for oozie_mapreduce
-- ----------------------------
DROP TABLE IF EXISTS  oozie_mapreduce;
CREATE TABLE oozie_mapreduce (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer NOT NULL  UNIQUE, jar_path varchar(512) NOT NULL, job_properties text NOT NULL, archives text NOT NULL, prepares text NOT NULL);

-- ----------------------------
-- Table structure for oozie_node
-- ----------------------------
DROP TABLE IF EXISTS  oozie_node;
CREATE TABLE oozie_node (description varchar(1024) NOT NULL, workflow_id integer NOT NULL, node_type varchar(64) NOT NULL, data text NOT NULL, id integer auto_increment PRIMARY KEY, name varchar(255) NOT NULL);

-- ----------------------------
-- Table structure for oozie_pig
-- ----------------------------
DROP TABLE IF EXISTS  oozie_pig;
CREATE TABLE oozie_pig (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, job_properties text NOT NULL, params text NOT NULL, archives text NOT NULL, prepares text NOT NULL, script_path varchar(256) NOT NULL);

-- ----------------------------
-- Table structure for oozie_shell
-- ----------------------------
DROP TABLE IF EXISTS  oozie_shell;
CREATE TABLE oozie_shell (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, job_properties text NOT NULL, capture_output bool NOT NULL, params text NOT NULL, archives text NOT NULL, prepares text NOT NULL, command varchar(256) NOT NULL);

-- ----------------------------
-- Table structure for oozie_sqoop
-- ----------------------------
DROP TABLE IF EXISTS  oozie_sqoop;
CREATE TABLE oozie_sqoop (files text NOT NULL, job_xml varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, job_properties text NOT NULL, params text NOT NULL, archives text NOT NULL, prepares text NOT NULL, script_path text NOT NULL);

-- ----------------------------
-- Table structure for oozie_ssh
-- ----------------------------
DROP TABLE IF EXISTS  oozie_ssh;
CREATE TABLE oozie_ssh (capture_output bool NOT NULL, host varchar(256) NOT NULL, params text NOT NULL, user varchar(64) NOT NULL, node_ptr_id integer NOT NULL auto_increment PRIMARY KEY, command varchar(256) NOT NULL);

-- ----------------------------
-- Table structure for oozie_start
-- ----------------------------
DROP TABLE IF EXISTS  oozie_start;
CREATE TABLE oozie_start (node_ptr_id integer NOT NULL  UNIQUE);

-- ----------------------------
-- Table structure for oozie_streaming
-- ----------------------------
DROP TABLE IF EXISTS  oozie_streaming;
CREATE TABLE oozie_streaming (files text NOT NULL, mapper varchar(512) NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, reducer varchar(512) NOT NULL, job_properties text NOT NULL, archives text NOT NULL);

-- ----------------------------
-- Table structure for oozie_subworkflow
-- ----------------------------
DROP TABLE IF EXISTS  oozie_subworkflow;
CREATE TABLE oozie_subworkflow (propagate_configuration bool NOT NULL, node_ptr_id integer auto_increment PRIMARY KEY, job_properties text NOT NULL, sub_workflow_id integer NULL);

-- ----------------------------
-- Table structure for oozie_workflow
-- ----------------------------
DROP TABLE IF EXISTS  oozie_workflow;
CREATE TABLE oozie_workflow (job_xml varchar(512) NOT NULL, managed bool NOT NULL, end_id integer, is_single bool NOT NULL, start_id integer, job_properties text NOT NULL, job_ptr_id integer auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for pig_document
-- ----------------------------
DROP TABLE IF EXISTS  pig_document;
CREATE TABLE pig_document (owner_id integer NOT NULL, is_design bool NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for pig_pigscript
-- ----------------------------
DROP TABLE IF EXISTS  pig_pigscript;
CREATE TABLE pig_pigscript (document_ptr_id integer NOT NULL auto_increment PRIMARY KEY, data text NOT NULL);

-- ----------------------------
-- Table structure for search_collection
-- ----------------------------
DROP TABLE IF EXISTS  search_collection;
CREATE TABLE search_collection (facets_id integer NOT NULL, enabled bool NOT NULL, label varchar(100) NOT NULL, is_core_only bool NOT NULL, id integer auto_increment PRIMARY KEY, cores text NOT NULL, owner_id integer NULL, result_id integer NOT NULL, properties text NOT NULL, sorting_id integer NOT NULL, name varchar(40) NOT NULL);

-- ----------------------------
-- Table structure for search_facet
-- ----------------------------
DROP TABLE IF EXISTS  search_facet;
CREATE TABLE search_facet (data text NOT NULL, enabled bool NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for search_result
-- ----------------------------
DROP TABLE IF EXISTS  search_result;
CREATE TABLE search_result (data text NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for search_sorting
-- ----------------------------
DROP TABLE IF EXISTS  search_sorting;
CREATE TABLE search_sorting (data text NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for south_migrationhistory
-- ----------------------------
DROP TABLE IF EXISTS  south_migrationhistory;
CREATE TABLE south_migrationhistory (
    id integer NOT NULL auto_increment PRIMARY KEY,
    app_name varchar(255) NOT NULL,
    migration varchar(255) NOT NULL,
    applied datetime NOT NULL
);

-- ----------------------------
-- Table structure for useradmin_grouppermission
-- ----------------------------
DROP TABLE IF EXISTS  useradmin_grouppermission;
CREATE TABLE useradmin_grouppermission (permission_id integer NOT NULL, group_id integer NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for useradmin_ermission
-- ----------------------------
DROP TABLE IF EXISTS  useradmin_huepermission;
CREATE TABLE useradmin_huepermission (action varchar(100) NOT NULL, app varchar(30) NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY, description varchar(255) NOT NULL);

-- ----------------------------
-- Table structure for useradmin_ldapgroup
-- ----------------------------
DROP TABLE IF EXISTS  useradmin_ldapgroup;
CREATE TABLE useradmin_ldapgroup (group_id integer NOT NULL, id integer NOT NULL auto_increment PRIMARY KEY);

-- ----------------------------
-- Table structure for useradmin_userprofile
-- ----------------------------
DROP TABLE IF EXISTS  useradmin_userprofile;
CREATE TABLE useradmin_userprofile (user_id integer NOT NULL UNIQUE, creation_method varchar(64) NOT NULL, first_login bool NOT NULL, last_activity datetime NOT NULL, home_directory varchar(1024), id integer auto_increment PRIMARY KEY);

-- ----------------------------
-- Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX  auth_group_permissions_5f412f9a
ON auth_group_permissions (group_id ASC);
CREATE INDEX  auth_group_permissions_83d7f98b
ON auth_group_permissions (permission_id ASC);

-- ----------------------------
-- Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX  auth_permission_37ef4eb4
ON auth_permission (content_type_id ASC);

-- ----------------------------
-- Indexes structure for table auth_user_groups
-- ----------------------------
CREATE INDEX  auth_user_groups_5f412f9a
ON auth_user_groups (group_id ASC);
CREATE INDEX  auth_user_groups_6340c63c
ON auth_user_groups (user_id ASC);

-- ----------------------------
-- Indexes structure for table auth_user_user_permissions
-- ----------------------------
CREATE INDEX  auth_user_user_permissions_6340c63c
ON auth_user_user_permissions (user_id ASC);
CREATE INDEX  auth_user_user_permissions_83d7f98b
ON auth_user_user_permissions (permission_id ASC);

-- ----------------------------
-- Indexes structure for table beeswax_queryhistory
-- ----------------------------
CREATE INDEX  beeswax_queryhistory_38ebade8
ON beeswax_queryhistory (design_id ASC);
CREATE INDEX  beeswax_queryhistory_bfe02e93
ON beeswax_queryhistory (last_state ASC);
CREATE INDEX  beeswax_queryhistory_cb902d83
ON beeswax_queryhistory (owner_id ASC);

-- ----------------------------
-- Indexes structure for table beeswax_savedquery
-- ----------------------------
CREATE INDEX  beeswax_savedquery_cb902d83
ON beeswax_savedquery (owner_id ASC);
CREATE INDEX  beeswax_savedquery_db558b3c
ON beeswax_savedquery (is_auto ASC);

-- ----------------------------
-- Indexes structure for table defaultconfiguration_groups
-- ----------------------------
CREATE INDEX  defaultconfiguration_groups_3c818360
ON defaultconfiguration_groups (defaultconfiguration_id ASC);
CREATE INDEX  defaultconfiguration_groups_5f412f9a
ON defaultconfiguration_groups (group_id ASC);
CREATE UNIQUE INDEX  defaultconfiguration_groups_defaultconfiguration_id__group_id
ON defaultconfiguration_groups (defaultconfiguration_id ASC, group_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_defaultconfiguration
-- ----------------------------
CREATE INDEX  desktop_defaultconfiguration_60fc113e
ON desktop_defaultconfiguration (app ASC);
CREATE INDEX  desktop_defaultconfiguration_6340c63c
ON desktop_defaultconfiguration (user_id ASC);
CREATE INDEX  desktop_defaultconfiguration_d2c4b3f2
ON desktop_defaultconfiguration (is_default ASC);

-- ----------------------------
-- Indexes structure for table desktop_document
-- ----------------------------
CREATE INDEX  desktop_document_37ef4eb4
ON desktop_document (content_type_id ASC);
CREATE INDEX  desktop_document_5ccb38e5
ON desktop_document (last_modified ASC);
CREATE INDEX  desktop_document_cb902d83
ON desktop_document (owner_id ASC);
CREATE UNIQUE INDEX  desktop_document_content_type_id__object_id
ON desktop_document (content_type_id ASC, object_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_document2
-- ----------------------------
CREATE UNIQUE INDEX  desktop_document2_uuid__version__is_history
ON desktop_document2 (uuid ASC, version ASC, is_history ASC);

-- ----------------------------
-- Indexes structure for table desktop_document2permission
-- ----------------------------
CREATE INDEX  desktop_document2permission_148edb5b
ON desktop_document2permission (perms ASC);
CREATE UNIQUE INDEX  desktop_document2permission_doc_id__perms
ON desktop_document2permission (doc_id ASC, perms ASC);
CREATE INDEX  desktop_document2permission_fbbb6049
ON desktop_document2permission (doc_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_document2_dependencies
-- ----------------------------
CREATE UNIQUE INDEX  desktop_dependencies_from_document2_to_document2_id
ON desktop_document2_dependencies (from_document2_id ASC, to_document2_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_documentpermission
-- ----------------------------
CREATE UNIQUE INDEX  desktop_documentpermission_doc_id__perms
ON desktop_documentpermission (doc_id ASC, perms ASC);
CREATE INDEX  desktop_documentpermission_fbbb6049
ON desktop_documentpermission (doc_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_documenttag
-- ----------------------------
CREATE INDEX  desktop_documenttag_5659cca2
ON desktop_documenttag (tag ASC);
CREATE INDEX  desktop_documenttag_cb902d83
ON desktop_documenttag (owner_id ASC);
CREATE UNIQUE INDEX  desktop_documenttag_owner_id__tag
ON desktop_documenttag (owner_id ASC, tag ASC);

-- ----------------------------
-- Indexes structure for table desktop_document_tags
-- ----------------------------
CREATE INDEX  desktop_document_tags_21e9f328
ON desktop_document_tags (documenttag_id ASC);
CREATE INDEX  desktop_document_tags_b7398729
ON desktop_document_tags (document_id ASC);
CREATE UNIQUE INDEX  desktop_document_tags_document_id__documenttag_id
ON desktop_document_tags (document_id ASC, documenttag_id ASC);

-- ----------------------------
-- Indexes structure for table desktop_settings
-- ----------------------------
CREATE INDEX  desktop_settings_02d738b3
ON desktop_settings (collect_usage ASC);

-- ----------------------------
-- Indexes structure for table desktop_userpreferences
-- ----------------------------
CREATE INDEX  desktop_userpreferences_6340c63c
ON desktop_userpreferences (user_id ASC);

-- ----------------------------
-- Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX  django_admin_log_37ef4eb4
ON django_admin_log (content_type_id ASC);
CREATE INDEX  django_admin_log_6340c63c
ON django_admin_log (user_id ASC);

-- ----------------------------
-- Indexes structure for table django_openid_auth_useropenid
-- ----------------------------
CREATE INDEX  django_openid_auth_useropenid_6340c63c
ON django_openid_auth_useropenid (user_id ASC);

-- ----------------------------
-- Indexes structure for table django_session
-- ----------------------------
CREATE INDEX  django_session_b7b81f0c
ON django_session (expire_date ASC);

-- ----------------------------
-- Indexes structure for table documentpermission2_groups
-- ----------------------------
CREATE INDEX  documentpermission2_groups_5f412f9a
ON documentpermission2_groups (group_id ASC);
CREATE INDEX  documentpermission2_groups_7a114f0f
ON documentpermission2_groups (document2permission_id ASC);
CREATE UNIQUE INDEX  documentpermission2_groups_document2permission_id__group_id
ON documentpermission2_groups (document2permission_id ASC, group_id ASC);

-- ----------------------------
-- Indexes structure for table documentpermission2_users
-- ----------------------------
CREATE INDEX  documentpermission2_users_6340c63c
ON documentpermission2_users (user_id ASC);
CREATE INDEX  documentpermission2_users_7a114f0f
ON documentpermission2_users (document2permission_id ASC);
CREATE UNIQUE INDEX  documentpermission2_users_document2permission_id__user_id
ON documentpermission2_users (document2permission_id ASC, user_id ASC);

-- ----------------------------
-- Indexes structure for table documentpermission_groups
-- ----------------------------
CREATE INDEX  documentpermission_groups_35c59db1
ON documentpermission_groups (documentpermission_id ASC);
CREATE INDEX  documentpermission_groups_5f412f9a
ON documentpermission_groups (group_id ASC);
CREATE UNIQUE INDEX  documentpermission_groups_documentpermission_id__group_id
ON documentpermission_groups (documentpermission_id ASC, group_id ASC);

-- ----------------------------
-- Indexes structure for table documentpermission_users
-- ----------------------------
CREATE INDEX  documentpermission_users_35c59db1
ON documentpermission_users (documentpermission_id ASC);
CREATE INDEX  documentpermission_users_6340c63c
ON documentpermission_users (user_id ASC);
CREATE UNIQUE INDEX  documentpermission_users_documentpermission_id__user_id
ON documentpermission_users (documentpermission_id ASC, user_id ASC);

-- ----------------------------
-- Indexes structure for table jobsub_jobdesign
-- ----------------------------
CREATE INDEX  jobsub_jobdesign_cb902d83
ON jobsub_jobdesign (owner_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_bundledcoordinator
-- ----------------------------
CREATE INDEX  oozie_bundledcoordinator_2243b87b
ON oozie_bundledcoordinator (bundle_id ASC);
CREATE INDEX  oozie_bundledcoordinator_a376e044
ON oozie_bundledcoordinator (coordinator_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_coordinator
-- ----------------------------
CREATE INDEX  oozie_coordinator_17b2fdb1
ON oozie_coordinator (workflow_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_datainput
-- ----------------------------
CREATE INDEX  oozie_datainput_a376e044
ON oozie_datainput (coordinator_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_dataoutput
-- ----------------------------
CREATE INDEX  oozie_dataoutput_a376e044
ON oozie_dataoutput (coordinator_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_dataset
-- ----------------------------
CREATE INDEX  oozie_dataset_a376e044
ON oozie_dataset (coordinator_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_history
-- ----------------------------
CREATE INDEX  oozie_history_0ebd36f3
ON oozie_history (submission_date ASC);
CREATE INDEX  oozie_history_218f3960
ON oozie_history (job_id ASC);
CREATE INDEX  oozie_history_5f7282ee
ON oozie_history (submitter_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_job
-- ----------------------------
CREATE INDEX  oozie_job_5ccb38e5
ON oozie_job (last_modified ASC);
CREATE INDEX  oozie_job_b91b90da
ON oozie_job (is_shared ASC);
CREATE INDEX  oozie_job_cb902d83
ON oozie_job (owner_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_link
-- ----------------------------
CREATE INDEX  oozie_link_0b25fb00
ON oozie_link (child_id ASC);
CREATE INDEX  oozie_link_410d0aac
ON oozie_link (parent_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_node
-- ----------------------------
CREATE INDEX  oozie_node_17b2fdb1
ON oozie_node (workflow_id ASC);

-- ----------------------------
-- Indexes structure for table oozie_workflow
-- ----------------------------
CREATE INDEX  oozie_workflow_536e023f
ON oozie_workflow (end_id ASC);
CREATE INDEX  oozie_workflow_6f89268d
ON oozie_workflow (start_id ASC);

-- ----------------------------
-- Indexes structure for table pig_document
-- ----------------------------
CREATE INDEX  pig_document_63cbf1fe
ON pig_document (is_design ASC);
CREATE INDEX  pig_document_cb902d83
ON pig_document (owner_id ASC);

-- ----------------------------
-- Indexes structure for table search_collection
-- ----------------------------
CREATE INDEX  search_collection_1ee0a855
ON search_collection (sorting_id ASC);
CREATE INDEX  search_collection_be9133f8
ON search_collection (facets_id ASC);
CREATE INDEX  search_collection_f41c4334
ON search_collection (result_id ASC);

-- ----------------------------
-- Indexes structure for table useradmin_grouppermission
-- ----------------------------
CREATE INDEX  useradmin_grouppermission_5f412f9a
ON useradmin_grouppermission (group_id ASC);
CREATE INDEX  useradmin_grouppermission_9dd0e7a9
ON useradmin_grouppermission (permission_id ASC);

-- ----------------------------
-- Indexes structure for table useradmin_userprofile
-- ----------------------------
CREATE INDEX  useradmin_userprofile_9cf27b62
ON useradmin_userprofile (last_activity ASC);
