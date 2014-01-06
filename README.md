db-config-property
==================
This plugin gives your application the ability to change the config properties without restarting the application. The values in Config.groovy are persisted in database when application is run-for the first time after installing the plugin. But if you do not set up dbCreate in your project’s DataSource.groovy, you need to create config_property table manually (create table config_property (id number(19,0) not null, version number(19,0) not null, description varchar2(100 char), key varchar2(100 char) not null, value varchar2(255 char) not null, primary key (id));) 
