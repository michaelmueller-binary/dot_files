snippet fun
	CREATE OR REPLACE FUNCTION betonmarkets.delete_copiers(
		p_trader_id VARCHAR(12),
		p_copier_id VARCHAR(12),
		p_token TEXT
	) RETURNS BIGINT  AS $$
	WITH del AS (
	DELETE FROM betonmarkets.copiers 
	WHERE trader_id = p_trader_id 
	AND copier_id = p_copier_id 
	AND ((p_token IS NULL AND trader_token IS NULL ) 
		OR  trader_token =  p_token)
	RETURNING trader_id
	)
	SELECT count(trader_id) FROM del;
	$$ LANGUAGE SQL;
