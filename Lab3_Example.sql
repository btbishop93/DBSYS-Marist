--- Actors ---
drop table if exists actors;
create table actors(
	aid		int not null serial,
	name		text not null,
	address		text,
	dob		timestamp not null,
	hair_color	varchar(20),
	eye_color	varchar(20),
	height		varchar(10),
	weight		varchar(10),
	act_guild_date	text,
primary key(aid);

--- Movies ---
drop table if exists movies;
create table movies(
	mid			int not null serial,
	name			text not null,
	year_released		year not null,
	dombox_sales_USD	money,
	forbox_sales_USD	money,
	dvd_sales_USD		money,
primary key(mid);

--- Directors ---
drop table if exists directors;
create table directors(
	did		int not null serial,
	name		text not null,
	address		text,
	film_school	text,
	dir_guild_date	timestamp,
primary key(did);

--- Actors in the movies ---
drop table if exists actor_movie;
create table actor_movie(
	actor_name	text not null references actors.name,
	movie_name	text not null references movies.name,
primary key(actor_name, movie_name)
);

--- Movies with their directors ---
drop table if exists movie_director;
create table movie_director(
	movie_name	text not null references movies.name,
	dir_name	text not null references directors.name,
primary key(movie_name, dir_name);

--- Actors with their directors ---
drop table if exists actor_director;
create table actor_director(
	relation_id	int not null serial,
	actor_name	text not null references actors.name,
	dir_name	text not null references directors.name,
primary key(relation_id);

--- Actors Inserts ---
insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Sean Connery', 'Edinburgh, Scotland', '10/25/1930', 'gray', 'brown',
				'74 inches','220 lbs', 'null');
				
insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Daniel Craig', 'Chester, Cheshire, England', '3/2/1968', 'brown', 'blue',
				'70 inches','205 lbs', 'null');

insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Pierce Brosnan', 'Navan, Co. Meath, Ireland', '5/16/1953', 'brown', 'blue',
				'73 inches','190 lbs', 'null');

insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Robert Downey Jr.', 'New York City, New York', '4/4/1965', 'brown', 'brown',
				'69 inches','170 lbs', '2001');

insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Natalie Portman', 'Jerusalem, Israel', '6/9/1981', 'brown', 'brown',
				'63 inches','115 lbs', '2011');

insert into actors(name, address, dob, hair_color, eye_color, height, weight, act_guild_date)
		  values('Al Pacino', 'New York City, New York', '4/25/1940', 'brown', 'brown',
				'67 inches','165 lbs', '2011, 2004');

--- Movies inserts --- 
insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('Casino Royale', '2006', '167,445,960', '426,793,106', '81,510,078');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('V for Vendetta', '2005', '70,511,035', '62,000,000', '58,830,596');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('The Godfather', '1972', '134,966,411', '133,533,589', 'null');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('Iron Man', '2008', '318,604,126', '263,839,000', '174,949,094');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('GoldenEye', '1995', '106,429,941', '250,000,000', '46,040');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('The League of Extraordinary Gentlemen', '2003', '66,465,204', '112,800,000', '36,400,000');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('Dr. No', '1962', '16,067,035', '43,500,000', 'null');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('Goldfinger', '1964', '51,100,000', '73,800,000', 'null');

insert into movies(name, year_released, dombox_sales_USD, forbox_sales_USD, dvd_sales_USD)
	values('Thunderball', '1965', '63,600,000', '77,600,000', 'null');

--- Director Inserts ---

insert into directors(name, address, film_school, dir_guild_date)
	values('Martin Campbell', 'Hastings, New Zealand', 'null', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('James McTeigue', 'Sydney, Australia', 'null', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('Stephen Norrington', 'London, England', 'null', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('Guy Hamilton', 'Paris, France', 'null', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('Terence Young', 'Shanghai, China', 'null', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('Jon Favreau', 'Queens, New York', 'Queens College', 'null');

insert into directors(name, address, film_school, dir_guild_date)
	values('Francis Coppola', 'Detroit, Michigan', 'Hofstra University', 'null');

--- Actors in the movies ---

insert into actor_movie (actor_name, movie_name)
		values('Sean Connery', 'The League of Extraordinary Gentlemen');

insert into actor_movie (actor_name, movie_name)
		values('Sean Connery', 'Dr. No');

insert into actor_movie (actor_name, movie_name)
		values('Sean Connery', 'Goldfinger');

insert into actor_movie (actor_name, movie_name)
		values('Sean Connery', 'Thunderball');

insert into actor_movie (actor_name, movie_name)
		values('Daniel Craig', 'Casino Royale');

insert into actor_movie (actor_name, movie_name)
		values('Pierce Brosnan', 'GoldenEye');

insert into actor_movie (actor_name, movie_name)
		values('Robert Downey Jr.', 'Iron Man');

insert into actor_movie (actor_name, movie_name)
		values('Natalie Portman', 'V for Vendetta');

insert into actor_movie (actor_name, movie_name)
		values('Al Pacino', 'The Godfather');

--- Movies with their directors ---
insert into movie_director (movie_name, dir_name)
		values('GoldenEye', 'Martin Campbell');

insert into movie_director (movie_name, dir_name)
		values('Casino Royale', 'Martin Campbell');

insert into movie_director (movie_name, dir_name)
		values('Dr. No', 'Terence Young');

insert into movie_director (movie_name, dir_name)
		values('Thunderball', 'Terence Young');

insert into movie_director (movie_name, dir_name)
		values('V for Vendetta', 'James McTeigue');

insert into movie_director (movie_name, dir_name)
		values('Goldfinger', 'Guy Hamilton');

insert into movie_director (movie_name, dir_name)
		values('The League of Extraordinary Gentlemen', 'Stephen Norrington');

insert into movie_director (movie_name, dir_name)
		values('Iron Man', 'Jon Favreau');

insert into movie_director (movie_name, dir_name)
		values('The Godfather', 'Francis Coppola');


--- Actors with their directors ---
insert into actor_director (actor_name, dir_name)
		values('Sean Connery', 'Terence Young');

insert into actor_director (actor_name, dir_name)
		values('Sean Connery', 'Guy Hamilton');

insert into actor_director (actor_name, dir_name)
		values('Sean Connery', 'Stephen Norrington');

insert into actor_director (actor_name, dir_name)
		values('Daniel Craig', 'Martin Campbell');

insert into actor_director (actor_name, dir_name)
		values('Pierce Brosnan', 'Martin Campbell');

insert into actor_director (actor_name, dir_name)
		values('Robert Downey Jr.', 'Jon Favreau');

insert into actor_director (actor_name, dir_name)
		values('Natalie Portman', 'James McTeigue');

insert into actor_director (actor_name, dir_name)
		values('Al Pacino', 'Francis Coppola');

--- Functional Dependencies ---
Actors Table: 
aid -> name
aid -> address
aid -> dob
aid -> hair_color
aid -> eye_color
aid -> height
aid -> weight
aid -> act_guild_date

Movies Table:
mid -> year_released
mid -> dombox_sales
mid -> forbox_sales
mid -> dvd_sales

Directors Table:
did -> name
did -> address
did -> film_school
did -> dir_guild_date

--- SQL Query ---
select from actor_director
where actor_name = 'Sean Connery';