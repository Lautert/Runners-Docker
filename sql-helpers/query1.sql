SELECT * FROM
	runner_races
WHERE
	id_runner = 5 AND
    id_racing_event IN (
		SELECT id FROM
			racing_events
		WHERE dt_schedule = (SELECT dt_schedule FROM racing_events WHERE id = 1)
	)
    AND id != 30;


SELECT
	rr.id,
	rr.id_runner,
    rr.id_racing_event,
    rt.ds_type,
    re.dt_schedule,
	rrr.*
FROM
	runner_races rr
    INNER JOIN runners r ON r.id = rr.id_runner
    INNER JOIN racing_events re ON re.id = rr.id_racing_event
    INNER JOIN racing_types rt ON rt.id = re.id_racing_types
    LEFT JOIN runner_race_results rrr ON rrr.id_runner_race = rr.id
ORDER BY
	rr.ID DESC;



SET SQL_SAFE_UPDATES = 0;
DELETE FROM runner_race_results;

ALTER TABLE runner_race_results auto_increment = 1