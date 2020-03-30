create database nc_project;

use nc_project;

create table object_types(
		object_type_id int auto_increment primary key,
        name varchar(50) not null,
        description varchar(200));
        
create table objects(
		object_id int auto_increment primary key,
        object_type_id int,
        name varchar(50) not null,
        description varchar(200),
		foreign key (object_type_id) references object_types(object_type_id));    
        
create table list_values(
		list_value_id int auto_increment primary key,
        value varchar(50));
        
create table attributes(
			attr_id int auto_increment primary key,
            object_type_id int,
            name varchar(50),
            type int,
            foreign key (object_type_id) references objects(object_id));
            
create table refs(
			object_id int,
            attr_id int,
            reference int,
            foreign key (object_id) references objects(object_id),
            foreign key (attr_id) references attributes(attr_id));
            
 create table params(
			object_id int,
            attr_id int,
            list_value_id int,
			value varchar(50),
			foreign key (object_id) references objects(object_id),
            foreign key (attr_id) references attributes(attr_id),
            foreign key (list_value_id) references list_values(list_value_id));
            
insert into object_types
values(null, 'Internet Order Object Type', null);
insert into object_types
values(null, 'Video Order Object Type', null);
insert into object_types
values(null, 'Mobile Order Object Type', null);
insert into object_types
values(null, 'Abstract Order Object Type', 'Abstract object type for all porduct orders');
insert into object_types
values(null, 'Internet Instance Object Types', null);
insert into object_types
values(null, 'Video Instance Object Types', null);
insert into object_types
values(null, 'Mobile Order Object Type', null);
insert into object_types
values(null, 'Abstract Instance Object Types', 'Abstract object type for all porduct instances');
insert into object_types
values(null, 'Phone number', null);

insert into objects
values(null, 1, 'Internet Order #1', null);
insert into objects
values(null, 2, 'Video Order #1', null);
insert into objects
values(null, 2, 'Video Order #2', null);
insert into objects
values(null, 1, 'Internet Order #2', null);
insert into objects
values(null, 3, 'Mobile Order #1', null);
insert into objects
values(null, 9, '07454343676', 'Number in the system');

insert into attributes
values(null, 4, 'Due Date', 4);
insert into attributes
values(null, 3, 'Phone Number', 9);
insert into attributes
values(null, 1, 'Access Type', 6);
insert into attributes
values(null, 1, 'Download Speed', 0);
insert into attributes
values(null, 3, 'Service Type', 6);
insert into attributes
values(null, 2, 'Suspend Reason', 0);

insert into  list_values
values(null, 'XDSL');
insert into  list_values
values(null, 'GPON');
insert into  list_values
values(null, 'Postpaid');
insert into  list_values
values(null, 'Prepaid');

insert into params
values(1, 3, 2, null);
insert into params
values(1, 4, null, '100 Mbps');
insert into params
values(2, 6, null, "Device Stolen");
insert into params
values(3, 6, null, 'Tariff Change');
insert into params
values(4, 3, 1, null);
insert into params
values(4, 4, null, '500 Mbps');
insert into params
values(5, 5, 3, null);
            
insert into refs
values(5, 2, 6);		