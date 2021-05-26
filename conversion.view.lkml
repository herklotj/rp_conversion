view: conversion {
  derived_table: {
    sql: SELECT
          c.quote_id,
          c.quote_dttm,
          c.marginpricetest_indicator_desc,
          c.overallpricetest_indicator_desc,
          case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end as risk_premium,
          case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end as quoted_premium,
          c.member_score_unbanded,
          ifnull(c.initial_quote_to_inception,-1) as initial_quote_to_inception,
          to_timestamp(c.cover_start_dt) as cover_start_dttm,
          c.consumer_name,
          c.originator_name,
          c.rct_noquote_an,
          c.rct_modelnumber,
          s.sale_timestamp,
          m.rct_mi_13 as scheme_number,
          m.rct_mi_14 as predicted_market_premium,
          c.margin,
          case when max(cast(substr(c.rct_modelnumber,23,3),int)) over() = cast(substr(c.rct_modelnumber,23,3),int) then 1 else 0 end as is_most_recent_model,
          postal_area,
          drv.*,
          v.*,
          year(sysdate) - year_of_registration as vehicle_age,
          c.cover_start_dt - to_date(c.quote_dttm) as leadtime,
          ra.pi_rated_area,
           CASE WHEN to_date(c.quote_dttm) >= '2021-04-21'  AND marginpricetest_indicator_desc = '26: Aug18' THEN 'NEW (26)' WHEN to_date(c.quote_dttm) >= '2021-04-28' AND marginpricetest_indicator_desc = '32: NM Jul18 - New Margin' THEN 'NEW (32)' WHEN to_date(c.quote_dttm) >= '2021-05-14' AND marginpricetest_indicator_desc = '33: M July19' THEN 'NEW (33)' WHEN to_date(c.quote_dttm) >= '2021-05-21'  AND marginpricetest_indicator_desc = '35: NM July 19' THEN 'NEW (35)' ELSE 'OLD' END AS model_type,
          CASE
           WHEN case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.2 THEN '<0.2'
           WHEN 0.2 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.22 THEN '>=0.2 AND <0.22'
           WHEN 0.22 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.24 THEN '>=0.22 AND <0.24'
           WHEN 0.24 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.26 THEN '>=0.24 AND <0.26'
           WHEN 0.26 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.28 THEN '>=0.26 AND <0.28'
           WHEN 0.28 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.30 THEN '>=0.28 AND <0.30'
           WHEN 0.30 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.32 THEN '>=0.30 AND <0.32'
           WHEN 0.32 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.34 THEN '>=0.32 AND <0.34'
           WHEN 0.34 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.36 THEN '>=0.34 AND <0.36'
           WHEN 0.36 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.38 THEN '>=0.36 AND <0.38'
           WHEN 0.38 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.40 THEN '>=0.38 AND <0.40'
           WHEN 0.40 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.42 THEN '>=0.40 AND <0.42'
           WHEN 0.42 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.44 THEN '>=0.42 AND <0.44'
           WHEN 0.44 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.46 THEN '>=0.44 AND <0.46'
           WHEN 0.46 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.48 THEN '>=0.46 AND <0.48'
           WHEN 0.48 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.50 THEN '>=0.48 AND <0.50'
           WHEN 0.50 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.52 THEN '>=0.50 AND <0.52'
           WHEN 0.52 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.54 THEN '>=0.52 AND <0.54'
           WHEN 0.54 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.56 THEN '>=0.54 AND <0.56'
           WHEN 0.56 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.58 THEN '>=0.56 AND <0.58'
           WHEN 0.58 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.60 THEN '>=0.58 AND <0.60'
           WHEN 0.60 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.62 THEN '>=0.60 AND <0.62'
           WHEN 0.62 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.64 THEN '>=0.62 AND <0.64'
           WHEN 0.64 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.66 THEN '>=0.64 AND <0.66'
           WHEN 0.66 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.68 THEN '>=0.66 AND <0.68'
           WHEN 0.68 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.70 THEN '>=0.68 AND <0.70'
           WHEN 0.70 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.72 THEN '>=0.70 AND <0.72'
           WHEN 0.72 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.74 THEN '>=0.72 AND <0.74'
           WHEN 0.74 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.76 THEN '>=0.74 AND <0.76'
           WHEN 0.76 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.78 THEN '>=0.76 AND <0.78'
           WHEN 0.78 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.80 THEN '>=0.78 AND <0.80'
           WHEN 0.80 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.82 THEN '>=0.80 AND <0.82'
           WHEN 0.82 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.84 THEN '>=0.82 AND <0.84'
           WHEN 0.84 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.86 THEN '>=0.84 AND <0.86'
           WHEN 0.86 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.88 THEN '>=0.86 AND <0.88'
           WHEN 0.88 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.90 THEN '>=0.88 AND <0.90'
           WHEN 0.90 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.92 THEN '>=0.90 AND <0.92'
           WHEN 0.92 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.94 THEN '>=0.92 AND <0.94'
           WHEN 0.94 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.96 THEN '>=0.94 AND <0.96'
           WHEN 0.96 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 0.98 THEN '>=0.96 AND <0.98'
           WHEN 0.98 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.00 THEN '>=0.98 AND <1.00'
           WHEN 1.00 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.02 THEN '>=1.00 AND <1.02'
           WHEN 1.02 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.04 THEN '>=1.02 AND <1.04'
           WHEN 1.04 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.06 THEN '>=1.04 AND <1.06'
           WHEN 1.06 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.08 THEN '>=1.06 AND <1.08'
           WHEN 1.08 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.10 THEN '>=1.08 AND <1.10'
           WHEN 1.10 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.12 THEN '>=1.10 AND <1.12'
           WHEN 1.12 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.14 THEN '>=1.12 AND <1.14'
           WHEN 1.14 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.16 THEN '>=1.14 AND <1.16'
           WHEN 1.16 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.18 THEN '>=1.16 AND <1.18'
           WHEN 1.18 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.20 THEN '>=1.18 AND <1.20'
       WHEN 1.20 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.22 THEN '>=1.20 AND <1.22'
           WHEN 1.22 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.24 THEN '>=1.22 AND <1.24'
           WHEN 1.24 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.26 THEN '>=1.24 AND <1.26'
           WHEN 1.26 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.28 THEN '>=1.26 AND <1.28'
           WHEN 1.28 <= case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 < 1.30 THEN '>=1.28 AND <1.30'
           WHEN case when c.protect_no_claims_bonus = 'false' then c.riskpremium_an else c.riskpremium_ap end / rct_mi_14 >= 1.30 THEN '>=1.30'
         END AS rp_mkt_bands,
        CASE WHEN case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.2 THEN '<0.2'
           WHEN 0.2 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.22 THEN '>=0.2 AND <0.22'
           WHEN 0.22 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.24 THEN '>=0.22 AND <0.24'
           WHEN 0.24 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.26 THEN '>=0.24 AND <0.26'
           WHEN 0.26 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.28 THEN '>=0.26 AND <0.28'
           WHEN 0.28 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.30 THEN '>=0.28 AND <0.30'
           WHEN 0.30 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.32 THEN '>=0.30 AND <0.32'
           WHEN 0.32 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.34 THEN '>=0.32 AND <0.34'
           WHEN 0.34 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.36 THEN '>=0.34 AND <0.36'
           WHEN 0.36 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.38 THEN '>=0.36 AND <0.38'
           WHEN 0.38 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.40 THEN '>=0.38 AND <0.40'
           WHEN 0.40 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.42 THEN '>=0.40 AND <0.42'
           WHEN 0.42 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.44 THEN '>=0.42 AND <0.44'
           WHEN 0.44 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.46 THEN '>=0.44 AND <0.46'
           WHEN 0.46 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.48 THEN '>=0.46 AND <0.48'
           WHEN 0.48 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.50 THEN '>=0.48 AND <0.50'
           WHEN 0.50 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.52 THEN '>=0.50 AND <0.52'
           WHEN 0.52 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.54 THEN '>=0.52 AND <0.54'
           WHEN 0.54 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.56 THEN '>=0.54 AND <0.56'
           WHEN 0.56 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.58 THEN '>=0.56 AND <0.58'
           WHEN 0.58 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.60 THEN '>=0.58 AND <0.60'
           WHEN 0.60 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.62 THEN '>=0.60 AND <0.62'
           WHEN 0.62 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.64 THEN '>=0.62 AND <0.64'
           WHEN 0.64 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.66 THEN '>=0.64 AND <0.66'
           WHEN 0.66 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.68 THEN '>=0.66 AND <0.68'
           WHEN 0.68 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.70 THEN '>=0.68 AND <0.70'
           WHEN 0.70 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.72 THEN '>=0.70 AND <0.72'
           WHEN 0.72 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.74 THEN '>=0.72 AND <0.74'
           WHEN 0.74 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.76 THEN '>=0.74 AND <0.76'
           WHEN 0.76 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.78 THEN '>=0.76 AND <0.78'
           WHEN 0.78 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.80 THEN '>=0.78 AND <0.80'
           WHEN 0.80 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.82 THEN '>=0.80 AND <0.82'
           WHEN 0.82 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.84 THEN '>=0.82 AND <0.84'
           WHEN 0.84 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.86 THEN '>=0.84 AND <0.86'
           WHEN 0.86 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.88 THEN '>=0.86 AND <0.88'
           WHEN 0.88 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.90 THEN '>=0.88 AND <0.90'
           WHEN 0.90 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.92 THEN '>=0.90 AND <0.92'
           WHEN 0.92 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.94 THEN '>=0.92 AND <0.94'
           WHEN 0.94 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.96 THEN '>=0.94 AND <0.96'
           WHEN 0.96 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 0.98 THEN '>=0.96 AND <0.98'
           WHEN 0.98 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.00 THEN '>=0.98 AND <1.00'
           WHEN 1.00 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.02 THEN '>=1.00 AND <1.02'
           WHEN 1.02 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.04 THEN '>=1.02 AND <1.04'
           WHEN 1.04 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.06 THEN '>=1.04 AND <1.06'
           WHEN 1.06 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.08 THEN '>=1.06 AND <1.08'
           WHEN 1.08 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.10 THEN '>=1.08 AND <1.10'
           WHEN 1.10 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.12 THEN '>=1.10 AND <1.12'
           WHEN 1.12 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.14 THEN '>=1.12 AND <1.14'
           WHEN 1.14 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.16 THEN '>=1.14 AND <1.16'
           WHEN 1.16 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.18 THEN '>=1.16 AND <1.18'
           WHEN 1.18 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.20 THEN '>=1.18 AND <1.20'
       WHEN 1.20 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.22 THEN '>=1.20 AND <1.22'
           WHEN 1.22 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.24 THEN '>=1.22 AND <1.24'
           WHEN 1.24 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.26 THEN '>=1.24 AND <1.26'
           WHEN 1.26 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.28 THEN '>=1.26 AND <1.28'
           WHEN 1.28 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.30 THEN '>=1.28 AND <1.30'
       WHEN 1.30 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.32 THEN '>=1.30 AND <1.32'
           WHEN 1.32 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.34 THEN '>=1.32 AND <1.34'
           WHEN 1.34 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.36 THEN '>=1.34 AND <1.36'
           WHEN 1.36 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.38 THEN '>=1.36 AND <1.38'
           WHEN 1.38 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.40 THEN '>=1.38 AND <1.40'
       WHEN 1.40 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.42 THEN '>=1.40 AND <1.42'
           WHEN 1.42 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.44 THEN '>=1.42 AND <1.44'
           WHEN 1.44 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.46 THEN '>=1.44 AND <1.46'
           WHEN 1.46 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.48 THEN '>=1.46 AND <1.48'
           WHEN 1.48 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.50 THEN '>=1.48 AND <1.50'
       WHEN 1.50 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.52 THEN '>=1.50 AND <1.52'
           WHEN 1.52 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.54 THEN '>=1.52 AND <1.54'
           WHEN 1.54 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.56 THEN '>=1.54 AND <1.56'
           WHEN 1.56 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.58 THEN '>=1.56 AND <1.58'
           WHEN 1.58 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.60 THEN '>=1.58 AND <1.60'
       WHEN 1.60 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.62 THEN '>=1.60 AND <1.62'
           WHEN 1.62 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.64 THEN '>=1.62 AND <1.64'
           WHEN 1.64 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.66 THEN '>=1.64 AND <1.66'
           WHEN 1.66 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.68 THEN '>=1.66 AND <1.68'
           WHEN 1.68 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.70 THEN '>=1.68 AND <1.60'
       WHEN 1.70 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.72 THEN '>=1.70 AND <1.72'
           WHEN 1.72 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.74 THEN '>=1.72 AND <1.74'
           WHEN 1.74 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.76 THEN '>=1.74 AND <1.76'
           WHEN 1.76 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.78 THEN '>=1.76 AND <1.78'
           WHEN 1.78 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.80 THEN '>=1.78 AND <1.80'
       WHEN 1.80 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.82 THEN '>=1.80 AND <1.82'
           WHEN 1.82 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.84 THEN '>=1.82 AND <1.84'
           WHEN 1.84 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.86 THEN '>=1.84 AND <1.86'
           WHEN 1.86 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.88 THEN '>=1.86 AND <1.88'
           WHEN 1.88 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.90 THEN '>=1.88 AND <1.90'
       WHEN 1.90 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.92 THEN '>=1.90 AND <1.92'
           WHEN 1.92 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.94 THEN '>=1.92 AND <1.94'
           WHEN 1.94 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.96 THEN '>=1.94 AND <1.96'
           WHEN 1.96 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 1.98 THEN '>=1.96 AND <1.98'
           WHEN 1.98 <= case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 AND case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 < 2.00 THEN '>=1.98 AND <2.00'
           WHEN case when c.protect_no_claims_bonus = 'false' then c.quotedpremium_an_notinclipt else c.quotedpremium_ap_notinclipt end / rct_mi_14 >= 2.0 THEN '>=2.0'
         END AS qp_mkt_bands
        FROM
            (select *
             from
                qs_cover
             WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 2
             and motor_transaction_type = 'NewBusiness' and business_purpose = '' and rct_noquote_an = 0
             ) c
        LEFT JOIN hourly_sales s
          on lower(c.quote_id) = lower(s.insurer_quote_ref)
        LEFT JOIN qs_mi_outputs m
          on c.quote_id = m.quote_id
        left join rated_areas ra
          on replace(c.risk_postcode,' ','') =ra.postcode
        inner join
          ( select
              quote_id
              ,min(floor( (to_date(quote_dttm) - birth_dt)/365)) as Min_age
              ,min( case when driver_id = 0 then floor( (to_date(quote_dttm) - birth_dt)/365) else 9999 end) as PH_Age
              ,min( case when driver_id = 0 then ncb_years else 9999 end) as NCB
              ,min( case when driver_id = 0 then gender else null end) as PH_gender
              ,sum(no_claims) as Policy_Claims
              ,sum(no_convictions) as Policy_Convictions
            from
              qs_drivers
            WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 2
            group by quote_id
          )drv
          on c.quote_id = drv.quote_id
        inner join
          (select
              *
           from
              qs_vehicles
           WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 2
          ) v
          on v.quote_id=c.quote_id
     ;;
  }


  dimension: digital_rehost {
    type: string
    sql: case when quote_dttm >='2019-11-08' and quote_dttm <'2019-11-15' then 'Post Rehost 7 days'
            when quote_dttm >='2019-11-01' and quote_dttm <'2019-11-08' then 'Pre Rehost 7 days'
            else 'Other' end;;


    }

  dimension: quote_id {
    type:  string
    sql: quote_id ;;
  }

  dimension: model_type {
    type:  string
    sql: model_type ;;
  }

  dimension: rp_market_bands {
    label: "Risk Premium by Market Ratio"
    type: string
    sql: ${TABLE}.rp_mkt_bands ;;
  }

  dimension: qp_market_bands {
    label: "Quoted Premium by Market Ratio"
    type: string
    sql: ${TABLE}.qp_mkt_bands ;;
  }



    dimension_group: quote {
      type: time
      timeframes: [
        raw,
        time,
        hour_of_day,
        date,
        week,
        month
      ]
      sql: ${TABLE}.quote_dttm ;;
    }

    dimension: postal_area {
      label: "Postcode Area"
      type: string
      sql: ${TABLE}.postal_area ;;
    }


    dimension: marginpricetest_indicator_desc {
      label: "Pricing Strategy"
      type: string
      sql: ${TABLE}.marginpricetest_indicator_desc ;;
    }

    dimension: overallpricetest_indicator_desc {
      label: "Price Test"
      type: string
      sql: ${TABLE}.overallpricetest_indicator_desc ;;
    }

    dimension: risk_premium {
      type: tier
      tiers: [0,50,100,150,200,250,300,400,500]
      style: integer
      sql: ${TABLE}.risk_premium ;;
      value_format_name: gbp_0
    }

    dimension: quoted_premium {
      type: tier
      tiers: [150,250,350,450]
      style: integer
      sql: ${TABLE}.quoted_premium ;;
      value_format_name: gbp
    }

    dimension: min_age {
      type: tier
      tiers: [25,30,40,50,60,70]
      style: integer
      sql: ${TABLE}.min_age ;;

    }


    dimension: ph_age {
      type: tier
      tiers: [25,30,40,50,60,70]
      style: integer
      sql: ${TABLE}.ph_age ;;

    }

    dimension: ph_gender {
      type: string
      sql: ${TABLE}.ph_gender ;;
    }

    dimension: pi_area {
      type: tier
      tiers: [10,20,30,40,50,60]
      style: integer
      sql: ${TABLE}.pi_rated_area ;;

    }

    dimension: ncb {
      type: tier
      tiers: [1,3,7,9]
      style: integer
      sql: ${TABLE}.ncb ;;

    }

    dimension: vehicle_age {
      type: tier
      tiers: [1,4,8,12]
      style: integer
      sql: ${TABLE}.vehicle_age ;;

    }

    dimension: vehicle_value {
      type: tier
      tiers: [1000,3000,6000,10000,15000,20000,30000,50000]
      style: integer
      sql: ${TABLE}.vehicle_value_amount ;;

    }

    dimension: leadtime {
      type: tier
      tiers: [1,5,10,15]
      style: integer
      sql: ${TABLE}.leadtime ;;

    }

    dimension: initial_leadtime {
      type: tier
      tiers: [0,1,10,15,30]
      style: integer
      sql: ${TABLE}.initial_quote_to_inception ;;

    }

    dimension: policy_claims {
      type: tier
      tiers: [1,2]
      style: integer
      sql: ${TABLE}.policy_claims ;;

    }

    dimension: policy_convictions {
      type: tier
      tiers: [1,2]
      style: integer
      sql: ${TABLE}.policy_convictions ;;

    }

    dimension: member_score_unbanded {
      label: "Member Score"
      type: tier
      tiers: [0,0.75,0.8,0.9,1.0,1.1,1.2,1.3]
      style: relational
      sql: ${TABLE}.member_score_unbanded ;;
    }

    dimension_group: cover_start {
      type: time
      timeframes: [
        raw,
        time,
        hour_of_day,
        date,
        week,
        month
      ]
      sql: ${TABLE}.cover_start_dttm ;;
    }

    dimension: consumer_name {
      label: "Channel"
      type: string
      sql: ${TABLE}.consumer_name ;;
    }

    dimension: originator_name {
      type: string
      sql: ${TABLE}.originator_name ;;
    }

    dimension: rct_noquote_an {
      label: "AAUICL Quote"
      type: yesno
      sql: ${TABLE}.rct_noquote_an = 0 ;;
    }

    dimension_group: sale {
      type: time
      timeframes: [
        raw,
        time,
        hour_of_day,
        date,
        week,
        month
      ]
      sql: ${TABLE}.sale_timestamp ;;
    }

    dimension: aauicl_sale {
      label: "AAUICL Sale"
      type: yesno
      sql: ${TABLE}.sale_timestamp is not null  ;;
    }

    dimension: rct_modelnumber {
      label: "Model Number"
      type: string
      sql: ${TABLE}.rct_modelnumber ;;
    }

    dimension: scheme_number {
      type: string
      sql: ${TABLE}.scheme_number ;;
    }

    dimension: is_most_recent_model {
      type: yesno
      sql: ${TABLE}.is_most_recent_model = 1 ;;
    }


# Measures

    measure: total_quotes {
      type: count
      drill_fields: [consumer_name, total_quotes]
    }

    measure: total_sales {
      type: count
      filters: {
        field: sale_time
        value: "-NULL"
      }
      drill_fields: [consumer_name, total_sales]
    }

    measure: total_same_day_sales {
      type: sum
      sql: case when to_date(${TABLE}.sale_timestamp) = to_date(${TABLE}.quote_dttm) then 1 else 0 end ;;
      description: "Quote and purchase on same day"
    }

    measure: conversion_rate {
      type: number
      sql: 1.0*${total_sales}/${total_quotes} ;;
      value_format_name: percent_2
    }

    measure: same_day_conversion_rate {
      type: number
      sql: 1.0*${total_same_day_sales}/${total_quotes} ;;
      value_format_name: percent_2
      description: "Quote and purchase on same day"
    }

  measure: average_risk_premium {
    type: average
    sql:  ${TABLE}.risk_premium ;;
    value_format_name: gbp_0
  }

    measure: average_quoted_premium {
      type: average
      sql:  ${TABLE}.quoted_premium ;;
      value_format_name: gbp_0
    }

  measure: average_predicted_market_premium {
    type: average
    sql:  ${TABLE}.predicted_market_premium ;;
    value_format_name: gbp_0
  }

  measure: margin {
    type: average
    sql:  ${TABLE}.margin ;;
  }

    measure: average_written_premium {
      type: average
      sql:  ${TABLE}.quoted_premium ;;
      value_format_name: gbp_0
      filters: {
        field: sale_time
        value: "-NULL"
      }
    }

    measure: gross_written_premium {
      type: sum
      sql:  ${TABLE}.quoted_premium ;;
      value_format_name: gbp_0
      filters: {
        field: sale_time
        value: "-NULL"
      }
    }

  }
