CREATE TABLE Follows(
	started CHAR(8),
	follower CHAR(20),
	followee CHAR(20),
	PRIMARY KEY(follwer, followee),
	FOREIGN KEY (folowee) REFERENCES Users,
	FOREIGN KEY (folower) REFERENCES Users);

CREATE TABLE Users(
	uid CHAR(20),
	name CHAR(20),
	email CHAR(20),
	city CHAR(20),
	timeZone CHAR(5),
	PRIMARY KEY(uid));

CREATE TABLE Verified(
	vdate DATE,
	uid CHAR(20) NOT NULL,
	PRIMARY KEY(uid),
	FOREIGN KEY(uid) REFERENCES Users
	ON DELETE CASCADE);

CREATE TABLE Protected(
	uid CHAR(20) NOT NULL,
	PRIMARY KEY(uid),
	FOREIGN KEY(uid) REFERENCES Users
	ON DELETE CASCADE);

CREATE TABLE Lists_Create(
	name CHAR(12),
	creator CHAR(20) NOT NULL,
	PRIMARY KEY(name, uid),
	FOREIGN KEY(creator) REFERENCES Users,
	ON DELETE CASCADE);

CREATE TABLE Includes(
	name CHAR(12),
	uid CHAR(20) NOT NULL,
	PRIMARY KEY(name,uid),
	FOREIGN KEY(uid) REFERENCES Users);

CREATE TABLE Tweets_Write(
	tdate DATE,
	uid CHAR(20) NOT NULL,
	text CHAR(140),
	PRIMARY KEY(tdate, uid),
	FOREIGN KEY(uid) REFERENCES Users,
	ON DELETE CASCADE);

CREATE TABLE Retweets(
	rdate CHAR(20),
	uid CHAR(20),
	tdate DATE,
	PRIMARY KEY(rdate,uid,t_date),
	FOREIGN KEY(uid) REFERENCES Users);

CREATE TABLE hashtags(
	term CHAR(20),
	PRIMARY KEY(term));

CREATE TABLE URLs(
	longURL CHAR(40),
	sortURL CHAR(20),
	PRIMARY KEY(shortURL));

CREATE TABLE mentionsU(
	uid CHAR(20),
	tdate DATE,
	url CHAR(20),
	PRIMARY KEY(tdate,uid,url),
	FOREIGN KEY(tdate,uid) REFERENCES Tweets,
	FOREIGN KEY(url) REFERENCES URLs);

CREATE TABLE mentionsH(
	uid CHAR(20),
	tdate DATE,
	term CHAR(20),
	PRIMARY KEY(tdate,uid,term),
	FOREIGN KEY(tdate,uid) REFERENCES Tweets,
	FOREIGN KEY(term) REFERENCES hashtags);

CREATE TABLE replto(
	originalId CHAR(20),
	o_date DATE,
	replyId CHAR(20),
	r_date DATE,
	PRIMARY KEY(r_date, replyId),
	FOREIGN KEY(r_date, replyId) REFERECES Tweets,
	FOREIGN KEY(o_date, originalId) REFERECES Tweets);

