SELECT
	rank,
	id_prova,
    tipo,
    id_runner,
    nr_runner_age,
    ds_nunner_name
FROM
	(
		SELECT
			(CASE results_faixa.id_prova
				WHEN @curId THEN @curRow := @curRow + 1 
                ELSE @curRow := 1
			END) AS rank,
			@curId := results_faixa.id_prova as nt_p,
			results_faixa.*
		FROM (
			SELECT
				re.id AS id_prova,
				rt.ds_type AS tipo,
				r.id AS id_runner,
				r.age AS nr_runner_age,
				r.ds_name AS ds_nunner_name,
				rrr.time,
				r.age
			FROM
				runner_races rr
				INNER JOIN (
					SELECT TIMESTAMPDIFF(YEAR, r.dt_birth, CURDATE()) AS age, r.* FROM runners r
				) r ON r.id = rr.id_runner
				INNER JOIN racing_events re ON re.id = rr.id_racing_event
				INNER JOIN racing_types rt ON rt.id = re.id_racing_types
				INNER JOIN (
					SELECT rrr.tm_end_time - rrr.tm_start_time AS time, rrr.* from runner_race_results rrr
				) rrr ON rrr.id_runner_race = rr.id
			ORDER BY
				rrr.time ASC
		) AS results_faixa
			JOIN (SELECT @curRow := 0, @curId := 0) rn
		ORDER BY
			results_faixa.id_prova
	) AS results_faixa_rank
ORDER BY
	id_prova,
	rank
