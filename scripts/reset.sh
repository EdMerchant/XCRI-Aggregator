#!/bin/bash


# Clear down mongo

mongo <<!!!
use xcri
db.dropDatabase()
!!!


# Clear down ES indexes
curl -XDELETE 'http://localhost:9200/courses/course/_query?q=*:*'
curl -XDELETE 'http://localhost:9200/courses/course'


echo clear db

mysql -u k-int -pk-int Aggr3Live <<!!!
use Aggr3Live;
drop table if exists resource;
drop table if exists event_handler;
drop table if exists deposit_event;
drop table if exists canonical_identifier;
drop table if exists identifier_instance;

use hreplive;
drop table if exists handler;
drop table if exists handler_revision;
drop table if exists find_when_log_entry;
drop table if exists shiro_role;
drop table if exists shiro_role_permissions;
drop table if exists shiro_user;
drop table if exists shiro_user_permissions;
drop table if exists shiro_user_roles;

use FeedManagerLive
update datafeed set checksum=null, last_check=0; 
# drop table if exists aggregation_service;
# drop table if exists datafeed;
# drop table if exists shiro_role;
# drop table if exists shiro_role_permissions;
# drop table if exists shiro_user;
# drop table if exists shiro_user_permissions;
# drop table if exists shiro_user_roles;
!!!


echo done

