
-- tabela user --
INSERT INTO `mext`.`user` (`user_username`, `user_name`, `user_sex`, `user_birthdate`, `user_email`, `user_level`, `country_id` ) VALUES ('', '', '', '', '', '', '')--

  -- tabela region --
INSERT INTO `mext`.`region` (`region`) VALUES ('');

-- tabela weather --
INSERT INTO `mext`.`weather` (`temperature`, `humidity`, `precipitation`) VALUES ('', '', '');

-- tabela achievement --
INSERT INTO `mext`.`achievement` (`a_name`) VALUES ('');

-- tabela challenge --
INSERT INTO `mext`.`challenge` (`c_name`, `c_result`) VALUES ('', '');

-- tabela evento --
INSERT INTO `mext`.`evento` (`event_name`, `event_startLimit`, `event_finishLimit`, `event_distance`, `event_description`, `country_id`) VALUES ('', '', '', '', '', (SELECT country_id FROM country WHERE country = ''));

-- tabela race --
INSERT INTO `mext`.`race` (`race_startDate`, `race_startTime`, `race_maxSpeed`, `race_averageSpeed`, `race_calories`, `user_id`, `event_id`, `weather_id`, `segment_id`) VALUES ('', '', '', '', '', (SELECT weather_id FROM weather WHERE temperature = '' AND humidity = '' AND precipitation = ''), (SELECT user_id FROM user WHERE user_username = ''), (SELECT event_id FROM evento WHERE event_name = ''), (SELECT segment_id FROM segment WHERE s_distance = '' AND s_descripton = '' AND s_groundType = '' AND s_totalElavation = ''));

-- tabela segment --
INSERT INTO `mext`.`segment` (`s_map`, `s_distance`, `s_discription`, `s_groundType`, `s_totalElevation`) VALUES ('', '', '', '', '');

-- tabela country --
INSERT INTO `mext`.`country` (`region_id`, `country` ) VALUES ((SELECT region_id FROM region WHERE region = ''), '');




