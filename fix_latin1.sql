--fix character set to latin1

ALTER DATABASE masteron_mastersite CHARACTER SET latin1 COLLATE latin1_swedish_ci

SET FOREIGN_KEY_CHECKS=0;

SELECT CONCAT('ALTER TABLE `', table_name, '` MODIFY `', column_name, '` ', DATA_TYPE, '(', CHARACTER_MAXIMUM_LENGTH, ') CHARACTER SET latin1 COLLATE latin1_swedish_ci', (CASE WHEN IS_NULLABLE = 'NO' THEN ' NOT NULL' ELSE '' END), ';')
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = 'yourDB'
AND DATA_TYPE = 'varchar'
AND
(
    CHARACTER_SET_NAME != 'latin1'
    OR
    COLLATION_NAME != 'latin1_swedish_ci'
);

SELECT CONCAT('ALTER TABLE `', table_name, '` MODIFY `', column_name, '` ', DATA_TYPE, ' CHARACTER SET latin1 COLLATE latin1_swedish_ci', (CASE WHEN IS_NULLABLE = 'NO' THEN ' NOT NULL' ELSE '' END), ';')
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = 'yourDB'
AND DATA_TYPE != 'varchar'
AND
(
    CHARACTER_SET_NAME != 'latin1'
    OR
    COLLATION_NAME != 'latin1_swedish_ci'
);

SET FOREIGN_KEY_CHECKS=1;