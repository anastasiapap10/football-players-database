-- ALTER TABLES


-- 1. PRIMARY KEYS

ALTER TABLE STADIUM ADD CONSTRAINT pk_Stadium_ID PRIMARY KEY (Stadium_ID);
ALTER TABLE TEAM ADD CONSTRAINT pk_Team_ID PRIMARY KEY (Team_ID);
ALTER TABLE PLAYER ADD CONSTRAINT pk_Player_ID PRIMARY KEY (Player_ID);
ALTER TABLE SPONSOR ADD CONSTRAINT pk_Sponsor_ID PRIMARY KEY (Sponsor_ID);
ALTER TABLE SPONSORSHIP ADD CONSTRAINT pk_Sponsorship PRIMARY KEY (Sponsor_ID, Team_ID);

-- 2. FOREIGN KEYS

ALTER TABLE TEAM ADD CONSTRAINT fk_Stadium_ID FOREIGN KEY (Stadium_ID) REFERENCES STADIUM (Stadium_ID);
ALTER TABLE PLAYER ADD CONSTRAINT fk_Team_ID FOREIGN KEY (Team_ID) REFERENCES TEAM (Team_ID);
ALTER TABLE SPONSORSHIP ADD CONSTRAINT fk_Sponsor_ID FOREIGN KEY (Sponsor_ID) REFERENCES SPONSOR (Sponsor_ID);
ALTER TABLE SPONSORSHIP ADD CONSTRAINT fk_Sponsorship_team FOREIGN KEY (Team_ID) REFERENCES TEAM (Team_ID);

-- 3. UNIQUE

ALTER TABLE PLAYER ADD CONSTRAINT u_email UNIQUE (Player_Email);

-- 4. CHECKS & UPPER

ALTER TABLE STADIUM ADD (
    CONSTRAINT ck_stadium_name CHECK (Stadium_Name = UPPER (Stadium_Name)),
    CONSTRAINT ck_capacity CHECK (Capacity >= 0),
    CONSTRAINT ck_stadium_year CHECK (Stadium_Year >= 0),
    CONSTRAINT ck_stadium_city CHECK (Stadium_City = UPPER (Stadium_City)),
    CONSTRAINT ck_review_score CHECK (Review_Score BETWEEN 1 AND 5),
    CONSTRAINT ck_state_stadium CHECK (State_Stadium = UPPER (State_Stadium)));


ALTER TABLE TEAM ADD (
    CONSTRAINT ck_team_name CHECK (Team_Name = UPPER (Team_Name)),
    CONSTRAINT ck_city_founded CHECK (City_Founded = UPPER (City_Founded)),
    CONSTRAINT ck_year_created CHECK (Year_Created >= 0),
    CONSTRAINT ck_team_goals CHECK (Team_Goals_Scored >= 0),
    CONSTRAINT ck_goals_conceded CHECK (Goals_Conceded >= 0));


ALTER TABLE PLAYER ADD (
    CONSTRAINT ck_player_name CHECK (Player_Name = UPPER (Player_Name)),
    CONSTRAINT ck_player_surname CHECK (Player_Surname = UPPER (Player_Surname)),
    CONSTRAINT ck_pos_upper CHECK (Player_Position = UPPER (Player_Position)),
    CONSTRAINT ck_player_position CHECK (Player_Position IN ('DEF', 'FOR', 'MID', 'GK')),
    CONSTRAINT ck_games_played CHECK (Games_Played >= 0),
    CONSTRAINT ck_player_goals CHECK (Player_Goals_Scored >= 0),
    CONSTRAINT ck_contract_value CHECK (Contract_Value >= 0),
    CONSTRAINT ck_player_email CHECK (Player_Email = UPPER (Player_Email)),
    CONSTRAINT ck_player_country CHECK (Player_Country = UPPER (Player_Country)),
    CONSTRAINT ck_date_of_birth CHECK (Date_of_birth > TO_DATE('29/04/1962', 'DD/MM/YYYY')));

ALTER TABLE SPONSOR ADD (
    CONSTRAINT ck_sponsor_name CHECK (Sponsor_Name = UPPER (Sponsor_Name)),
    CONSTRAINT ck_sponsor_type CHECK (Sponsor_Type = UPPER (Sponsor_Type)),
    CONSTRAINT ck_city_hq CHECK (City_Headquarters = UPPER (City_Headquarters)));


ALTER TABLE SPONSORSHIP ADD CONSTRAINT ck_fee CHECK (Fee >= 0);
