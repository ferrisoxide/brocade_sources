#! bash
sed -e 's/ENGINE=InnoDB DEFAULT CHARSET=utf8//g' pod_web_2014.01.01_01.sql | \
sed -E "s/ ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33//g" | \
sed -E "s/\`([a-zA-Z0-9_]*)\`/'\1'/g" | \
sed -E "s/INSERT INTO '([a-zA-Z0-9_]*)' /INSERT INTO \1 /g" | \
sed -E "s/CREATE TABLE IF NOT EXISTS '([a-zA-Z0-9_]*)' /CREATE TABLE IF NOT EXISTS \1 /g" | \
sed -E "s/DEFAULT '([0-9]+)'/DEFAULT \1/g" | \
sed -E "s/ COMMENT '.+'//g" | \
sed -E "s/'([a-zA-Z0-9_]+)' varchar/\1 varchar/g" | \
sed "s/varchar(38)/varchar(50)/g" | \
sed -E "s/'([a-zA-Z0-9_]+)' integer/\1 integer/g" | \
sed -E "s/'([a-zA-Z0-9_]+)' int\(([[:digit:]]*)\)/\1 integer/g" | \
sed -E "s/'([a-zA-Z0-9_]+)' date/\1 date/g" | \
sed -E "s/'([a-zA-Z0-9_]+)' text/\1 text/g" | \
sed -E "s/'([a-zA-Z0-9_]+)' float/\1 float/g" | \
sed -E "s/PRIMARY KEY \('([a-zA-Z0-9_]*)'\)/PRIMARY KEY \(\1\)/g" | \
sed -E "s/PRIMARY KEY \('([a-zA-Z0-9_]*)','([a-zA-Z0-9_]*)'\)/PRIMARY KEY \(\1, \2\)/g" | \
sed -E "s/AUTO_INCREMENT//g" | \
sed -E "s/Group varchar\(255\) NOT NULL/GROUP_NAME varchar\(255\) NOT NULL/g" | \
sed "s/INSERT INTO brand ('BSIN', 'BRAND_NM', 'BRAND_TYPE_CD', 'BRAND_LINK')/INSERT INTO brand (BSIN, BRAND_NM, BRAND_TYPE_CD, BRAND_LINK)/g" | \
sed "s/INSERT INTO brand_group ('BSIN', 'Group')/INSERT INTO brand_group (BSIN, GROUP_NAME)/g" | \
sed "s/INSERT INTO brand_owner ('OWNER_CD', 'OWNER_NM', 'OWNER_LINK', 'OWNER_WIKI_EN')/INSERT INTO brand_owner (OWNER_CD, OWNER_NM, OWNER_LINK, OWNER_WIKI_EN)/g" | \
sed "s/INSERT INTO brand_owner_bsin ('BSIN', 'OWNER_CD')/INSERT INTO brand_owner_bsin (BSIN, OWNER_CD)/g" | \
sed "s/INSERT INTO gs1_gcp ('GCP_CD', 'GLN_CD', 'GLN_NM', 'GLN_ADDR_02', 'GLN_ADDR_03', 'GLN_ADDR_04', 'GLN_ADDR_POSTALCODE', 'GLN_ADDR_CITY', 'GLN_COUNTRY_ISO_CD', 'CONTACT_NAME', 'CONTACT_TEL', 'CONTACT_HOTLINE', 'CONTACT_FAX', 'CONTACT_MAIL', 'CONTACT_WEB', 'GLN_LAST_CHANGE', 'GLN_PROVIDER', 'SEARCH_GTIN_CD', 'GEPIR_GCP_CD', 'ADD_PARTY_ID', 'RETURN_CODE', 'SOURCE', 'SYNC_DT')/INSERT INTO gs1_gcp (GCP_CD, GLN_CD, GLN_NM, GLN_ADDR_02, GLN_ADDR_03, GLN_ADDR_04, GLN_ADDR_POSTALCODE, GLN_ADDR_CITY, GLN_COUNTRY_ISO_CD, CONTACT_NAME, CONTACT_TEL, CONTACT_HOTLINE, CONTACT_FAX, CONTACT_MAIL, CONTACT_WEB, GLN_LAST_CHANGE, GLN_PROVIDER, SEARCH_GTIN_CD, GEPIR_GCP_CD, ADD_PARTY_ID, RETURN_CODE, SOURCE, SYNC_DT)/g" | \
sed "s/INSERT INTO gs1_prefix ('PREFIX_CD', 'PREFIX_NM', 'COUNTRY_ISO_CD')/INSERT INTO gs1_prefix (PREFIX_CD, PREFIX_NM, COUNTRY_ISO_CD)/g" | \
sed "s/INSERT INTO brand_type ('BRAND_TYPE_CD', 'BRAND_TYPE_NM')/INSERT INTO brand_type (BRAND_TYPE_CD, BRAND_TYPE_NM)/g" | \
sed "s/INSERT INTO gs1_gcp_nb ('prefix_cd', 'gcp_length', 'gcp_nb')/INSERT INTO gs1_gcp_nb (prefix_cd, gcp_length, gcp_nb)/g" | \
sed "s/INSERT INTO gs1_gpc ('GPC_LANG', 'GPC_CD', 'GPC_NM', 'GPC_LEVEL', 'SOURCE')/INSERT INTO gs1_gpc (GPC_LANG, GPC_CD, GPC_NM, GPC_LEVEL, SOURCE)/g" | \
sed "s/INSERT INTO gs1_gpc_hier ('GPC_S_CD', 'GPC_F_CD', 'GPC_C_CD', 'GPC_B_CD')/INSERT INTO gs1_gpc_hier (GPC_S_CD, GPC_F_CD, GPC_C_CD, GPC_B_CD)/g" | \
sed "s/INSERT INTO gs1_gcp_rc ('RETURN_CODE', 'RETURN_NAME', 'ORIGIN')/INSERT INTO gs1_gcp_rc (RETURN_CODE, RETURN_NAME, ORIGIN)/g" | \
sed "s/INSERT INTO gtin ('GTIN_CD', 'GTIN_LEVEL_CD', 'GCP_CD', 'BSIN', 'GPC_S_CD', 'GPC_F_CD', 'GPC_C_CD', 'GPC_B_CD', 'GTIN_NM', 'PRODUCT_LINE', 'M_G', 'M_OZ', 'M_ML', 'M_FLOZ', 'M_ABV', 'M_ABW', 'PKG_UNIT', 'PKG_TYPE_CD', 'REF_CD', 'SOURCE', 'IMG')/INSERT INTO gtin (GTIN_CD, GTIN_LEVEL_CD, GCP_CD, BSIN, GPC_S_CD, GPC_F_CD, GPC_C_CD, GPC_B_CD, GTIN_NM, PRODUCT_LINE, M_G, M_OZ, M_ML, M_FLOZ, M_ABV, M_ABW, PKG_UNIT, PKG_TYPE_CD, REF_CD, SOURCE, IMG)/g" | \
sed "s/INSERT INTO label ('LABEL_ID', 'LABEL_NM', 'LABEL_LINK')/INSERT INTO label (LABEL_ID, LABEL_NM, LABEL_LINK)/g" | \
sed "s/INSERT INTO label_gtin ('LABEL_ID', 'GTIN_CD')/INSERT INTO label_gtin (LABEL_ID, GTIN_CD)/g" | \
sed "s/INSERT INTO nutrition_us ('GTIN_CD', 'INGREDIENTS', 'SERV_SIZE_G', 'SERV_SIZE_ML', 'SERV_CT', 'CAL', 'CAL_FROM_FAT', 'TOT_FAT_G', 'TOT_FAT_DV', 'SAT_FAT_G', 'SAT_FAT_DV', 'TRANS_FAT_G', 'CHOL_MG', 'CHOL_DV', 'SOD_MG', 'SOD_DV', 'POT_MG', 'POT_DV', 'TOT_CARB_G', 'TOT_CARB_DV', 'DIET_FIBER_G', 'DIET_FIBER_DV', 'SUGARS_G', 'PROTEIN_G', 'VITAMIN_A', 'VITAMIN_C', 'CALCIUM', 'IRON', 'SOURCE', 'SYNC_DT')/INSERT INTO nutrition_us (GTIN_CD, INGREDIENTS, SERV_SIZE_G, SERV_SIZE_ML, SERV_CT, CAL, CAL_FROM_FAT, TOT_FAT_G, TOT_FAT_DV, SAT_FAT_G, SAT_FAT_DV, TRANS_FAT_G, CHOL_MG, CHOL_DV, SOD_MG, SOD_DV, POT_MG, POT_DV, TOT_CARB_G, TOT_CARB_DV, DIET_FIBER_G, DIET_FIBER_DV, SUGARS_G, PROTEIN_G, VITAMIN_A, VITAMIN_C, CALCIUM, IRON, SOURCE, SYNC_DT)/g" | \
sed "s/INSERT INTO pkg_type ('pkg_type_cd', 'pkg_type_nm', 'pkg_type_desc')/INSERT INTO pkg_type (pkg_type_cd, pkg_type_nm, pkg_type_desc)/g" | \
sed -e "s/\\\r\\\n[[:space:]]*//g" | \
sed -E "s/\\\n'/'/g" | \
sed -E "s/\\\\/ /g" | \
sed "s/KEY 'LABEL_ID' ('LABEL_ID','GTIN_CD')/PRIMARY KEY (LABEL_ID, GTIN_CD)/g" | \
sed -E "s/\\\n/ /g" > import.sql
