create or replace
PROCEDURE HPDM_INSERT_WELL_DATA_PROC
(  WELL_PARAM IN HPDM_WELL_TAB_TYPE,
  WELL_CRS_PARAM IN HPDM_WELL_CRS_TAB_TYPE,
  WELL_DATUM_PARAM IN HPDM_WELL_DATUM_TAB_TYPE, 
  WELL_LOCATIONS_PARAM IN HPDM_WELL_LOCATIONS_TAB_TYPE,
  WELL_PSS_LOC_PARAM  IN HPDM_WELL_PSS_LOC_TAB_TYPE,
  REF_POINT_PARAM IN HPDM_REFERENCE_POINT_TAB_TYPE,	 
  DOC_INFO_PARAM IN HPDM_DOC_INFO_TAB_TYPE,
  DOC_ADDL_INFO_PARAM IN HPDM_DOC_ADDL_INFO_TAB_TYPE
  ) As
  count_doc INTEGER;
  BEGIN
  if WELL_PARAM is not NULL then
  FOR i in 1..WELL_PARAM.COUNT
  Loop
  INSERT INTO HPDM_WELL VALUES (
    WELL_PARAM(i).WELL_ID  , 
	WELL_PARAM(i).WELL_NAME  , 
	WELL_PARAM(i).WELL_LEGAL_NAME , 
	WELL_PARAM(i).LICENSE_NUMBER , 
	WELL_PARAM(i).GOVERNMENT_NUMBER , 
	WELL_PARAM(i).LICENSE_DATE_TIME , 
	WELL_PARAM(i).FIELD_NAME , 
	WELL_PARAM(i).COUNTRY , 
	WELL_PARAM(i).STATE , 
	WELL_PARAM(i).COUNTY , 
	WELL_PARAM(i).REGION , 
	WELL_PARAM(i).DISTRICT , 
	WELL_PARAM(i).BLOCK , 
	WELL_PARAM(i).TIME_ZONE  , 
	WELL_PARAM(i).OPERATOR , 
	WELL_PARAM(i).OPERATOR_DIVISION , 
	WELL_PARAM(i).PERCENTAGE_INTEREST , 
	WELL_PARAM(i).PERCENTAGE_INTERESET_UOM , 
	WELL_PARAM(i).WELL_API_NUM , 
	WELL_PARAM(i).POSC_WELL_STATUS , 
	WELL_PARAM(i).POSC_WELL_PURPOSE , 
	WELL_PARAM(i).POSC_WELL_FLUID , 
	WELL_PARAM(i).POSC_WELL_DIRECTION , 
	WELL_PARAM(i).SPUD_DATE_TIME , 
	WELL_PARAM(i).PLUGGED_ABANDONED_DATE_TIME , 
	WELL_PARAM(i).WELL_HEAD_ELEVATION , 
	WELL_PARAM(i).GROUND_ELEVATION , 
	WELL_PARAM(i).WATER_DEPTH , 
	WELL_PARAM(i).CD_SOURCE_NAME , 
	WELL_PARAM(i).CD_CREATION_TIME , 
	WELL_PARAM(i).CD_LAST_CHANGED , 
	WELL_PARAM(i).CD_ITEM_STATE , 
	WELL_PARAM(i).CD_SERVICE_CATEGORY , 
	WELL_PARAM(i).CD_COMMENTS , 
	WELL_PARAM(i).CD_AQUISITION_TIME_ZONE , 
	WELL_PARAM(i).CD_DEFAULT_DATUM , 
	WELL_PARAM(i).CD_PRIVATE_GROUP_ONLY 
	);
	END LOOP;
	END IF;
	if WELL_CRS_PARAM is not NULL then
    FOR i in 1..WELL_CRS_PARAM.COUNT
    Loop
    INSERT INTO HPDM_WELL_CRS VALUES (
	WELL_CRS_PARAM(i).CRS_ID  , 
	WELL_CRS_PARAM(i).PARENT_OBJECT_TYPE  , 
	WELL_CRS_PARAM(i).PARENT_ID  , 
	WELL_CRS_PARAM(i).NAME  , 
	WELL_CRS_PARAM(i).DESCRIPTION , 
	WELL_CRS_PARAM(i).MPS_CRS_NAME , 
	WELL_CRS_PARAM(i).GEOGRAPHIC_SYSTEM_CRS_NAME , 
	WELL_CRS_PARAM(i).MAP_PROJECTION_CRS , 
	WELL_CRS_PARAM(i).GEOGRAPHIC_SYSTEM_CRS , 
	WELL_CRS_PARAM(i).L_CRS_USE_WELL_AS_ORIGIN , 
	WELL_CRS_PARAM(i).L_CRS_ORIGIN , 
	WELL_CRS_PARAM(i).L_CRS_ORIGIN_DESCRIPTION , 
	WELL_CRS_PARAM(i).L_CRS_YAXIS_AZIMUTH , 
	WELL_CRS_PARAM(i).L_CRS_MAGNETIC_DECLINATION , 
	WELL_CRS_PARAM(i).L_CRS_GRID_COVERAGE , 
	WELL_CRS_PARAM(i).L_CRS_YAXIS_DESCRIPTION , 
	WELL_CRS_PARAM(i).L_CRS_XROTATION_CNTER_CLKWISE 
	);
	END LOOP;
	END IF;
 if WELL_DATUM_PARAM is not NULL then
    FOR i in 1..WELL_DATUM_PARAM.COUNT
    Loop
	INSERT INTO HPDM_WELL_DATUM VALUES (
	WELL_DATUM_PARAM(i).WELL_DATUM_ID  , 
	WELL_DATUM_PARAM(i).WELL_ID  , 
	WELL_DATUM_PARAM(i).NAME  , 
	WELL_DATUM_PARAM(i).CODE , 
	WELL_DATUM_PARAM(i).DATUM_NAME , 
	WELL_DATUM_PARAM(i).DATUM_CRS , 
	WELL_DATUM_PARAM(i).REF_WELL_ID , 
	WELL_DATUM_PARAM(i).REF_WELLBORE_ID , 
	WELL_DATUM_PARAM(i).REFERENCE_RIG_ID , 
	WELL_DATUM_PARAM(i).ELEVATION , 
	WELL_DATUM_PARAM(i).MEASURED_DEPTH , 
	WELL_DATUM_PARAM(i).COMMENTS,
  WELL_DATUM_PARAM(i).WELL_DATUM_KINDS
	);
	END LOOP;
	END IF;
	if WELL_LOCATIONS_PARAM is not NULL then
    FOR i in 1..WELL_LOCATIONS_PARAM.COUNT
    Loop
	INSERT INTO HPDM_WELL_LOCATIONS VALUES (
	WELL_LOCATIONS_PARAM(i).LOCATION_ID , 
	WELL_LOCATIONS_PARAM(i).LOCATION_TYPE , 
	WELL_LOCATIONS_PARAM(i).OBJECT_ID , 
	WELL_LOCATIONS_PARAM(i).WELL_CRS_ID , 
	WELL_LOCATIONS_PARAM(i).LATITUDE , 
	WELL_LOCATIONS_PARAM(i).LONGITUDE , 
	WELL_LOCATIONS_PARAM(i).EASTING , 
	WELL_LOCATIONS_PARAM(i).NORTHING , 
	WELL_LOCATIONS_PARAM(i).WESTING , 
	WELL_LOCATIONS_PARAM(i).SOUTHING , 
	WELL_LOCATIONS_PARAM(i).PROJECTED_X , 
	WELL_LOCATIONS_PARAM(i).PROJECTED_Y , 
	WELL_LOCATIONS_PARAM(i).LOCAL_X , 
	WELL_LOCATIONS_PARAM(i).LOCAL_Y , 
	WELL_LOCATIONS_PARAM(i).ORIGINAL , 
	WELL_LOCATIONS_PARAM(i).DESCRIPTION 
	);
	END LOOP;
	END IF;
	if WELL_PSS_LOC_PARAM is not NULL then
    FOR i in 1..WELL_PSS_LOC_PARAM.COUNT
    Loop
	INSERT INTO HPDM_WELL_PSS_LOCATION VALUES (
	WELL_PSS_LOC_PARAM(i).PSSL_ID , 
	WELL_PSS_LOC_PARAM(i).PARENT_ID , 
	WELL_PSS_LOC_PARAM(i).PRINCIPAL_MERIDIAN, 
	WELL_PSS_LOC_PARAM(i).RANGE , 
	WELL_PSS_LOC_PARAM(i).RANGE_DIRECTION, 
	WELL_PSS_LOC_PARAM(i).TOWNSHIP_NUMBER , 
	WELL_PSS_LOC_PARAM(i).TOWNSHIP_DIRECTION, 
	WELL_PSS_LOC_PARAM(i).SECTION_NUMBER, 
	WELL_PSS_LOC_PARAM(i).QUARTER_SECTION, 
	WELL_PSS_LOC_PARAM(i).QUARTER_TOWNSHIP, 
	WELL_PSS_LOC_PARAM(i).FOOTAGE_NS, 
	WELL_PSS_LOC_PARAM(i).FOOTAGE_EW
	);
	END LOOP;
	END IF;
	if REF_POINT_PARAM is not NULL then
    FOR i in 1..REF_POINT_PARAM.COUNT
    Loop
	INSERT INTO HPDM_REFERENCE_POINT   VALUES (     REF_POINT_PARAM(i).REFERENCE_POINT_ID , 
	REF_POINT_PARAM(i).WELL_ID , 
	REF_POINT_PARAM(i).NAME , 
	REF_POINT_PARAM(i).TYPE, 
	REF_POINT_PARAM(i).ELEVATION, 
	REF_POINT_PARAM(i).MEASURED_DEPTH, 
	REF_POINT_PARAM(i).DESCRIPTION 
	 );
	END LOOP;
	END IF;
	count_doc:=0;
if DOC_INFO_PARAM is not NULL then
FOR i in 1..DOC_INFO_PARAM.COUNT
Loop
count_doc:=seq_doc.nexTval;
 INSERT INTO HPDM_DOCUMENTATION_INFO VALUES (
   count_doc,
	 DOC_INFO_PARAM(i).OBJECT_TYPE,
	 DOC_INFO_PARAM(i).OBJECT_UID,
	 DOC_INFO_PARAM(i).DOCUMENT_NAME,
	 DOC_INFO_PARAM(i).DOCUMENT_DATE,
	 DOC_INFO_PARAM(i).DOCUMENT_CLASS,
	 DOC_INFO_PARAM(i).CREATION_DATE,
	 DOC_INFO_PARAM(i).CREATOR,
	 DOC_INFO_PARAM(i).SOFTWARE,
	 DOC_INFO_PARAM(i).FILE_COMMENTS,
	 DOC_INFO_PARAM(i).SECURITY_CLASS, 
	 DOC_INFO_PARAM(i).SECURITY_SYSTEM,
	 DOC_INFO_PARAM(i).SECURITY_END_DATE,
	 DOC_INFO_PARAM(i).SECURITY_COMMENTS,
	 DOC_INFO_PARAM(i).DISCLAIMER,
	 DOC_INFO_PARAM(i).DOCUMENT_OWNER,
	 DOC_INFO_PARAM(i).COMMENTS,
   DOC_INFO_PARAM(i).DOCUMENT_ALIAS
   
 );
if DOC_ADDL_INFO_PARAM is not NULL then
 INSERT INTO HPDM_DOCUMENTATION_ADDL_INFO  VALUES (  DOC_ADDL_INFO_PARAM(i).DOC_INFO_ID, 
   count_doc, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_TYPE, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_DATE,
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_RES_PARTY,
   DOC_ADDL_INFO_PARAM(i).DOC_COMMENT
	 );
end if;
End Loop;
end if;
commit;
END HPDM_INSERT_WELL_DATA_PROC;



create or replace
PROCEDURE HPDM_INSERT_WELLBORE_DATA_PROC
( WELLBORE_PARAM  IN HPDM_WELLBORE_TAB_TYPE,
  DOC_INFO_PARAM IN HPDM_DOC_INFO_TAB_TYPE,
  DOC_ADDL_INFO_PARAM IN HPDM_DOC_ADDL_INFO_TAB_TYPE
  ) As
  count_doc1 INTEGER;
  BEGIN
  if WELLBORE_PARAM is not NULL then
    FOR i in 1..WELLBORE_PARAM.COUNT
    Loop
	INSERT INTO HPDM_WELLBORE  VALUES (
	WELLBORE_PARAM(i).WELLBORE_ID , 
	WELLBORE_PARAM(i).WELL_ID , 
	WELLBORE_PARAM(i).WELLBORE_NAME , 
	WELLBORE_PARAM(i).PARENT_WELLBORE, 
	WELLBORE_PARAM(i).BOREHOLE_BUMBER, 
	WELLBORE_PARAM(i).API_SUFFIX, 
	WELLBORE_PARAM(i).GOVERNMENT_ASSIGNED_NUMBER, 
	WELLBORE_PARAM(i).POSC_WELLBORE_STATUS, 
	WELLBORE_PARAM(i).WELLBORE_ACTIVE_STATUS , 
	WELLBORE_PARAM(i).POSC_WELLBORE_PURPOSE, 
	WELLBORE_PARAM(i).WELLBORE_TYPE, 
	WELLBORE_PARAM(i).POSC_WELLBORE_SHAPE, 
	WELLBORE_PARAM(i).WELLBORE_KICKOFF_DATETIME , 
	WELLBORE_PARAM(i).TOTAL_DEPTH_ACHEIVED , 
	WELLBORE_PARAM(i).BH_MEASURED_DEPTH, 
	WELLBORE_PARAM(i).BH_TRUE_VERTICAL_DEPTH, 
	WELLBORE_PARAM(i).BIT_MEASURED_DEPTH, 
	WELLBORE_PARAM(i).BIT_TRUE_VERTICAL_DEPTH, 
	WELLBORE_PARAM(i).MEASURED_DEPTH_KICKOFF, 
	WELLBORE_PARAM(i).TRUE_VERTICAL_DEPTH_KICKOFF, 
	WELLBORE_PARAM(i).PLANNED_MEASURED_DEPTH, 
	WELLBORE_PARAM(i).PLANNED_TRUE_VERTICAL_DEPTH, 
	WELLBORE_PARAM(i).SUBSEA_PLANNED_MD, 
	WELLBORE_PARAM(i).SUBSEA_PLANNED_TVD, 
	WELLBORE_PARAM(i).TARGET_DAYS, 
	WELLBORE_PARAM(i).CD_SOURCE_NAME, 
	WELLBORE_PARAM(i).CD_CREATION_TIME , 
	WELLBORE_PARAM(i).CD_LAST_CHANGED , 
	WELLBORE_PARAM(i).CD_ITEM_STATE, 
	WELLBORE_PARAM(i).CD_SERVICE_CATEGORY, 
	WELLBORE_PARAM(i).CD_COMMENTS, 
	WELLBORE_PARAM(i).CD_AQUISITION_TIME_ZONE, 
	WELLBORE_PARAM(i).CD_DEFAULT_DATUM, 
	WELLBORE_PARAM(i).CD_PRIVATE_GROUP_ONLY,
        WELLBORE_PARAM(i).PARENT_WELLBORE_REF
	 );
	END LOOP;
	END IF;
	count_doc1:=0; 
if DOC_INFO_PARAM is not NULL then
FOR i in 1..DOC_INFO_PARAM.COUNT
Loop
count_doc1:=seq.nexTval;
 INSERT INTO HPDM_DOCUMENTATION_INFO VALUES (
   count_doc1,
	 DOC_INFO_PARAM(i).OBJECT_TYPE,
	 DOC_INFO_PARAM(i).OBJECT_UID,
	 DOC_INFO_PARAM(i).DOCUMENT_NAME,
	 DOC_INFO_PARAM(i).DOCUMENT_DATE,
	 DOC_INFO_PARAM(i).DOCUMENT_CLASS,
	 DOC_INFO_PARAM(i).CREATION_DATE,
	 DOC_INFO_PARAM(i).CREATOR,
	 DOC_INFO_PARAM(i).SOFTWARE,
	 DOC_INFO_PARAM(i).FILE_COMMENTS,
	 DOC_INFO_PARAM(i).SECURITY_CLASS, 
	 DOC_INFO_PARAM(i).SECURITY_SYSTEM,
	 DOC_INFO_PARAM(i).SECURITY_END_DATE,
	 DOC_INFO_PARAM(i).SECURITY_COMMENTS,
	 DOC_INFO_PARAM(i).DISCLAIMER,
	 DOC_INFO_PARAM(i).DOCUMENT_OWNER,
	 DOC_INFO_PARAM(i).COMMENTS,
   DOC_INFO_PARAM(i).DOCUMENT_ALIAS
 );
if DOC_ADDL_INFO_PARAM is not NULL then
 INSERT INTO HPDM_DOCUMENTATION_ADDL_INFO  VALUES (
   DOC_ADDL_INFO_PARAM(i).DOC_INFO_ID, 
   count_doc1, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_TYPE, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_DATE,
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_RES_PARTY,
   DOC_ADDL_INFO_PARAM(i).DOC_COMMENT 
	 );
END IF;
END LOOP;
END IF;
 COMMIT;
END HPDM_INSERT_WELLBORE_DATA_PROC;



create or replace
PROCEDURE HPDM_INSERT_LOG_DATA_PROCEDURE
(  WELL_LOG_PARAM IN HPDM_WELL_LOG_TAB_TYPE,
  WELL_LOG_CURVE_PARAM IN HPDM_WELL_LOG_CURVE_TAB_TYPE,
  WELL_LOG_DATA_PARAM IN HPDM_WELL_LOG_DATA_TAB_TYPE, 
  WELL_LOG_PARAMS IN HPDM_WELL_LOG_PARAMS_TAB_TYPE,
  DOC_INFO_PARAM IN HPDM_DOC_INFO_TAB_TYPE,
  DOC_ADDL_INFO_PARAM IN HPDM_DOC_ADDL_INFO_TAB_TYPE
) As
count_doc INTEGER;
BEGIN
if WELL_LOG_PARAM is not NULL then
FOR i in 1..WELL_LOG_PARAM.COUNT
Loop
 INSERT INTO HPDM_WELL_LOG VALUES (
   WELL_LOG_PARAM(i).LOG_ID, 
	 WELL_LOG_PARAM(i).WELL_ID  , 
	 WELL_LOG_PARAM(i).WELLBORE_ID, 
	 WELL_LOG_PARAM(i).LOG_NAME, 
	 WELL_LOG_PARAM(i).LOG_DESCRIPTION, 
	 WELL_LOG_PARAM(i).CREATED_BY, 
	 WELL_LOG_PARAM(i).CREATION_DATE, 
	 WELL_LOG_PARAM(i).OBJECT_GROWING_Y_N, 
	 WELL_LOG_PARAM(i).DATA_UPDATE_RATE, 
	 WELL_LOG_PARAM(i).REQUEST_LATEST_VALUE, 
	 WELL_LOG_PARAM(i).CURVE_SENSORS_ALIGNED, 
	 WELL_LOG_PARAM(i).DATAGROUP, 
	 WELL_LOG_PARAM(i).SERVICE_COMPANY, 
	 WELL_LOG_PARAM(i).RUN_NUMBER, 
	 WELL_LOG_PARAM(i).BHA_RUN_NUMBER, 
	 WELL_LOG_PARAM(i).INDEX_TYPE, 
	 WELL_LOG_PARAM(i).INDEX_CURVE, 
	 WELL_LOG_PARAM(i).INDEX_NULL_VALUE, 
	 WELL_LOG_PARAM(i).START_INDEX, 
	 WELL_LOG_PARAM(i).START_INDEX_UOM, 
	 WELL_LOG_PARAM(i).END_INDEX, 
	 WELL_LOG_PARAM(i).END_INDEX_UOM, 
	 WELL_LOG_PARAM(i).START_DATETIME_INDEX, 
	 WELL_LOG_PARAM(i).END_DATETIME_INDEX, 
	 WELL_LOG_PARAM(i).STEP_INCREMENT, 
	 WELL_LOG_PARAM(i).STEP_INCREMENT_UOM, 
	 WELL_LOG_PARAM(i).DIRECTION, 
	 WELL_LOG_PARAM(i).CD_SOURCE_NAME, 
	 WELL_LOG_PARAM(i).CD_CREATION_TIME, 
	 WELL_LOG_PARAM(i).CD_LAST_CHANGED, 
	 WELL_LOG_PARAM(i).CD_ITEM_STATE, 
	 WELL_LOG_PARAM(i).CD_SERVICE_CATEGORY, 
	 WELL_LOG_PARAM(i).CD_COMMENTS, 
 WELL_LOG_PARAM(i).CD_AQUISITION_TIME_ZONE, 
	 WELL_LOG_PARAM(i).CD_DEFAULT_DATUM, 
   WELL_LOG_PARAM(i).CD_PRIVATE_GROUP_ONLY );
 End Loop;
  end if;
 if WELL_LOG_CURVE_PARAM is not NULL then
 FOR i in 1..WELL_LOG_CURVE_PARAM.COUNT
Loop
 INSERT INTO HPDM_WELL_LOG_CURVE VALUES (
   WELL_LOG_CURVE_PARAM(i).LOG_CURVE_ID, 
	 WELL_LOG_CURVE_PARAM(i).WELL_ID, 
	 WELL_LOG_CURVE_PARAM(i).WELLBORE_ID, 
	 WELL_LOG_CURVE_PARAM(i).LOG_ID, 
	 WELL_LOG_CURVE_PARAM(i).MNEMONIC, 
	 WELL_LOG_CURVE_PARAM(i).CLASS_WITSML, 
	 WELL_LOG_CURVE_PARAM(i).UOM, 
	 WELL_LOG_CURVE_PARAM(i).MNEMONIC_ALIAS, 
	 WELL_LOG_CURVE_PARAM(i).NULL_VALUE, 
	 WELL_LOG_CURVE_PARAM(i).MIN_INDEX, 
	 WELL_LOG_CURVE_PARAM(i).MAX_INDEX, 
	 WELL_LOG_CURVE_PARAM(i).MIN_INDEX_UOM, 
	 WELL_LOG_CURVE_PARAM(i).MAX_INDEX_UOM   , 
	 WELL_LOG_CURVE_PARAM(i).MIN_INDEX_DATE_TIME, 
	 WELL_LOG_CURVE_PARAM(i).MAX_INDEX_DATE_TIME, 
	 WELL_LOG_CURVE_PARAM(i).CURVE_DESCRIPTION, 
	 WELL_LOG_CURVE_PARAM(i).SENSOR_OFFSET, 
	 WELL_LOG_CURVE_PARAM(i).SENSOR_OFFSET_UOM, 
	 WELL_LOG_CURVE_PARAM(i).DATA_SOURCE, 
	 WELL_LOG_CURVE_PARAM(i).DENSDATA, 
	 WELL_LOG_CURVE_PARAM(i).DENS_DATA_UOM, 
	 WELL_LOG_CURVE_PARAM(i).TRACE_STATE, 
	 WELL_LOG_CURVE_PARAM(i).TRACE_ORIGIN, 
	 WELL_LOG_CURVE_PARAM(i).TYPE_LOG_DATA 
 );
End Loop;
 end if;
  if WELL_LOG_DATA_PARAM is not NULL then
FOR i in 1..WELL_LOG_DATA_PARAM.COUNT
 Loop
 INSERT INTO HPDM_WELL_LOG_DATA VALUES (
   WELL_LOG_DATA_PARAM(i).LOG_DATA_UID, 
	 WELL_LOG_DATA_PARAM(i).WELL_ID, 
	 WELL_LOG_DATA_PARAM(i).WELLBORE_ID, 
	 WELL_LOG_DATA_PARAM(i).LOG_ID, 
	 WELL_LOG_DATA_PARAM(i).CURVE_ID, 
	 WELL_LOG_DATA_PARAM(i).UOM, 
	 WELL_LOG_DATA_PARAM(i).MNEMONIC_VALUE
 );
End Loop;
end if;
if WELL_LOG_PARAMS is not NULL then
FOR i in 1..WELL_LOG_PARAMS.COUNT
 Loop
 INSERT INTO HPDM_WELL_LOG_PARAMS VALUES (
	 WELL_LOG_PARAMS(i).LOG_PARAM_ID, 
	 WELL_LOG_PARAMS(i).LOG_ID, 
	 WELL_LOG_PARAMS(i).LOG_PARAM, 
	 WELL_LOG_PARAMS(i).LOG_PARAM_NAME, 
	 WELL_LOG_PARAMS(i).LOG_PARAM_INDEX, 
	 WELL_LOG_PARAMS(i).LOG_PARAM_UOM, 
	 WELL_LOG_PARAMS(i).LOG_PARAM_DESCRIPTION
 );
End Loop;
end if;
count_doc:=0;
if DOC_INFO_PARAM is not NULL then
FOR i in 1..DOC_INFO_PARAM.COUNT
Loop
count_doc:=seq_doc.nexTval;
 INSERT INTO HPDM_DOCUMENTATION_INFO VALUES (
    count_doc,
	 DOC_INFO_PARAM(i).OBJECT_TYPE,
	 DOC_INFO_PARAM(i).OBJECT_UID,
	 DOC_INFO_PARAM(i).DOCUMENT_NAME,
	 DOC_INFO_PARAM(i).DOCUMENT_DATE,
	 DOC_INFO_PARAM(i).DOCUMENT_CLASS,
	 DOC_INFO_PARAM(i).CREATION_DATE,
	 DOC_INFO_PARAM(i).CREATOR,
	 DOC_INFO_PARAM(i).SOFTWARE,
	 DOC_INFO_PARAM(i).FILE_COMMENTS,
	 DOC_INFO_PARAM(i).SECURITY_CLASS, 
	 DOC_INFO_PARAM(i).SECURITY_SYSTEM,
	 DOC_INFO_PARAM(i).SECURITY_END_DATE,
	 DOC_INFO_PARAM(i).SECURITY_COMMENTS,
	 DOC_INFO_PARAM(i).DISCLAIMER,
	 DOC_INFO_PARAM(i).DOCUMENT_OWNER,
	 DOC_INFO_PARAM(i).COMMENTS,
   DOC_INFO_PARAM(i).DOCUMENT_ALIAS
   
 );
if DOC_ADDL_INFO_PARAM is not NULL then
 INSERT INTO HPDM_DOCUMENTATION_ADDL_INFO  VALUES (  DOC_ADDL_INFO_PARAM(i).DOC_INFO_ID, 
   count_doc, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_TYPE, 
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_EVENT_DATE,
   DOC_ADDL_INFO_PARAM(i).DOCUMENT_RES_PARTY,
   DOC_ADDL_INFO_PARAM(i).DOC_COMMENT
	 );
end if;
End Loop;
end if;
commit;
END HPDM_INSERT_LOG_DATA_PROCEDURE;

