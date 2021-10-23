create table photo (
	id serial,
	user_id bigint unsigned not null,
	album_id bigint unsigned, 
	media_id bigint unsigned not null, 
	created_at datetime not null default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp,
	index photo_users_idx (user_id),
	index photo_id_idx (media_id),
	foreign key (media_id) references media (id),
	foreign key (user_id) references users (id),
	foreign key (album_id) references album (id)
);

-- заполнение таблицы photo
insert into photo values (default, 1, 1, 1, default, default);
insert into photo values (default, 2, 1, 2, default, default);

-- select * from photo;

create table album (
	id serial,
	user_id bigint unsigned not null,
	name varchar (255),
	created_at datetime not null default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp,
	foreign key (user_id) references users (id)
); 
--заполнение таблицы album
insert into album values (default, 1,'Family', default, default);
insert into album values (default, 2,'Album1', default, default);

--select * from album;


create table laik (
	id serial,
	from_user_id bigint unsigned not null,
	media_id bigint unsigned not null, 
	created_at datetime not null default current_timestamp,
	index laik_users_idx (from_user_id),
	foreign key (media_id) references media (id),
	foreign key (from_user_id) references users (id)
);

-- заполнение таблицы laik
insert into laik values (default, 1, 2, default);
insert into album values (default, 2, 1, default);

--select * from laik


