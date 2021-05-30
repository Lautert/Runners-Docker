/*********************************************/
/*************** RUNNERS *********************/
/*********************************************/
CREATE TABLE runners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ds_name VARCHAR(200) NOT NULL,
    ds_document VARCHAR(50) NOT NULL,
    dt_birth DATE NOT NULL,

    dt_created DATETIME,
    dt_modified DATETIME,
    bl_active BOOLEAN NOT NULL DEFAULT TRUE,

    UNIQUE KEY (ds_document)
);

INSERT INTO runners (ds_name, ds_document, dt_birth) values
    ('Guilherme',   '676.766.060-47', DATE '1992-12-15'),
    ('Felipe',      '558.499.340-90', DATE '1991-03-01'),
    ('Henrique',    '566.052.570-90', DATE '1982-07-18'),
    ('Ana',         '723.551.510-40', DATE '1998-11-21'),
    ('Gabriel',     '985.723.550-65', DATE '1976-04-30'),
    ('Gabriela',    '472.894.310-06', DATE '1986-02-08'),
    ('Marcos',      '473.533.440-83', DATE '1993-04-16'),
    ('Fernanda',    '846.792.130-78', DATE '1993-05-24'),
    ('Luis',        '757.323.680-86', DATE '1968-04-27'),
    ('Geni',        '666.061.110-05', DATE '1950-09-18'),
    ('Davi',        '959.360.580-00', DATE '2001-01-09'),
    ('Laura',       '539.928.650-53', DATE '2000-12-12'),
    ('Leo',         '413.907.740-90', DATE '1962-08-25');

/*********************************************/
/*************** RACING_TYPES ****************/
/*********************************************/
CREATE TABLE racing_types(
    id INT AUTO_INCREMENT PRIMARY KEY,
    ds_type VARCHAR(50) NOT NULL,

    dt_created DATETIME,
    dt_modified DATETIME,
    bl_active BOOLEAN NOT NULL DEFAULT TRUE,

    UNIQUE KEY (ds_type)
);
INSERT INTO racing_types (ds_type) VALUES
    ('3 km'),
    ('5 km'),
    ('10 km'),
    ('21 km'),
    ('42 km');

/*********************************************/
/*************** RACING_EVENTS ***************/
/*********************************************/
CREATE TABLE racing_events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_racing_types INT NOT NULL,
    dt_schedule DATE NOT NULL,

    dt_created DATETIME,
    dt_modified DATETIME,
    bl_active BOOLEAN NOT NULL DEFAULT TRUE,

    -- UNIQUE KEY (id_racing_types, dt_schedule),

    FOREIGN KEY racing_type_key(id_racing_types) REFERENCES racing_types(id)
);
INSERT INTO racing_events(id_racing_types, dt_schedule) VALUES
    (1, DATE '2021-01-15'),
    (2, DATE '2021-01-15'),
    (3, DATE '2021-01-15'),
    (4, DATE '2021-01-15'),
    (5, DATE '2021-01-15'),
    (1, DATE '2021-03-15'),
    (2, DATE '2021-03-15'),
    (3, DATE '2021-08-25'),
    (4, DATE '2021-08-25'),
    (5, DATE '2021-11-05');

/*********************************************/
/*************** RUNNER_RACES ****************/
/*********************************************/
CREATE TABLE runner_races (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_runner INT NOT NULL,
    id_racing_event INT NOT NULL,

    dt_created DATETIME,
    dt_modified DATETIME,
    bl_active BOOLEAN NOT NULL DEFAULT TRUE,

    UNIQUE KEY (id_runner, id_racing_event),

    FOREIGN KEY runner_key(id_runner) REFERENCES runners(id),
    FOREIGN KEY racing_event_key(id_racing_event) REFERENCES racing_events(id)
);
INSERT INTO runner_races (id_racing_event, id_runner) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
    (2, 7), (2, 8), (2, 9), (2, 10),(2, 11),(2, 12),
    (3, 7), (3, 8), (3, 9), (3, 10),(3, 11),(3, 12),
    (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 12);

/*********************************************/
/************ RUNNER_RACE_RESULTS ************/
/*********************************************/
CREATE TABLE runner_race_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_runner_race INT NOT NULL,
    tm_start_time DATETIME NOT NULL,
    tm_end_time DATETIME NOT NULL,

    dt_created DATETIME,
    dt_modified DATETIME,

    UNIQUE KEY (id_runner_race),
    CONSTRAINT start_before_end_chk CHECK ((tm_start_time < tm_end_time)),

    FOREIGN KEY runner_race_key(id_runner_race) REFERENCES runner_races(id)
);

INSERT INTO runner_race_results (id_runner_race, tm_start_time, tm_end_time) VALUES
    (1,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:00:00', '%Y-%m-%d %H:%i:%s')),
    (2,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:12:00', '%Y-%m-%d %H:%i:%s')),
    (3,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:08:00', '%Y-%m-%d %H:%i:%s')),
    (4,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:30:00', '%Y-%m-%d %H:%i:%s')),
    (5,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:57:00', '%Y-%m-%d %H:%i:%s')),
    (6,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 14:45:00', '%Y-%m-%d %H:%i:%s')),
    (7,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:45:00', '%Y-%m-%d %H:%i:%s')),
    (8,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:05:00', '%Y-%m-%d %H:%i:%s')),
    (9,  STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:15:00', '%Y-%m-%d %H:%i:%s')),
    (10, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:12:00', '%Y-%m-%d %H:%i:%s')),
    (11, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:27:00', '%Y-%m-%d %H:%i:%s')),
    (12, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:12:00', '%Y-%m-%d %H:%i:%s')),
    (13, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:29:00', '%Y-%m-%d %H:%i:%s')),
    (14, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:12:00', '%Y-%m-%d %H:%i:%s')),
    (15, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:38:00', '%Y-%m-%d %H:%i:%s')),
    (16, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:35:00', '%Y-%m-%d %H:%i:%s')),
    (17, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:42:00', '%Y-%m-%d %H:%i:%s')),
    (18, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:36:00', '%Y-%m-%d %H:%i:%s')),
    (19, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:08:00', '%Y-%m-%d %H:%i:%s')),
    (20, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:02:00', '%Y-%m-%d %H:%i:%s')),
    (21, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:00:00', '%Y-%m-%d %H:%i:%s')),
    (22, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:05:00', '%Y-%m-%d %H:%i:%s')),
    (23, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:11:00', '%Y-%m-%d %H:%i:%s')),
    (24, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:13:00', '%Y-%m-%d %H:%i:%s')),
    (25, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:18:00', '%Y-%m-%d %H:%i:%s')),
    (26, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 15:16:00', '%Y-%m-%d %H:%i:%s')),
    (27, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:28:00', '%Y-%m-%d %H:%i:%s')),
    (28, STR_TO_DATE('2021-01-15 14:20:00', '%Y-%m-%d %H:%i:%s'),  STR_TO_DATE('2021-01-15 16:17:00', '%Y-%m-%d %H:%i:%s'));
