SET DEFINE ~
create or replace type tCode as object (
  type varchar2(1),
  code  varchar2(20),
  descr varchar2(100)
);
/
declare
    v_appl_id		integer;
    v_header_seq	integer;
    v_detail_seq	integer;
    v_date		    varchar2(10);
    v_user          varchar2(20);
    v_idx           integer;

    TYPE tCodeList IS TABLE OF tCode;

    codes tCodeList := tCodeList(

         ****     ProviderStatus   ****
        tCode('L', 'PSTATUS',  'Status'),
        tCode('V', 'ACTIVE',   'Active'),
        tCode('V', 'INACTIVE', 'Inactive'),
        tCode('V', 'RETIRED',  'Retired'),
        tCode('V', 'DECEASED', 'Deceased'),

         ****     CredType   ****
        tCode('L', 'CREDTYPE', 'Credential Type'),
        tCode('V', 'CERTIFICATE', 'Certificate'),
        tCode('V', 'CREDENTIAL',  'Credential'),
        tCode('V', 'LICENSE',     'License'),
        tCode('V', 'DEGREE',      'Degree'),

         ****     CredStatus   ****
        tCode('L', 'CREDSTAT',   'Credential Status'),
        tCode('V', 'ACTIVE',    'Active'),
        tCode('V', 'INACTIVE',  'Inactive'),
        tCode('V', 'REVOKED',   'Revoked'),
        tCode('V', 'SUSPENDED', 'Suspended'),

         ****     IDType   ****
        tCode('L', 'IDTYPE', 'Identifier Type'),
        tCode('V', 'MEDICARE', 'Medicare'),
        tCode('V', 'MEDICAID', 'Medicaid'),
        tCode('V', 'NPI', 'National Provider Identifier'),
        tCode('V', 'DEA', 'Drug Enforcement Administration Number'),
        tCode('V', 'OTHER',    'Other'),

         ****      IDStatus   ****
        tCode('L', 'IDSTATUS',   'Status'),
        tCode('V', 'ACTIVE',    'Active'),
        tCode('V', 'INACTIVE',  'Inactive'),
        tCode('V', 'REVOKED',   'Revoked'),
        tCode('V', 'SUSPENDED', 'Suspended'),

         ****     NameType   ****
        tCode('L', 'NAMETYPE', 'Name Type'),
        tCode('V', 'RN', 'Registered Name (Legal Name)'),
        tCode('V', 'PN', 'Professional Name'),
        tCode('V', 'FN', 'Former Name'),
        tCode('V', 'MN', 'Maiden Name (Name at birth)'),
        tCode('V', 'ON', 'Other Name(Alias)'),

         ****     LocationType   ****
        tCode('L', 'LOCTYPE', 'Location Type'),
        tCode('V', 'M1', 'Primary Mailing Address'),
        tCode('V', 'B1', 'Primary Billing Address'),
        tCode('V', 'P1', 'Primary Practice Location'),
        tCode('V', 'M2', 'Secondary Mailing Address'),
        tCode('V', 'B2', 'Secondary Billing Address'),
        tCode('V', 'P2', 'Secondary Practice Location'),
        tCode('V', 'OL', 'Other Location'),
        tCode('V', 'IN',  'Inactive'),

         ****     PREFIX   ****
        tCode('L', 'PREFIX', 'Prefix'),
        tCode('V', 'BROTHER',   'Br'),
        tCode('V', 'DAME',   'Dame'),
        tCode('V', 'DR',   'Dr'),
        tCode('V', 'MASTER',   'Mstr'),
        tCode('V', 'MISS', 'Miss'),
        tCode('V', 'MR',   'Mr'),
        tCode('V', 'MRS',  'Mrs'),
        tCode('V', 'MS',   'Ms'),
        tCode('V', 'PROF', 'Prof'),
        tCode('V', 'SIR', 'Sir'),
        tCode('V', 'SISTER', 'Sr'),

         ****     SUFFIX   ****
        tCode('L', 'SUFFIX', 'Suffix'),
        tCode('V', 'JR',   'Jr.'),
        tCode('V', 'SR',   'Sr.'),
        tCode('V', 'I',    'I'),
        tCode('V', 'II',   'II'),
        tCode('V', 'III',  'III'),
        tCode('V', 'IV',   'IV'),
        tCode('V', 'V',    'V'),
        tCode('V', 'VI',   'VI'),
        tCode('V', 'VII',  'VII'),
        tCode('V', 'VIII', 'VIII'),
        tCode('V', 'IX',   'IX'),
        tCode('V', 'X',    'X'),

         ****     TITLE   ****
        tCode('L', 'TITLE', 'Title'),
        tCode('V', 'MD',  'MD'),
        tCode('V', 'DO',  'DO'),
        tCode('V', 'PHD', 'PHD'),
        tCode('V', 'RN',  'REGISTERED NURSE'),
        tCode('V', 'CNA', 'CERTIFIED NURSES AID'),
        tCode('V', 'LVN', 'LICENSED VOCATIONAL NURSE'),
        tCode('V', 'REV', 'REVERAND'),
        
         ****     PHONTYPE   ****
        tCode('L', 'TELTYPE', 'Telecommunication Type'),
        tCode('V', 'PP', 'Primary Phone'),
        tCode('V', 'SP', 'Secondary Phone'),
        tCode('V', 'PF', 'Primary Fax Number'),
        tCode('V', 'SF', 'Secondary Fax Number'),

         ****     GENDER   ****
        tCode('L', 'GENDER', 'Gender'),
        tCode('V', 'M', 'Male'),
        tCode('V', 'F', 'Female'),
        tCode('V', 'I', 'Intersex or Indeterminate'),
        tCode('V', 'N', 'Not Stated/Inadequately Described'),

         ****     MSTATUS   ****
        tCode('L', 'MSTATUS', 'Marital Status'),
        tCode('V', 'D', 'DIVORCED'),
        tCode('V', 'L', 'LEGALLY SEPARATED'),
        tCode('V', 'M', 'MARRIED'),
        tCode('V', 'P', 'PARTNER'),
        tCode('V', 'S', 'SINGLE'),
        tCode('V', 'U', 'UNKNOWN'),
        tCode('V', 'W', 'WIDOWED'),

         ****     ContactType   ****
        tCode('L', 'CONTTYPE', 'Contact Type'),
        tCode('V', 'PRIMARY',   'Primary'),
        tCode('V', 'SECONDARY', 'Secondary'),
        tCode('V', 'INACTIVE',  'Inactive'),

         ****     SPLTY   ****
        tCode('L', 'SPLTY', 'Specialty'),
        tCode('V', '1000000001', 'Family Medicine'),
        tCode('V', '1000000002', 'Pediatrics'),
        tCode('V', '1000000003', 'Nutritionist'),

        tCode('L', 'STATE', 'State'),
        tCode('V', 'AK', 'ALASKA'),
        tCode('V', 'AL', 'ALABAMA'),
        tCode('V', 'AR', 'ARKANSAS'),
        tCode('V', 'AS', 'AMERICAN SAMOA'),
        tCode('V', 'AZ', 'ARIZONA'),
        tCode('V', 'CA', 'CALIFORNIA'),
        tCode('V', 'CO', 'COLORADO'),
        tCode('V', 'CT', 'CONNECTICUT'),
        tCode('V', 'DC', 'DISTRICT OF COLUMBIA'),
        tCode('V', 'DE', 'DELAWARE'),
        tCode('V', 'FL', 'FLORIDA'),
        tCode('V', 'FM', 'MICRONESIA'),
        tCode('V', 'GA', 'GEORGIA'),
        tCode('V', 'GU', 'GUAM'),
        tCode('V', 'HI', 'HAWAII'),
        tCode('V', 'IA', 'IOWA'),
        tCode('V', 'ID', 'IDAHO'),
        tCode('V', 'IL', 'ILLINOIS'),
        tCode('V', 'IN', 'INDIANA'),
        tCode('V', 'KS', 'KANSAS'),
        tCode('V', 'KY', 'KENTUCKY'),
        tCode('V', 'LA', 'LOUISIANA'),
        tCode('V', 'MA', 'MASSACHUSETTS'),
        tCode('V', 'MD', 'MARYLAND'),
        tCode('V', 'ME', 'MAINE'),
        tCode('V', 'MH', 'MARSHALL ISLANDS'),
        tCode('V', 'MI', 'MICHIGAN'),
        tCode('V', 'MN', 'MINNESOTA'),
        tCode('V', 'MO', 'MISSOURI'),
        tCode('V', 'MP', 'MARIANA ISLANDS'),
        tCode('V', 'MS', 'MISSISSIPPI'),
        tCode('V', 'MT', 'MONTANA'),
        tCode('V', 'NC', 'NORTH CAROLINA'),
        tCode('V', 'ND', 'NORTH DAKOTA'),
        tCode('V', 'NE', 'NEBRASKA'),
        tCode('V', 'NH', 'NEW HAMPSHIRE'),
        tCode('V', 'NJ', 'NEW JERSEY'),
        tCode('V', 'NM', 'NEW MEXICO'),
        tCode('V', 'NV', 'NEVADA'),
        tCode('V', 'NY', 'NEW YORK'),
        tCode('V', 'OH', 'OHIO'),
        tCode('V', 'OK', 'OKLAHOMA'),
        tCode('V', 'OR', 'OREGON'),
        tCode('V', 'PA', 'PENNSYLVANIA'),
        tCode('V', 'PR', 'PUERTO RICO'),
        tCode('V', 'PW', 'PALAU'),
        tCode('V', 'RI', 'RHODE ISLAND'),
        tCode('V', 'SC', 'SOUTH CAROLINA'),
        tCode('V', 'SD', 'SOUTH DAKOTA'),
        tCode('V', 'TN', 'TENNESSEE'),
        tCode('V', 'TX', 'TEXAS'),
        tCode('V', 'UT', 'UTAH'),
        tCode('V', 'VA', 'VIRGINIA'),
        tCode('V', 'VI', 'VIRGIN ISLANDS'),
        tCode('V', 'VT', 'VERMONT'),
        tCode('V', 'WA', 'WASHINGTON'),
        tCode('V', 'WI', 'WISCONSIN'),
        tCode('V', 'WV', 'WEST VIRGINIA'),
        tCode('V', 'WY', 'WYOMING'),

        tCode('L', 'COUNTRY', 'Country'),
        tCode('V', 'AD', 'ANDORRA'),
        tCode('V', 'AE', 'UNITED ARAB EMIRATES'),
        tCode('V', 'AF', 'AFGHANISTAN'),
        tCode('V', 'AG', 'ANTIGUA AND BARBUDA'),
        tCode('V', 'AI', 'ANGUILLA'),
        tCode('V', 'AL', 'ALBANIA'),
        tCode('V', 'AM', 'ARMENIA'),
        tCode('V', 'AN', 'NETHERLANDS ANTILLES'),
        tCode('V', 'AO', 'ANGOLA'),
        tCode('V', 'AQ', 'ANTARCTICA'),
        tCode('V', 'AR', 'ARGENTINA'),
        tCode('V', 'AT', 'AUSTRIA'),
        tCode('V', 'AU', 'AUSTRALIA'),
        tCode('V', 'AW', 'ARUBA'),
        tCode('V', 'AX', 'ALAND ISLANDS'),
        tCode('V', 'AZ', 'AZERBAIJAN'),
        tCode('V', 'BA', 'BOSNIA AND HERZEGOVINA'),
        tCode('V', 'BB', 'BARBADOS'),
        tCode('V', 'BD', 'BANGLADESH'),
        tCode('V', 'BE', 'BELGIUM'),
        tCode('V', 'BF', 'BURKINA FASO'),
        tCode('V', 'BG', 'BULGARIA'),
        tCode('V', 'BH', 'BAHRAIN'),
        tCode('V', 'BI', 'BURUNDI'),
        tCode('V', 'BJ', 'BENIN'),
        tCode('V', 'BM', 'BERMUDA'),
        tCode('V', 'BN', 'BRUNEI DARUSSALAM'),
        tCode('V', 'BO', 'BOLIVIA'),
        tCode('V', 'BR', 'BRAZIL'),
        tCode('V', 'BS', 'BAHAMAS'),
        tCode('V', 'BT', 'BHUTAN'),
        tCode('V', 'BV', 'BOUVET ISLAND'),
        tCode('V', 'BW', 'BOTSWANA'),
        tCode('V', 'BY', 'BELARUS'),
        tCode('V', 'BZ', 'BELIZE'),
        tCode('V', 'CA', 'CANADA'),
        tCode('V', 'CC', 'COCOS (KEELING) ISLANDS'),
        tCode('V', 'CD', 'CONGO'),
        tCode('V', 'CF', 'CENTRAL AFRICAN REPUBLIC'),
        tCode('V', 'CG', 'CONGO'),
        tCode('V', 'CH', 'SWITZERLAND'),
        tCode('V', 'CI', 'COTE D''IVOIRE'),
        tCode('V', 'CK', 'COOK ISLANDS'),
        tCode('V', 'CL', 'CHILE'),
        tCode('V', 'CM', 'CAMEROON'),
        tCode('V', 'CN', 'CHINA'),
        tCode('V', 'CO', 'COLOMBIA'),
        tCode('V', 'CR', 'COSTA RICA'),
        tCode('V', 'CS', 'SERBIA AND MONTENEGRO'),
        tCode('V', 'CU', 'CUBA'),
        tCode('V', 'CV', 'CAPE VERDE'),
        tCode('V', 'CX', 'CHRISTMAS ISLAND'),
        tCode('V', 'CY', 'CYPRUS'),
        tCode('V', 'CZ', 'CZECH REPUBLIC'),
        tCode('V', 'DE', 'GERMANY'),
        tCode('V', 'DJ', 'DJIBOUTI'),
        tCode('V', 'DK', 'DENMARK'),
        tCode('V', 'DM', 'DOMINICA'),
        tCode('V', 'DO', 'DOMINICAN REPUBLIC'),
        tCode('V', 'DZ', 'ALGERIA'),
        tCode('V', 'EC', 'ECUADOR'),
        tCode('V', 'EE', 'ESTONIA'),
        tCode('V', 'EG', 'EGYPT'),
        tCode('V', 'EH', 'WESTERN SAHARA'),
        tCode('V', 'ER', 'ERITREA'),
        tCode('V', 'ES', 'SPAIN'),
        tCode('V', 'ET', 'ETHIOPIA'),
        tCode('V', 'FI', 'FINLAND'),
        tCode('V', 'FJ', 'FIJI'),
        tCode('V', 'FK', 'FALKLAND ISLANDS (MALVINAS)'),
        tCode('V', 'FO', 'FAROE ISLANDS'),
        tCode('V', 'FR', 'FRANCE'),
        tCode('V', 'GA', 'GABON'),
        tCode('V', 'GB', 'GREAT BRITAIN (UK)'),
        tCode('V', 'GD', 'GRENADA'),
        tCode('V', 'GE', 'GEORGIA'),
        tCode('V', 'GF', 'FRENCH GUIANA'),
        tCode('V', 'GG', 'GUERNSEY'),
        tCode('V', 'GH', 'GHANA'),
        tCode('V', 'GI', 'GIBRALTAR'),
        tCode('V', 'GL', 'GREENLAND'),
        tCode('V', 'GM', 'GAMBIA'),
        tCode('V', 'GN', 'GUINEA'),
        tCode('V', 'GP', 'GUADELOUPE'),
        tCode('V', 'GQ', 'EQUATORIAL GUINEA'),
        tCode('V', 'GR', 'GREECE'),
        tCode('V', 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),
        tCode('V', 'GT', 'GUATEMALA'),
        tCode('V', 'GW', 'GUINEA-BISSAU'),
        tCode('V', 'GY', 'GUYANA'),
        tCode('V', 'HK', 'HONG KONG'),
        tCode('V', 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS'),
        tCode('V', 'HN', 'HONDURAS'),
        tCode('V', 'HR', 'CROATIA'),
        tCode('V', 'HT', 'HAITI'),
        tCode('V', 'HU', 'HUNGARY'),
        tCode('V', 'ID', 'INDONESIA'),
        tCode('V', 'IE', 'IRELAND'),
        tCode('V', 'IL', 'ISRAEL'),
        tCode('V', 'IM', 'ISLE OF MAN'),
        tCode('V', 'IN', 'INDIA'),
        tCode('V', 'IO', 'BRITISH INDIAN OCEAN TERRITORY'),
        tCode('V', 'IQ', 'IRAQ'),
        tCode('V', 'IR', 'IRAN'),
        tCode('V', 'IS', 'ICELAND'),
        tCode('V', 'IT', 'ITALY'),
        tCode('V', 'JE', 'JERSEY'),
        tCode('V', 'JM', 'JAMAICA'),
        tCode('V', 'JO', 'JORDAN'),
        tCode('V', 'JP', 'JAPAN'),
        tCode('V', 'KE', 'KENYA'),
        tCode('V', 'KG', 'KYRGYZSTAN'),
        tCode('V', 'KH', 'CAMBODIA'),
        tCode('V', 'KI', 'KIRIBATI'),
        tCode('V', 'KM', 'COMOROS'),
        tCode('V', 'KN', 'SAINT KITTS AND NEVIS'),
        tCode('V', 'KP', 'KOREA'),
        tCode('V', 'KR', 'KOREA'),
        tCode('V', 'KW', 'KUWAIT'),
        tCode('V', 'KY', 'CAYMAN ISLANDS'),
        tCode('V', 'KZ', 'KAZAKHSTAN'),
        tCode('V', 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC'),
        tCode('V', 'LB', 'LEBANON'),
        tCode('V', 'LC', 'SAINT LUCIA'),
        tCode('V', 'LI', 'LIECHTENSTEIN'),
        tCode('V', 'LK', 'SRI LANKA'),
        tCode('V', 'LR', 'LIBERIA'),
        tCode('V', 'LS', 'LESOTHO'),
        tCode('V', 'LT', 'LITHUANIA'),
        tCode('V', 'LU', 'LUXEMBOURG'),
        tCode('V', 'LV', 'LATVIA'),
        tCode('V', 'LY', 'LIBYAN ARAB JAMAHIRIYA'),
        tCode('V', 'MA', 'MOROCCO'),
        tCode('V', 'MC', 'MONACO'),
        tCode('V', 'MD', 'MOLDOVA'),
        tCode('V', 'MG', 'MADAGASCAR'),
        tCode('V', 'MK', 'MACEDONIA'),
        tCode('V', 'ML', 'MALI'),
        tCode('V', 'MM', 'MYANMAR'),
        tCode('V', 'MN', 'MONGOLIA'),
        tCode('V', 'MO', 'MACAO'),
        tCode('V', 'MQ', 'MARTINIQUE'),
        tCode('V', 'MR', 'MAURITANIA'),
        tCode('V', 'MS', 'MONTSERRAT'),
        tCode('V', 'MT', 'MALTA'),
        tCode('V', 'MU', 'MAURITIUS'),
        tCode('V', 'MV', 'MALDIVES'),
        tCode('V', 'MW', 'MALAWI'),
        tCode('V', 'MX', 'MEXICO'),
        tCode('V', 'MY', 'MALAYSIA'),
        tCode('V', 'MZ', 'MOZAMBIQUE'),
        tCode('V', 'NA', 'NAMIBIA'),
        tCode('V', 'NC', 'NEW CALEDONIA'),
        tCode('V', 'NE', 'NIGER'),
        tCode('V', 'NF', 'NORFOLK ISLAND'),
        tCode('V', 'NG', 'NIGERIA'),
        tCode('V', 'NI', 'NICARAGUA'),
        tCode('V', 'NL', 'NETHERLANDS'),
        tCode('V', 'NO', 'NORWAY'),
        tCode('V', 'NP', 'NEPAL'),
        tCode('V', 'NR', 'NAURU'),
        tCode('V', 'NU', 'NIUE'),
        tCode('V', 'NZ', 'NEW ZEALAND'),
        tCode('V', 'OM', 'OMAN'),
        tCode('V', 'PA', 'PANAMA'),
        tCode('V', 'PE', 'PERU'),
        tCode('V', 'PF', 'FRENCH POLYNESIA'),
        tCode('V', 'PG', 'PAPUA NEW GUINEA'),
        tCode('V', 'PH', 'PHILIPPINES'),
        tCode('V', 'PK', 'PAKISTAN'),
        tCode('V', 'PL', 'POLAND'),
        tCode('V', 'PM', 'SAINT PIERRE AND MIQUELON'),
        tCode('V', 'PN', 'PITCAIRN'),
        tCode('V', 'PS', 'PALESTINIAN TERRITORY'),
        tCode('V', 'PT', 'PORTUGAL'),
        tCode('V', 'PY', 'PARAGUAY'),
        tCode('V', 'QA', 'QATAR'),
        tCode('V', 'RE', 'REUNION'),
        tCode('V', 'RO', 'ROMANIA'),
        tCode('V', 'RU', 'RUSSIAN FEDERATION'),
        tCode('V', 'RW', 'RWANDA'),
        tCode('V', 'SA', 'SAUDI ARABIA'),
        tCode('V', 'SB', 'SOLOMON ISLANDS'),
        tCode('V', 'SC', 'SEYCHELLES'),
        tCode('V', 'SD', 'SUDAN'),
        tCode('V', 'SE', 'SWEDEN'),
        tCode('V', 'SG', 'SINGAPORE'),
        tCode('V', 'SH', 'SAINT HELENA'),
        tCode('V', 'SI', 'SLOVENIA'),
        tCode('V', 'SJ', 'SVALBARD AND JAN MAYEN'),
        tCode('V', 'SK', 'SLOVAKIA'),
        tCode('V', 'SL', 'SIERRA LEONE'),
        tCode('V', 'SM', 'SAN MARINO'),
        tCode('V', 'SN', 'SENEGAL'),
        tCode('V', 'SO', 'SOMALIA'),
        tCode('V', 'SR', 'SURINAME'),
        tCode('V', 'ST', 'SAO TOME AND PRINCIPE'),
        tCode('V', 'SV', 'EL SALVADOR'),
        tCode('V', 'SY', 'SYRIAN ARAB REPUBLIC'),
        tCode('V', 'SZ', 'SWAZILAND'),
        tCode('V', 'TC', 'TURKS AND CAICOS ISLANDS'),
        tCode('V', 'TD', 'CHAD'),
        tCode('V', 'TF', 'FRENCH SOUTHERN TERRITORIES'),
        tCode('V', 'TG', 'TOGO'),
        tCode('V', 'TH', 'THAILAND'),
        tCode('V', 'TJ', 'TAJIKISTAN'),
        tCode('V', 'TK', 'TOKELAU'),
        tCode('V', 'TL', 'TIMOR-LESTE'),
        tCode('V', 'TM', 'TURKMENISTAN'),
        tCode('V', 'TN', 'TUNISIA'),
        tCode('V', 'TO', 'TONGA'),
        tCode('V', 'TR', 'TURKEY'),
        tCode('V', 'TT', 'TRINIDAD AND TOBAGO'),
        tCode('V', 'TV', 'TUVALU'),
        tCode('V', 'TW', 'TAIWAN'),
        tCode('V', 'TZ', 'TANZANIA'),
        tCode('V', 'UA', 'UKRAINE'),
        tCode('V', 'UG', 'UGANDA'),
        tCode('V', 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS'),
        tCode('V', 'US', 'UNITED STATES'),
        tCode('V', 'UY', 'URUGUAY'),
        tCode('V', 'UZ', 'UZBEKISTAN'),
        tCode('V', 'VA', 'HOLY SEE (VATICAN CITY STATE)'),
        tCode('V', 'VC', 'SAINT VINCENT AND THE GRENADINES'),
        tCode('V', 'VE', 'VENEZUELA'),
        tCode('V', 'VG', 'VIRGIN ISLANDS'),
        tCode('V', 'VN', 'VIET NAM'),
        tCode('V', 'VU', 'VANUATU'),
        tCode('V', 'WF', 'WALLIS AND FUTUNA'),
        tCode('V', 'WS', 'SAMOA'),
        tCode('V', 'YE', 'YEMEN'),
        tCode('V', 'YT', 'MAYOTTE'),
        tCode('V', 'ZA', 'SOUTH AFRICA'),
        tCode('V', 'ZM', 'ZAMBIA'),
        tCode('V', 'ZW', 'ZIMBABWE'),

         ****     LANGUAGE   ****
        tCode('L', 'LANGUAGE', 'Language'),
        tCode('V', 'AA', 'Afar'),
        tCode('V', 'AB', 'Abkhazian'),
        tCode('V', 'AF', 'Afrikaans'),
        tCode('V', 'AM', 'Amharic'),
        tCode('V', 'AR', 'Arabic'),
        tCode('V', 'AS', 'Assamese'),
        tCode('V', 'AY', 'Aymara'),
        tCode('V', 'AZ', 'Azerbaijani'),
        tCode('V', 'BA', 'Bashkir'),
        tCode('V', 'BE', 'Byelorussian'),
        tCode('V', 'BG', 'Bulgarian'),
        tCode('V', 'BH', 'Bihari'),
        tCode('V', 'BI', 'Bislama'),
        tCode('V', 'BN', 'Bengali'),
        tCode('V', 'BO', 'Tibetan'),
        tCode('V', 'BR', 'Breton'),
        tCode('V', 'CA', 'Catalan'),
        tCode('V', 'CO', 'Corsican'),
        tCode('V', 'CS', 'Czech'),
        tCode('V', 'CY', 'Welsh'),
        tCode('V', 'DA', 'Danish'),
        tCode('V', 'DE', 'German'),
        tCode('V', 'DZ', 'Bhutani'),
        tCode('V', 'EL', 'Greek'),
        tCode('V', 'EN', 'English'),
        tCode('V', 'EO', 'Esperanto'),
        tCode('V', 'ES', 'Spanish'),
        tCode('V', 'ET', 'Estonian'),
        tCode('V', 'EU', 'Basque'),
        tCode('V', 'FA', 'Persian'),
        tCode('V', 'FI', 'Finnish'),
        tCode('V', 'FJ', 'Fiji'),
        tCode('V', 'FO', 'Faeroese'),
        tCode('V', 'FR', 'French'),
        tCode('V', 'FY', 'Frisian'),
        tCode('V', 'GA', 'Irish'),
        tCode('V', 'GD', 'Gaelic'),
        tCode('V', 'GL', 'Galician'),
        tCode('V', 'GN', 'Guarani'),
        tCode('V', 'GU', 'Gujarati'),
        tCode('V', 'HA', 'Hausa'),
        tCode('V', 'HI', 'Hindi'),
        tCode('V', 'HR', 'Croatian'),
        tCode('V', 'HU', 'Hungarian'),
        tCode('V', 'HY', 'Armenian'),
        tCode('V', 'IA', 'Interlingua'),
        tCode('V', 'IE', 'Interlingue'),
        tCode('V', 'IK', 'Inupiak'),
        tCode('V', 'IN', 'Indonesian'),
        tCode('V', 'IS', 'Icelandic'),
        tCode('V', 'IT', 'Italian'),
        tCode('V', 'IW', 'Hebrew'),
        tCode('V', 'JA', 'Japanese'),
        tCode('V', 'JI', 'Yiddish'),
        tCode('V', 'JW', 'Javanese'),
        tCode('V', 'KA', 'Georgian'),
        tCode('V', 'KK', 'Kazakh'),
        tCode('V', 'KL', 'Greenlandic'),
        tCode('V', 'KM', 'Cambodian'),
        tCode('V', 'KN', 'Kannada'),
        tCode('V', 'KO', 'Korean'),
        tCode('V', 'KS', 'Kashmiri'),
        tCode('V', 'KU', 'Kurdish'),
        tCode('V', 'KY', 'Kirghiz'),
        tCode('V', 'LA', 'Latin'),
        tCode('V', 'LN', 'Lingala'),
        tCode('V', 'LO', 'Laothian'),
        tCode('V', 'LT', 'Lithuanian'),
        tCode('V', 'LV', 'Latvian'),
        tCode('V', 'MG', 'Malagasy'),
        tCode('V', 'MI', 'Maori'),
        tCode('V', 'MK', 'Macedonian'),
        tCode('V', 'ML', 'Malayalam'),
        tCode('V', 'MN', 'Mongolian'),
        tCode('V', 'MO', 'Moldavian'),
        tCode('V', 'MR', 'Marathi'),
        tCode('V', 'MS', 'Malay'),
        tCode('V', 'MT', 'Maltese'),
        tCode('V', 'MY', 'Burmese'),
        tCode('V', 'NA', 'Nauru'),
        tCode('V', 'NE', 'Nepali'),
        tCode('V', 'NL', 'Dutch'),
        tCode('V', 'NO', 'Norwegian'),
        tCode('V', 'OC', 'Occitan'),
        tCode('V', 'OM', 'Oromo'),
        tCode('V', 'OR', 'Oriya'),
        tCode('V', 'PA', 'Punjabi'),
        tCode('V', 'PL', 'Polish'),
        tCode('V', 'PS', 'Pashto'),
        tCode('V', 'PT', 'Portuguese'),
        tCode('V', 'QU', 'Quechua'),
        tCode('V', 'RM', 'Rhaeto-Romance'),
        tCode('V', 'RN', 'Kirundi'),
        tCode('V', 'RO', 'Romanian'),
        tCode('V', 'RU', 'Russian'),
        tCode('V', 'RW', 'Kinyarwanda'),
        tCode('V', 'SA', 'Sanskrit'),
        tCode('V', 'SD', 'Sindhi'),
        tCode('V', 'SG', 'Sangro'),
        tCode('V', 'SH', 'Serbo-Croatian'),
        tCode('V', 'SI', 'Singhalese'),
        tCode('V', 'SK', 'Slovak'),
        tCode('V', 'SL', 'Slovenian'),
        tCode('V', 'SM', 'Samoan'),
        tCode('V', 'SN', 'Shona'),
        tCode('V', 'SO', 'Somali'),
        tCode('V', 'SQ', 'Albanian'),
        tCode('V', 'SR', 'Serbian'),
        tCode('V', 'SS', 'Siswati'),
        tCode('V', 'ST', 'Sesotho'),
        tCode('V', 'SU', 'Sudanese'),
        tCode('V', 'SV', 'Swedish'),
        tCode('V', 'SW', 'Swahili'),
        tCode('V', 'TA', 'Tamil'),
        tCode('V', 'TE', 'Tegulu'),
        tCode('V', 'TG', 'Tajik'),
        tCode('V', 'TH', 'Thai'),
        tCode('V', 'TI', 'Tigrinya'),
        tCode('V', 'TK', 'Turkmen'),
        tCode('V', 'TL', 'Tagalog'),
        tCode('V', 'TN', 'Setswana'),
        tCode('V', 'TO', 'Tonga'),
        tCode('V', 'TR', 'Turkish'),
        tCode('V', 'TS', 'Tsonga'),
        tCode('V', 'TT', 'Tatar'),
        tCode('V', 'TW', 'Twi'),
        tCode('V', 'UK', 'Ukrainian'),
        tCode('V', 'UR', 'Urdu'),
        tCode('V', 'UZ', 'Uzbek'),
        tCode('V', 'VI', 'Vietnamese'),
        tCode('V', 'VO', 'Volapuk'),
        tCode('V', 'WO', 'Wolof'),
        tCode('V', 'XH', 'Xhosa'),
        tCode('V', 'YO', 'Yoruba'),
        tCode('V', 'ZH', 'Chinese'),
        tCode('V', 'ZU', 'Zulu')

    );

begin

    select TO_CHAR(sysdate, 'MM/DD/YYYY') into v_date from dual;
    select user into v_user from dual;

    select appl_id into v_appl_id from sbyn_appl where code = 'EV';
    if SQL%NOTFOUND then
        dbms_output.put_line('ERROR: appl_id not found for EV.');
        goto abort;
    end if;

    delete from sbyn_common_detail where common_header_id in
        (select common_header_id from sbyn_common_header
        where appl_id = v_appl_id);

    delete from sbyn_common_header
    where appl_id = v_appl_id;

    update sbyn_seq_table set seq_count = seq_count + 1
    where seq_name = 'SBYN_COMMON_HEADER';

    select seq_count - 1 into v_header_seq from sbyn_seq_table
    where seq_name = 'SBYN_COMMON_HEADER';

    update sbyn_seq_table set seq_count = seq_count + 1
    where seq_name = 'SBYN_COMMON_DETAIL';

    select seq_count - 1 into v_detail_seq from sbyn_seq_table
    where seq_name = 'SBYN_COMMON_DETAIL';

    v_idx := codes.FIRST;
    WHILE v_idx <= codes.LAST LOOP
        IF codes(v_idx).type = 'L' THEN
            insert into sbyn_common_header (common_header_id, appl_id, code, descr, read_only, max_input_len, typ_table_code, create_date, create_userid)
            values (v_header_seq, v_appl_id, codes(v_idx).code, codes(v_idx).descr , 'Y', 8, 'XX', TO_DATE(v_date, 'MM/DD/YYYY'), v_user ) ;
            v_header_seq := v_header_seq + 1;
        ELSE
            insert into sbyn_common_detail (common_detail_id, common_header_id, code, descr, read_only, create_date, create_userid)
            values (v_detail_seq, v_header_seq-1, codes(v_idx).code , codes(v_idx).descr, 'N', TO_DATE(v_date, 'MM/DD/YYYY'), v_user ) ;
            v_detail_seq := v_detail_seq + 1;
        END IF;
        v_idx := codes.NEXT(v_idx);
    END LOOP;

    update sbyn_seq_table set seq_count =  v_header_seq
    where seq_name = 'SBYN_COMMON_HEADER';

    update sbyn_seq_table set seq_count =  v_detail_seq
    where seq_name = 'SBYN_COMMON_DETAIL';

    commit;

<<abort>>
    rollback;
end;
/
