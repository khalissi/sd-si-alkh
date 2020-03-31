drop database nc_project;
create database nc_project;

use nc_project;

create table nc_object_types(
		object_type_id int unsigned auto_increment primary key,
        name varchar(50) not null,
        description varchar(200));
        
create table nc_objects(
		object_id int unsigned auto_increment primary key,
        object_type_id int unsigned,
        name varchar(50) not null,
        description varchar(200),
		foreign key (object_type_id) references nc_object_types(object_type_id));    
        
create table nc_list_values(
		list_value_id int unsigned auto_increment primary key,
        value varchar(50));
        
create table nc_attributes(
			attr_id int unsigned auto_increment primary key,
            object_type_id int unsigned,
            name varchar(50),
            type int,
            foreign key (object_type_id) references nc_objects(object_id));
            
create table nc_references(
			object_id int unsigned,
            attr_id int unsigned,
            reference int unsigned,
            foreign key (object_id) references nc_objects(object_id),
            foreign key (attr_id) references nc_attributes(attr_id));
            
 create table nc_params(
			object_id int unsigned,
            attr_id int unsigned,
            list_value_id int unsigned,
			value varchar(50),
			foreign key (object_id) references nc_objects(object_id),
            foreign key (attr_id) references nc_attributes(attr_id),
            foreign key (list_value_id) references nc_list_values(list_value_id));
            
insert into nc_object_types
values(null, 'Internet Order Object Type', null);
insert into nc_object_types
values(null, 'Video Order Object Type', null);
insert into nc_object_types
values(null, 'Mobile Order Object Type', null);
insert into nc_object_types
values(null, 'Abstract Order Object Type', 'Abstract object type for all porduct orders');
insert into nc_object_types
values(null, 'Internet Instance Object Types', null);
insert into nc_object_types
values(null, 'Video Instance Object Types', null);
insert into nc_object_types
values(null, 'Mobile Order Object Type', null);
insert into nc_object_types
values(null, 'Abstract Instance Object Types', 'Abstract object type for all porduct instances');
insert into nc_object_types
values(null, 'Phone number', null);

insert into nc_objects
values(null, 1, 'Internet Order #1', null);
insert into nc_objects
values(null, 2, 'Video Order #1', null);
insert into nc_objects
values(null, 2, 'Video Order #2', null);
insert into nc_objects
values(null, 1, 'Internet Order #2', null);
insert into nc_objects
values(null, 3, 'Mobile Order #1', null);
insert into nc_objects
values(null, 9, '07454343676', 'Number in the system');

insert into nc_attributes
values(null, 4, 'Due Date', 4);
insert into nc_attributes
values(null, 3, 'Phone Number', 9);
insert into nc_attributes
values(null, 1, 'Access Type', 6);
insert into nc_attributes
values(null, 1, 'Download Speed', 0);
insert into nc_attributes
values(null, 3, 'Service Type', 6);
insert into nc_attributes
values(null, 2, 'Suspend Reason', 0);

insert into  nc_list_values
values(null, 'XDSL');
insert into  nc_list_values
values(null, 'GPON');
insert into  nc_list_values
values(null, 'Postpaid');
insert into  nc_list_values
values(null, 'Prepaid');

insert into nc_params
values(1, 3, 2, null);
insert into nc_params
values(1, 4, null, '100 Mbps');
insert into nc_params
values(2, 6, null, "Device Stolen");
insert into nc_params
values(3, 6, null, 'Tariff Change');
insert into nc_params
values(4, 3, 1, null);
insert into nc_params
values(4, 4, null, '500 Mbps');
insert into nc_params
values(5, 5, 3, null);
            
insert into nc_references
values(5, 2, 6);		