SE innovatetech;

DELIMITER //

DROP EVENT IF EXISTS event_backup_diario//
CREATE EVENT event_backup_diario
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
BEGIN
  DECLARE exit_handler INT DEFAULT 0;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET exit_handler = 1;
  
  INSERT INTO control_backups (data_backup, hora_backup, taules_incloses, resultat)
  VALUES (CURDATE(), CURTIME(), 'empleats, registre_trucades, videos, avisos_auditoria', 'INICIADO');
  
  SELECT * FROM empleats 
  INTO OUTFILE '/var/backups/innovatetech/empleats_backup.csv'
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
  
  SELECT * FROM registre_trucades 
  INTO OUTFILE '/var/backups/innovatetech/registre_trucades_backup.csv'
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
  
  SELECT * FROM videos 
  INTO OUTFILE '/var/backups/innovatetech/videos_backup.csv'
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
  
  SELECT * FROM avisos_auditoria 
  INTO OUTFILE '/var/backups/innovatetech/avisos_auditoria_backup.csv'
  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
  
  IF exit_handler = 0 THEN
    UPDATE control_backups 
    SET resultat = 'COMPLETADO' 
    WHERE data_backup = CURDATE() 
    AND taules_incloses = 'empleats, registre_trucades, videos, avisos_auditoria' 
    AND resultat = 'INICIADO'
    ORDER BY id DESC LIMIT 1;
  ELSE
    UPDATE control_backups 
    SET resultat = 'ERROR' 
    WHERE data_backup = CURDATE() 
    AND resultat = 'INICIADO'
    ORDER BY id DESC LIMIT 1;
  END IF;
END//

DELIMITER ;
