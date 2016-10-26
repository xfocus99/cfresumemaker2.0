CREATE TABLE learncfinaweek.administrator (
	id int(10) NOT NULL auto_increment,
	firstname varchar(100) NOT NULL,
	lastname varchar(100) NOT NULL,
	emailaddress varchar(100) NOT NULL,
	password varchar(200) NOT NULL,
	salt varchar(200),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.basicinfo (
	id int(10) NOT NULL,
	fullname varchar(25),
	email varchar(25),
	phone varchar(25),
	linkedin varchar(25),
	twitter varchar(25),
	skype varchar(25),
	website varchar(25),
	aboutme varchar(500),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.blogCategory (
	blogCategoryid int(10) NOT NULL,
	name varchar(255),
	PRIMARY KEY (blogCategoryid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.BlogComment (
	blogCommentid int(10) NOT NULL,
	author varchar(255),
	comment longtext,
	createdDateTime datetime,
	deleted bit(1),
	blogpostid int(10),
	PRIMARY KEY (blogCommentid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.blogPost (
	blogpostid int(10) NOT NULL,
	title longtext,
	summary longtext,
	body longtext,
	dateposted datetime,
	createdDateTime datetime,
	modifiedDateTime datetime,
	deleted bit(1),
	PRIMARY KEY (blogpostid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.BlogPostCategory (
	blogpostid int(10) NOT NULL,
	blogCategoryid int(10) NOT NULL,
	PRIMARY KEY (blogpostid,blogCategoryid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.category (
	id int(10) NOT NULL auto_increment,
	name varchar(100) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.portfolio (
	id int(10) NOT NULL auto_increment,
	title varchar(100) NOT NULL,
	summary text(65535),
	website varchar(100),
	image varchar(45),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.post (
	id int(10) NOT NULL auto_increment,
	title varchar(200) NOT NULL,
	summary text(65535),
	body text(65535),
	dateposted date,
	createddatetime datetime,
	modifieddatetime datetime,
	deleted varchar(100),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.postcategoryjn (
	postid int(10) NOT NULL,
	categoryid int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.resume (
	id int(10) NOT NULL auto_increment,
	title varchar(100),
	startDate date NOT NULL,
	endDate date,
	details text(65535) NOT NULL,
	type varchar(45) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE learncfinaweek.skillset (
	id int(10) NOT NULL auto_increment,
	name varchar(45) NOT NULL,
	percentage int(10) NOT NULL,
	color varchar(8) NOT NULL,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO learncfinaweek.administrator(id, firstname, lastname, emailaddress, password, salt) VALUES (1, 'Your', 'Name', 'admin@mywebsite.com', 'admin', '');
INSERT INTO learncfinaweek.basicinfo(id, fullname, email, phone, linkedin, twitter, skype, website, aboutme) VALUES (1, 'Allan Kollman', 'allankollman@my.smccd.edu', '7573374841', 'linkedin.com/in/xfocus3', 'xfocus', 'xfocus', 'www.example.com', 'I enjoy turning complex problems into simple, beautiful and intuitive interface designs. When I''m not coding or pushing pixels, you''ll find me in the gym or on the court shooting hoops.');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (1, 'ColdFusion');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (2, 'Development');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (3, 'HTML5');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (4, 'Javascript');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (5, 'jQuery');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (6, 'NodeJs');
INSERT INTO learncfinaweek.blogCategory(blogCategoryid, name) VALUES (7, 'HapiJs');
INSERT INTO learncfinaweek.blogPost(blogpostid, title, summary, body, dateposted, createdDateTime, modifiedDateTime, deleted) VALUES (1, 'Coldfusion Resume maker', 'cfResumemaker is portfolio builder web app', '<p><span style="color:#ffff00"><strong><span style="background-color:#000000">cfResumemaker</span></strong></span> is portfolio builder web app</p>
', '2016-10-25 00:00:00', '2016-10-25 19:33:19', null, null);
INSERT INTO learncfinaweek.BlogPostCategory(blogpostid, blogCategoryid) VALUES (1, 1);
INSERT INTO learncfinaweek.category(id, name) VALUES (1, 'ColdFusion');
INSERT INTO learncfinaweek.category(id, name) VALUES (2, 'Development');
INSERT INTO learncfinaweek.category(id, name) VALUES (3, 'HTML5');
INSERT INTO learncfinaweek.category(id, name) VALUES (4, 'CSS3');
INSERT INTO learncfinaweek.category(id, name) VALUES (5, 'JQuery');
INSERT INTO learncfinaweek.portfolio(id, title, summary, website, image) VALUES (1, 'Project Title 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project1.com', 'portfolio1.png');
INSERT INTO learncfinaweek.portfolio(id, title, summary, website, image) VALUES (2, 'Project Title 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project2.com', 'portfolio2.png');
INSERT INTO learncfinaweek.portfolio(id, title, summary, website, image) VALUES (3, 'Project Title 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project3.com', 'portfolio3.png');
INSERT INTO learncfinaweek.portfolio(id, title, summary, website, image) VALUES (4, 'Project Title 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nisi erat, ornare vehicula convallis at, viverra quis sapien. Ut gravida risus in eros semper quis eleifend erat aliquet. Duis tincidunt urna sed quam tempus imperdiet. Aenean in cursus odio. Fusce ornare, elit vel malesuada commodo.', 'http://www.project4.com', 'portfolio4.png');
INSERT INTO learncfinaweek.post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted) VALUES (1, 'WebSocket example with keyword highlighting', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-09-18', '2012-09-17 13:37:40', '2012-09-17 13:37:40', '0');
INSERT INTO learncfinaweek.post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted) VALUES (2, 'ColdFusion scheduled tasks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-09-01', '2012-09-01 10:37:40', '2012-09-01 13:40:50', '0');
INSERT INTO learncfinaweek.post(id, title, summary, body, dateposted, createddatetime, modifieddatetime, deleted) VALUES (3, 'ColdFusion Developer Week Recordings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce pulvinar erat eu metus egestas ut aliquet ante adipiscing. Maecenas eget laoreet dolor. Pellentesque sagittis nisl ac nulla semper facilisis pulvinar elit scelerisque. Nulla mollis fermentum eros a pulvinar. Mauris faucibus fringilla dolor, ut consectetur orci euismod eget. Phasellus ut dui ut tellus aliquam feugiat id at elit. Nulla facilisi. Suspendisse.', '<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id dignissim nunc. Mauris a massa sit amet dui sagittis ullamcorper sed at purus. Cras enim massa, laoreet vitae egestas ac, viverra eget lacus. Nam ac turpis id libero fringilla tempus. Sed sem dolor, vestibulum vitae iaculis id, dapibus quis dui. Praesent vel felis nisl, eget accumsan mauris. Vivamus neque eros, accumsan elementum dapibus sit amet, placerat a felis. Aliquam eget eros magna. Morbi quis iaculis tortor. Fusce vitae elit vel nunc suscipit pellentesque. In hac habitasse platea dictumst. Mauris pharetra lacinia mauris eu auctor. Morbi vitae est euismod elit pretium fringilla a vitae sem. Nam lectus ante, rhoncus vitae malesuada quis, pellentesque vitae nibh. Etiam congue metus sed libero cursus vitae rhoncus felis pellentesque. Maecenas tincidunt commodo est, eget imperdiet nibh commodo vel.
							</p>
							<p>
								Sed augue arcu, bibendum sit amet viverra et, facilisis sed ipsum. Nullam orci quam, tincidunt a imperdiet at, lacinia vel risus. Aliquam quis scelerisque purus. Curabitur dui ligula, lobortis vitae viverra sit amet, eleifend id metus. Vivamus varius mi non quam interdum eu tincidunt arcu ullamcorper. In magna nisl, semper vitae ornare ac, bibendum vel lectus. Vivamus pulvinar urna vel libero scelerisque nec malesuada augue auctor. Morbi faucibus justo a odio sollicitudin scelerisque eu et diam. Nulla vel nisi quis augue egestas sollicitudin. Duis auctor libero eu massa volutpat dignissim. Phasellus commodo, arcu ac congue pretium, libero enim lobortis orci, id tempus libero nulla interdum lorem. Proin varius ipsum sit amet urna fermentum in laoreet leo faucibus. Mauris cursus, tellus eget auctor euismod, nunc dui rutrum urna, at auctor nunc mauris vel nisi. Etiam suscipit elit id nulla blandit ut faucibus felis interdum.
							</p>
							<p>
								Integer auctor urna non nibh euismod elementum. Nullam velit nisi, bibendum in pulvinar sed, aliquet tempus tortor. Phasellus eleifend metus mauris. Phasellus at mi et ligula tincidunt malesuada eget ac est. Ut elementum, massa ac pulvinar tempor, est nisl lacinia nisl, sed ornare diam nibh vitae ipsum. Donec molestie consectetur nisi eget pretium. Quisque tincidunt eleifend vulputate. Vivamus eu ante vitae eros eleifend suscipit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc suscipit dolor egestas erat ornare sollicitudin. Nulla facilisi.
							</p>
							<p>
								Quisque id mi sapien, in tincidunt est. Proin metus metus, dignissim ultricies commodo at, scelerisque vel lectus. Vivamus nec auctor sapien. Nulla lobortis, neque vel pretium aliquet, diam metus congue dolor, eu aliquam ante ligula eget velit. Mauris vulputate, massa at ultricies tincidunt, est urna vehicula erat, eget consequat metus erat ut nisi. Vivamus dapibus mauris nec massa eleifend vitae adipiscing arcu cursus. Duis ac libero ante. Integer nec augue dolor. Suspendisse ligula urna, imperdiet et congue vitae, aliquet non nulla. Nunc dignissim justo vel leo sodales varius. Quisque malesuada ornare nisl, et eleifend lectus molestie ut. Vestibulum a risus eu felis elementum bibendum. Curabitur ac justo eu risus laoreet sagittis.
							</p>
							<p>
								Suspendisse ac felis lacus. Nulla facilisi. Curabitur porttitor sapien vel est sollicitudin commodo. Donec consectetur, orci in venenatis malesuada, purus orci gravida leo, ac sollicitudin nulla arcu eu nisi. Ut rutrum, nisl at condimentum varius, risus turpis aliquet risus, quis venenatis tellus velit eu orci. Maecenas aliquam nunc et purus tincidunt dictum. Donec tempus sodales turpis ac consectetur. Sed nibh turpis, ornare egestas rhoncus sed, rhoncus vel arcu. Cras sit amet accumsan justo. Mauris in nisl non lacus pellentesque scelerisque ut sed neque. Nulla et sollicitudin enim. Nam at nisi ante, ac sagittis purus.
							</p>', '2012-08-23', '2012-08-03 08:02:00', '2012-08-19 22:54:12', '0');
INSERT INTO learncfinaweek.postcategoryjn(postid, categoryid) VALUES (1, 1);
INSERT INTO learncfinaweek.postcategoryjn(postid, categoryid) VALUES (1, 2);
INSERT INTO learncfinaweek.postcategoryjn(postid, categoryid) VALUES (2, 2);
INSERT INTO learncfinaweek.postcategoryjn(postid, categoryid) VALUES (3, 1);
INSERT INTO learncfinaweek.postcategoryjn(postid, categoryid) VALUES (3, 3);
INSERT INTO learncfinaweek.resume(id, title, startDate, endDate, details, type) VALUES (1, 'Chief Software Architect - Some startup', '2015-09-01', null, '<p>Developing a node.js server that creates peer to peer connections</p>', 'Work Experience');
INSERT INTO learncfinaweek.resume(id, title, startDate, endDate, details, type) VALUES (2, 'Computer Science Co-op - Some Business', '2013-01-05', '2014-08-05', 'Built ship emergency simulations', 'Work Experience');
INSERT INTO learncfinaweek.resume(id, title, startDate, endDate, details, type) VALUES (3, 'CSC Senior Design Student - NCSU', '2014-09-07', '2014-12-12', 'Designed and developed an iPad application to control a home automation system', 'Work Experience');
INSERT INTO learncfinaweek.resume(id, title, startDate, endDate, details, type) VALUES (4, 'B.S. Computer Science - NCSU', '2010-08-15', '2015-05-07', '<p>Some real scholar with some high honors and honors societies</p>', 'Education');
INSERT INTO learncfinaweek.resume(id, title, startDate, endDate, details, type) VALUES (5, 'Canada college', '2016-10-02', '2017-08-28', '<p>Master Degree</p>', 'education');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (1, 'ColdFusion', 90, '#516C59');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (2, 'HTML5', 82, '#750F08');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (3, 'CSS3', 80, '#7603FF');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (4, 'MySQL', 87, '#78A72C');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (5, 'jQuery', 68, '#09904A');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (6, 'Node.js', 79, '#0B5BFD');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (9, 'HapiJs', 90, '#88cd2a');
INSERT INTO learncfinaweek.skillset(id, name, percentage, color) VALUES (15, 'PhP', 90, '#acff5e');
ALTER TABLE learncfinaweek.BlogComment
	ADD FOREIGN KEY (blogpostid) 
	REFERENCES blogPost (blogpostid);


ALTER TABLE learncfinaweek.BlogPostCategory
	ADD FOREIGN KEY (blogpostid) 
	REFERENCES blogPost (blogpostid);

ALTER TABLE learncfinaweek.BlogPostCategory
	ADD FOREIGN KEY (blogCategoryid) 
	REFERENCES blogCategory (blogCategoryid);


