SELECT * FROM XXSE_CONFIG_DATA_FILES WHERE STATUS ='Y' ORDER BY 1;
SELECT COUNT(*) FROM ALL_OBJECTS WHERE STATUS = 'INVALID';

SELECT * FROM XXSE_CONFIG_DATA_FILES
WHERE FILENAME LIKE '%SD_DEFINE_RESOURCE_GROUP_MEMBERS_TKN%'
ORDER BY 1;


SELECT * FROM XXSE_CONFIG_DATA_FILES WHERE status ='N' ORDER BY 1;
SELECT us.name,
  lang.name
FROM OKC_QA_CHECK_LISTS_TL us,
  OKC_QA_CHECK_LISTS_TL lang
WHERE us.name   IN ('Default Service Contracts Quality Assurance Check List', 'Default Quality Assurance Check List')
AND us.language  = 'US'
AND lang.language=USERENV('LANG')
AND us.ID        = lang.ID

select start_date_active from JTF_RS_GROUPS_VL where group_name = 'World Wide Sales';

SELECT us.name,
  lang.name
FROM OKC_QA_CHECK_LISTS_TL us,
  OKC_QA_CHECK_LISTS_TL lang
WHERE us.name   IN ('Default Service Contracts Quality Assurance Check List', 'Default Quality Assurance Check List')
AND us.language  = 'US'
AND lang.language=USERENV('LANG')
AND us.ID        = lang.ID



update xxse_config_data_files
set status='N'
where ID= 04663;

update xxse_executed_tfi
set status='N'
where data_row_id in (select data_row_id from xxse_config_data_files where id =4663 );


UPDATE xxse_config_data_files
SET clob_content=REPLACE(clob_content,'"4" "01-JAN-2001"','"4" "01-JAN-01"')
WHERE id       >= 4665
AND id         <= 4667

SELECT * FROM XXSE_CONFIG_DATA_FILES WHERE status ='N' ORDER BY 1;


SELECT * FROM XXSE_CONFIG_DATA_FILES WHERE STATUS ='N' ORDER BY 1;


UPDATE xxse_config_data_files SET status='S' WHERE ID >=3655 AND ID <=3665;
UPDATE XXSE_EXECUTED_TFI SET STATUS = 'S' WHERE ID =3655;



select count (*) from all_objects where status = 'INVALID';




DATA_ROW_ID IN (SELECT DATA_ROW_ID FROM xxse_config_data_files WHERE ID=1775);
select * FROM XXSE_EXECUTED_TFI WHERE data_row_id = 201466252 ORDER BY 1;



SELECT TRIM(SUBSTR('#@ORGANIZATION_NAME@#',1,DECODE((instr('#@ORGANIZATION_NAME@#',':')-1), -1, 
LENGTH('#@ORGANIZATION_NAME@#'), instr('#@ORGANIZATION_NAME@#', ':')-1)))
FROM dual

SELECT TRIM(SUBSTR('LEMEX : BGMEX',1,DECODE((instr('LEMEX : BGMEX',':')-1), -1,
LENGTH('LEMEX : BGMEX'), instr('LEMEX : BGMEX', ':')-1)))
FROM dual

update xxse_config_data_files 
set clob_content=replace(clob_content,'10.000.121104.00.000.00000','10.000.161800.00.000.00000') where id =3655;

select * from xxse_config_data_files where id =3128;

select TRIM(substr('No Sales Credit',instr('No Sales Credit','|')+1 ,length('No Sales Credit'))) from dual;
select TRIM(substr('',instr('','|')+1 ,length(''))) from dual;


SELECT * FROM XXSE_CONFIG_DATA_FILES WHERE STATUS ='N' ORDER BY 1;

UPDATE xxse_config_data_files
SET clob_content=REPLACE(clob_content,'"Sourcing','"Sourcing"')
WHERE ID= 3180;

update xxse_config_data_files
set status='N'
where ID= 3178;

update xxse_executed_tfi
set status='N'
where data_row_id in (select data_row_id from xxse_config_data_files where id =3178 );

select organization_id from hr_all_organization_units where name = 'OUACME_CO';

SELECT COUNT (*) FROM ALL_OBJECTS
WHERE STATUS ='INVALID';

CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

