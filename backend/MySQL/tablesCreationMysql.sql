CREATE TABLE country (
country_id INT,
region_id INT,
country CHAR(20)
);

CREATE TABLE Region (
region_id INT,
region CHAR(20),
PRIMARY KEY (region_id)
);

CREATE TABLE Segment (
segment_id INT AUTO_INCREMENT, 
s_map VARCHAR(300) ,
s_distance CHAR(3),
s_description VARCHAR(50),
s_groundType VARCHAR(15),
s_totalElevation char(3),
PRIMARY KEY (segment_id)
);

CREATE TABLE Evento (
event_id INT AUTO_INCREMENT,
event_name VARCHAR(10),
event_startLimit DATE,
event_finishLimit DATE,
event_distance VARCHAR(3),
event_description VARCHAR(50),
PRIMARY KEY (event_id)
);

CREATE TABLE weather (
weather_id INT AUTO_INCREMENT,
temperature INT(2),
humidity DECIMAL(3, 1),
precipitation INT(3),
PRIMARY KEY (weather_id)
);

CREATE TABLE race (
race_id INT AUTO_INCREMENT,
race_startDate DATE,
race_startTime TIME,
race_totalTime INT(3),
race_maxSpeed INT(2),
race_averageSpeed INT(2),
race_calories INT(3),
PRIMARY KEY (race_id)
);
PRIMARY KEY (weather_id)
);


CREATE TABLE challenge (
challenge_id INT AUTO_INCREMENT,
c_name VARCHAR(10),
c_result VARCHAR(10),
PRIMARY KEY (challenge_id)
);

CREATE TABLE achievement (
achievement_id INT AUTO_INCREMENT,
a_name VARCHAR(20),
PRIMARY KEY (achievement_id)
);

CREATE TABLE user (
user_id INT AUTO_INCREMENT,
uer_username VARCHAR(30),
user_name VARCHAR(20),
user_sex CHAR(1),
user_birthdate DATE,
user_email VARCHAR(20),
user_level VARCHAR(10),
PRIMARY KEY (user_id)
);


ALTER TABLE user
ADD COLUMN country_id INT;

ALTER TABLE user
ADD FOREIGN KEY (country_id) REFERENCES country(country_id);


ALTER TABLE country
ADD FOREIGN KEY (region_id) REFERENCES region(region_id);

ALTER TABLE race
ADD COLUMN user_id INT,
ADD COLUMN event_id INT,
ADD COLUMN weather_id INT,
ADD COLUMN segment_id INT;

ALTER TABLE race
ADD FOREIGN KEY (user_id) REFERENCES user(user_id),
ADD FOREIGN KEY (event_id) REFERENCES evento(event_id),
ADD FOREIGN KEY (weather_id) REFERENCES weather(weather_id),
ADD FOREIGN KEY (segment_id) REFERENCES Segment(segment_id);

ALTER TABLE evento
ADD COLUMN country_id INT,
ADD FOREIGN KEY (country_id) REFERENCES country(country_id);

CREATE TABLE raceChallenge (
challenge_id INT,
race_id INT,
FOREIGN KEY (challenge_id) REFERENCES challenge(challenge_id),
FOREIGN KEY (race_id) REFERENCES race(race_id)
);

CREATE TABLE raceAchievement (
achievement_id INT,
race_id INT,
FOREIGN KEY (achievement_id) REFERENCES achievement(achievement_id),
FOREIGN KEY (race_id) REFERENCES race(race_id)
);

ALTER TABLE user
ADD FOREIGN KEY (country_id) REFERENCES country(country_id);

ALTER TABLE user
ADD COLUMN user_level VARCHAR(20),
ADD FOREIGN KEY (user_level) REFERENCES level(level_name);