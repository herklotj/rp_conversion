view: confused_market_data {
  derived_table: {
    sql: select
    q.quote_id,
              q.quote_dttm as quote_date,
              cover_start_dt,
              m.rct_mi_13 as scheme_number,
              q.quotedpremium_ap_notinclipt as AAUICL_Premium,
              m.rct_mi_14 as market_model,
              c.top5annual as confused_prem_top5annual,
              originator_name,
              marginpricetest_indicator_desc,
              CASE WHEN to_date(q.quote_dttm) >= '2021-04-21'  AND marginpricetest_indicator_desc = '26: Aug18' THEN 'NEW (26)' WHEN to_date(q.quote_dttm) >= '2021-04-28' AND marginpricetest_indicator_desc = '32: NM Jul18 - New Margin' THEN 'NEW (32)'ELSE 'OLD' END AS model_type,
             CASE
           WHEN top5annual / rct_mi_14 < 0.2 THEN '<0.2'
           WHEN 0.2 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.22 THEN '>=0.2 AND <0.22'
           WHEN 0.22 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.24 THEN '>=0.22 AND <0.24'
           WHEN 0.24 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.26 THEN '>=0.24 AND <0.26'
           WHEN 0.26 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.28 THEN '>=0.26 AND <0.28'
           WHEN 0.28 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.30 THEN '>=0.28 AND <0.30'
           WHEN 0.30 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.32 THEN '>=0.30 AND <0.32'
           WHEN 0.32 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.34 THEN '>=0.32 AND <0.34'
           WHEN 0.34 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.36 THEN '>=0.34 AND <0.36'
           WHEN 0.36 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.38 THEN '>=0.36 AND <0.38'
           WHEN 0.38 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.40 THEN '>=0.38 AND <0.40'
           WHEN 0.40 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.42 THEN '>=0.40 AND <0.42'
           WHEN 0.42 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.44 THEN '>=0.42 AND <0.44'
           WHEN 0.44 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.46 THEN '>=0.44 AND <0.46'
           WHEN 0.46 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.48 THEN '>=0.46 AND <0.48'
           WHEN 0.48 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.50 THEN '>=0.48 AND <0.50'
           WHEN 0.50 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.52 THEN '>=0.50 AND <0.52'
           WHEN 0.52 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.54 THEN '>=0.52 AND <0.54'
           WHEN 0.54 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.56 THEN '>=0.54 AND <0.56'
           WHEN 0.56 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.58 THEN '>=0.56 AND <0.58'
           WHEN 0.58 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.60 THEN '>=0.58 AND <0.60'
           WHEN 0.60 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.62 THEN '>=0.60 AND <0.62'
           WHEN 0.62 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.64 THEN '>=0.62 AND <0.64'
           WHEN 0.64 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.66 THEN '>=0.64 AND <0.66'
           WHEN 0.66 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.68 THEN '>=0.66 AND <0.68'
           WHEN 0.68 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.70 THEN '>=0.68 AND <0.70'
           WHEN 0.70 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.72 THEN '>=0.70 AND <0.72'
           WHEN 0.72 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.74 THEN '>=0.72 AND <0.74'
           WHEN 0.74 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.76 THEN '>=0.74 AND <0.76'
           WHEN 0.76 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.78 THEN '>=0.76 AND <0.78'
           WHEN 0.78 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.80 THEN '>=0.78 AND <0.80'
           WHEN 0.80 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.82 THEN '>=0.80 AND <0.82'
           WHEN 0.82 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.84 THEN '>=0.82 AND <0.84'
           WHEN 0.84 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.86 THEN '>=0.84 AND <0.86'
           WHEN 0.86 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.88 THEN '>=0.86 AND <0.88'
           WHEN 0.88 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.90 THEN '>=0.88 AND <0.90'
           WHEN 0.90 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.92 THEN '>=0.90 AND <0.92'
           WHEN 0.92 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.94 THEN '>=0.92 AND <0.94'
           WHEN 0.94 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.96 THEN '>=0.94 AND <0.96'
           WHEN 0.96 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 0.98 THEN '>=0.96 AND <0.98'
           WHEN 0.98 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.00 THEN '>=0.98 AND <1.00'
           WHEN 1.00 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.02 THEN '>=1.00 AND <1.02'
           WHEN 1.02 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.04 THEN '>=1.02 AND <1.04'
           WHEN 1.04 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.06 THEN '>=1.04 AND <1.06'
           WHEN 1.06 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.08 THEN '>=1.06 AND <1.08'
           WHEN 1.08 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.10 THEN '>=1.08 AND <1.10'
           WHEN 1.10 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.12 THEN '>=1.10 AND <1.12'
           WHEN 1.12 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.14 THEN '>=1.12 AND <1.14'
           WHEN 1.14 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.16 THEN '>=1.14 AND <1.16'
           WHEN 1.16 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.18 THEN '>=1.16 AND <1.18'
           WHEN 1.18 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.20 THEN '>=1.18 AND <1.20'
       WHEN 1.20 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.22 THEN '>=1.20 AND <1.22'
           WHEN 1.22 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.24 THEN '>=1.22 AND <1.24'
           WHEN 1.24 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.26 THEN '>=1.24 AND <1.26'
           WHEN 1.26 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.28 THEN '>=1.26 AND <1.28'
           WHEN 1.28 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.30 THEN '>=1.28 AND <1.30'
       WHEN 1.30 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.32 THEN '>=1.30 AND <1.32'
           WHEN 1.32 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.34 THEN '>=1.32 AND <1.34'
           WHEN 1.34 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.36 THEN '>=1.34 AND <1.36'
           WHEN 1.36 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.38 THEN '>=1.36 AND <1.38'
           WHEN 1.38 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.40 THEN '>=1.38 AND <1.40'
       WHEN 1.40 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.42 THEN '>=1.40 AND <1.42'
           WHEN 1.42 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.44 THEN '>=1.42 AND <1.44'
           WHEN 1.44 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.46 THEN '>=1.44 AND <1.46'
           WHEN 1.46 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.48 THEN '>=1.46 AND <1.48'
           WHEN 1.48 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.50 THEN '>=1.48 AND <1.50'
       WHEN 1.50 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.52 THEN '>=1.50 AND <1.52'
           WHEN 1.52 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.54 THEN '>=1.52 AND <1.54'
           WHEN 1.54 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.56 THEN '>=1.54 AND <1.56'
           WHEN 1.56 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.58 THEN '>=1.56 AND <1.58'
           WHEN 1.58 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.60 THEN '>=1.58 AND <1.60'
       WHEN 1.60 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.62 THEN '>=1.60 AND <1.62'
           WHEN 1.62 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.64 THEN '>=1.62 AND <1.64'
           WHEN 1.64 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.66 THEN '>=1.64 AND <1.66'
           WHEN 1.66 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.68 THEN '>=1.66 AND <1.68'
           WHEN 1.68 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.70 THEN '>=1.68 AND <1.60'
       WHEN 1.70 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.72 THEN '>=1.70 AND <1.72'
           WHEN 1.72 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.74 THEN '>=1.72 AND <1.74'
           WHEN 1.74 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.76 THEN '>=1.74 AND <1.76'
           WHEN 1.76 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.78 THEN '>=1.76 AND <1.78'
           WHEN 1.78 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.80 THEN '>=1.78 AND <1.80'
       WHEN 1.80 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.82 THEN '>=1.80 AND <1.82'
           WHEN 1.82 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.84 THEN '>=1.82 AND <1.84'
           WHEN 1.84 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.86 THEN '>=1.84 AND <1.86'
           WHEN 1.86 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.88 THEN '>=1.86 AND <1.88'
           WHEN 1.88 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.90 THEN '>=1.88 AND <1.90'
       WHEN 1.90 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.92 THEN '>=1.90 AND <1.92'
           WHEN 1.92 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.94 THEN '>=1.92 AND <1.94'
           WHEN 1.94 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.96 THEN '>=1.94 AND <1.96'
           WHEN 1.96 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 1.98 THEN '>=1.96 AND <1.98'
           WHEN 1.98 <= top5annual / rct_mi_14 AND top5annual / rct_mi_14 < 2.00 THEN '>=1.98 AND <2.00'
           WHEN top5annual / rct_mi_14 >= 2.0 THEN '>=2.0'
         END AS top5_mkt_bands,
                          CASE
           WHEN case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.2 THEN '<0.2'
           WHEN 0.2 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.22 THEN '>=0.2 AND <0.22'
           WHEN 0.22 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.24 THEN '>=0.22 AND <0.24'
           WHEN 0.24 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.26 THEN '>=0.24 AND <0.26'
           WHEN 0.26 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.28 THEN '>=0.26 AND <0.28'
           WHEN 0.28 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.30 THEN '>=0.28 AND <0.30'
           WHEN 0.30 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.32 THEN '>=0.30 AND <0.32'
           WHEN 0.32 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.34 THEN '>=0.32 AND <0.34'
           WHEN 0.34 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.36 THEN '>=0.34 AND <0.36'
           WHEN 0.36 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.38 THEN '>=0.36 AND <0.38'
           WHEN 0.38 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.40 THEN '>=0.38 AND <0.40'
           WHEN 0.40 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.42 THEN '>=0.40 AND <0.42'
           WHEN 0.42 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.44 THEN '>=0.42 AND <0.44'
           WHEN 0.44 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.46 THEN '>=0.44 AND <0.46'
           WHEN 0.46 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.48 THEN '>=0.46 AND <0.48'
           WHEN 0.48 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.50 THEN '>=0.48 AND <0.50'
           WHEN 0.50 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.52 THEN '>=0.50 AND <0.52'
           WHEN 0.52 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.54 THEN '>=0.52 AND <0.54'
           WHEN 0.54 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.56 THEN '>=0.54 AND <0.56'
           WHEN 0.56 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.58 THEN '>=0.56 AND <0.58'
           WHEN 0.58 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.60 THEN '>=0.58 AND <0.60'
           WHEN 0.60 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.62 THEN '>=0.60 AND <0.62'
           WHEN 0.62 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.64 THEN '>=0.62 AND <0.64'
           WHEN 0.64 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.66 THEN '>=0.64 AND <0.66'
           WHEN 0.66 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.68 THEN '>=0.66 AND <0.68'
           WHEN 0.68 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.70 THEN '>=0.68 AND <0.70'
           WHEN 0.70 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.72 THEN '>=0.70 AND <0.72'
           WHEN 0.72 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.74 THEN '>=0.72 AND <0.74'
           WHEN 0.74 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.76 THEN '>=0.74 AND <0.76'
           WHEN 0.76 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.78 THEN '>=0.76 AND <0.78'
           WHEN 0.78 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.80 THEN '>=0.78 AND <0.80'
           WHEN 0.80 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.82 THEN '>=0.80 AND <0.82'
           WHEN 0.82 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.84 THEN '>=0.82 AND <0.84'
           WHEN 0.84 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.86 THEN '>=0.84 AND <0.86'
           WHEN 0.86 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.88 THEN '>=0.86 AND <0.88'
           WHEN 0.88 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.90 THEN '>=0.88 AND <0.90'
           WHEN 0.90 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.92 THEN '>=0.90 AND <0.92'
           WHEN 0.92 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.94 THEN '>=0.92 AND <0.94'
           WHEN 0.94 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.96 THEN '>=0.94 AND <0.96'
           WHEN 0.96 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 0.98 THEN '>=0.96 AND <0.98'
           WHEN 0.98 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.00 THEN '>=0.98 AND <1.00'
           WHEN 1.00 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.02 THEN '>=1.00 AND <1.02'
           WHEN 1.02 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.04 THEN '>=1.02 AND <1.04'
           WHEN 1.04 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.06 THEN '>=1.04 AND <1.06'
           WHEN 1.06 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.08 THEN '>=1.06 AND <1.08'
           WHEN 1.08 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.10 THEN '>=1.08 AND <1.10'
           WHEN 1.10 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.12 THEN '>=1.10 AND <1.12'
           WHEN 1.12 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.14 THEN '>=1.12 AND <1.14'
           WHEN 1.14 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.16 THEN '>=1.14 AND <1.16'
           WHEN 1.16 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.18 THEN '>=1.16 AND <1.18'
           WHEN 1.18 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.20 THEN '>=1.18 AND <1.20'
       WHEN 1.20 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.22 THEN '>=1.20 AND <1.22'
           WHEN 1.22 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.24 THEN '>=1.22 AND <1.24'
           WHEN 1.24 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.26 THEN '>=1.24 AND <1.26'
           WHEN 1.26 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.28 THEN '>=1.26 AND <1.28'
           WHEN 1.28 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.30 THEN '>=1.28 AND <1.30'
       WHEN 1.30 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.32 THEN '>=1.30 AND <1.32'
           WHEN 1.32 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.34 THEN '>=1.32 AND <1.34'
           WHEN 1.34 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.36 THEN '>=1.34 AND <1.36'
           WHEN 1.36 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.38 THEN '>=1.36 AND <1.38'
           WHEN 1.38 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.40 THEN '>=1.38 AND <1.40'
       WHEN 1.40 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.42 THEN '>=1.40 AND <1.42'
           WHEN 1.42 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.44 THEN '>=1.42 AND <1.44'
           WHEN 1.44 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.46 THEN '>=1.44 AND <1.46'
           WHEN 1.46 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.48 THEN '>=1.46 AND <1.48'
           WHEN 1.48 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.50 THEN '>=1.48 AND <1.50'
       WHEN 1.50 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.52 THEN '>=1.50 AND <1.52'
           WHEN 1.52 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.54 THEN '>=1.52 AND <1.54'
           WHEN 1.54 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.56 THEN '>=1.54 AND <1.56'
           WHEN 1.56 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.58 THEN '>=1.56 AND <1.58'
           WHEN 1.58 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.60 THEN '>=1.58 AND <1.60'
       WHEN 1.60 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.62 THEN '>=1.60 AND <1.62'
           WHEN 1.62 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.64 THEN '>=1.62 AND <1.64'
           WHEN 1.64 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.66 THEN '>=1.64 AND <1.66'
           WHEN 1.66 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.68 THEN '>=1.66 AND <1.68'
           WHEN 1.68 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.70 THEN '>=1.68 AND <1.60'
       WHEN 1.70 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.72 THEN '>=1.70 AND <1.72'
           WHEN 1.72 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.74 THEN '>=1.72 AND <1.74'
           WHEN 1.74 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.76 THEN '>=1.74 AND <1.76'
           WHEN 1.76 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.78 THEN '>=1.76 AND <1.78'
           WHEN 1.78 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.80 THEN '>=1.78 AND <1.80'
       WHEN 1.80 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.82 THEN '>=1.80 AND <1.82'
           WHEN 1.82 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.84 THEN '>=1.82 AND <1.84'
           WHEN 1.84 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.86 THEN '>=1.84 AND <1.86'
           WHEN 1.86 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.88 THEN '>=1.86 AND <1.88'
           WHEN 1.88 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.90 THEN '>=1.88 AND <1.90'
       WHEN 1.90 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.92 THEN '>=1.90 AND <1.92'
           WHEN 1.92 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.94 THEN '>=1.92 AND <1.94'
           WHEN 1.94 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.96 THEN '>=1.94 AND <1.96'
           WHEN 1.96 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 1.98 THEN '>=1.96 AND <1.98'
           WHEN 1.98 <= case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  AND case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  < 2.00 THEN '>=1.98 AND <2.00'
           WHEN case when q.protect_no_claims_bonus = 'false' then q.quotedpremium_an_notinclipt else q.quotedpremium_ap_notinclipt end / top5annual  >= 2.0 THEN '>=2.0'
         END AS mkt_quoted_bands

            from qs_cover q
            join qs_mi_outputs m
              on q.quote_id = m.quote_id
              and m.rct_mi_14 != ''
            join confused_cover c
              on q.customer_quote_reference = c.quotereference
              and to_date(q.quote_dttm) = c.quotedate
            where q.motor_transaction_type = 'NewBusiness'
              and q.business_purpose = ''
              and q.rct_noquote_an = 0
              and to_date(sysdate) > cover_start_dt
              and q.quote_dttm >= '2019-01-01'

     ;;
  }


  dimension_group: quote_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.quote_date ;;
  }

  dimension_group: inception_date {
    type: time
    timeframes: [
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.cover_start_dt ;;
  }

  dimension: quote_id {
    type:  string
    sql:quote_id  ;;
  }

  dimension: scheme {
    type:  string
    sql:scheme_number  ;;
  }

  dimension: model_type {
    type:  string
    sql: model_type ;;
  }

  dimension: top5_market_bands {
    label: "Modelled Price by Actual Ratio"
    type: string
    sql: ${TABLE}.top5_mkt_bands ;;
  }

  dimension: market_quoted_bands {
    label: "Actual Market Price vs Quoted"
    type: string
    sql: ${TABLE}.mkt_quoted_bands ;;
  }

  dimension: channel {
    type: string
    sql: originator_name ;;
  }

  dimension: marginpricetest_indicator_desc {
    label: "Pricing Strategy"
    type: string
    sql: marginpricetest_indicator_desc ;;
  }

  dimension: leadtime {
    type: number
    sql: cover_start_dt - to_date(quote_date) ;;
  }


  measure: Quotes {
    type: count
  }

  measure: AAUICL_Quoted_Premium {
    type: number
    sql: sum(AAUICL_Premium)/count(*) ;;
    value_format_name: gbp_0

  }

  measure: Market_Top5_Quoted_Premium {
    type: number
    sql: sum(confused_prem_top5annual)/count(*) ;;
    value_format_name: gbp_0

  }

  measure: Market_Model_Premium {
    type: number
    sql: sum(case when quote_date < '2019-11-06' then market_model*1.02 else  market_model end)/count(*) ;;
    value_format_name: gbp_0

  }

  measure: Market_Price_vs_Model_Price{
    type: number
    sql: ${Market_Top5_Quoted_Premium}/${Market_Model_Premium} ;;
    value_format_name: decimal_2
  }

  measure: AAUICL_vs_Market {
    type:  number
    sql: ${Market_Top5_Quoted_Premium}/${AAUICL_Quoted_Premium} ;;
    value_format_name: decimal_2
  }

  measure: Model_Price_V_Market_Price{
    type: number
    sql: ${Market_Model_Premium}/${Market_Top5_Quoted_Premium} ;;
    value_format_name: decimal_2
  }

}
