view: conversion_tree_expoclm {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT CASE
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd < 4.5 THEN 0.00125236449024852
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('5) I&2N','I&P','I&S') THEN 0.00237404980939119
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('BMW','CHRYSLER','CITROEN','DACIA','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','KIA','LAND ROVER','MAZDA','MERCEDES-BENZ','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PROTON','RE ULT','SAAB','SEAT','SKODA','SMART','SUZUKI','TOYOTA','VOLKSWAGEN','VOLVO') THEN 0.00383506736110252
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time < 22.5 AND lead_time >= 21.5 THEN 0.00415475098472994
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND make_banded IN ('ALFA ROMEO','AUDI','CHRYSLER','CITROEN','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','JEEP','KIA','MAZDA','MG','MINI','PERODUA','PROTON','RE ULT','ROVER','SAAB','SKODA','SMART','SUBARU','SUZUKI','VOLKSWAGEN','VOLVO') THEN 0.0060759094137142
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd < 5.5 THEN 0.00623224584660411
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','AUDI','CHEVROLET','FORD','JAGUAR','JEEP','LANDROVER','LEXUS','MITSUBISHI','NISSAN','PORSCHE','ROVER','SUBARU','VAUXHALL') THEN 0.00665747126436782
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd >= 5.5 AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CITROEN','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','LAND ROVER','MAZDA','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PROTON','SAAB','SEAT','SKODA','SMART','TOYOTA','VOLKSWAGEN','VOLVO') THEN 0.00925606729178158
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND make_banded IN ('BMW','CHEVROLET','DACIA','FORD','LANDROVER','LEXUS','MERCEDES-BENZ','MG-MOTOR UK','MITSUBISHI','NISSAN','PEUGEOT','PORSCHE','SEAT','TOYOTA','VAUXHALL') THEN 0.00958169348544479
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time < 22.5 AND lead_time < 21.5 THEN 0.00971676310329122
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('I&P','I&S') AND make_banded IN ('ALFA ROMEO','AUDI','BMW','CHRYSLER','CITROEN','DACIA','DAEWOO','DAIHATSU','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','LAND ROVER','LEXUS','MAZDA','MERCEDES-BENZ','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PORSCHE','PROTON','ROVER','SEAT','SKODA','SMART','SUBARU','VOLVO') THEN 0.0113063141415898
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') AND vehicle_purchasedyearsago < 0.5 THEN 0.0117968564348033
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') THEN 0.0138519078749702
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd >= 5.5 AND make_banded IN ('AUDI','CHRYSLER','DACIA','FORD','JEEP','KIA','LANDROVER','LEXUS','MERCEDES-BENZ','MITSUBISHI','NISSAN','PORSCHE','RE ULT','ROVER','SUBARU','SUZUKI','VAUXHALL') THEN 0.0140377358490566
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('I&P','I&S') AND make_banded IN ('CHEVROLET','DS','FORD','JEEP','KIA','LANDROVER','MITSUBISHI','NISSAN','RE ULT','SAAB','SUZUKI','TOYOTA','VAUXHALL','VOLKSWAGEN') THEN 0.0171870472326862
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') AND vehicle_purchasedyearsago >= 0.5 THEN 0.0184022061676226
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('5) I&2N','I&P','I&S') THEN 0.018590264325439
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('5) I&2N','6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','BMW','CITROEN','DAEWOO','DAIHATSU','FIAT','HONDA','HYUNDAI','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MERCEDES-BENZ','MG','MINI','PERODUA','PEUGEOT','PORSCHE','ROVER','SAAB','SEAT','SKODA','SMART','SUBARU','VOLVO') THEN 0.0213631550593524
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CHRYSLER','CITROEN','DACIA','DAEWOO','DS','FIAT','HONDA','HYUNDAI','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MG','MINI','PEUGEOT','PORSCHE','RE ULT','ROVER','SKODA','SMART','SUZUKI','TOYOTA') THEN 0.0294404777856473
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('5) I&2N','6) I&3N','I&1N','IOD') AND make_banded IN ('AUDI','CHEVROLET','CHRYSLER','DACIA','DS','FORD','ISUZU','LANDROVER','MG-MOTOR UK','MITSUBISHI','NISSAN','PROTON','RE ULT','SUZUKI','TOYOTA','VAUXHALL','VOLKSWAGEN') THEN 0.0312348521570528
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('AUDI','DAIHATSU','FORD','ISUZU','LANDROVER','MERCEDES-BENZ','MG-MOTOR UK','MITSUBISHI','NISSAN','PERODUA','PROTON','SAAB','SEAT','SUBARU','VAUXHALL','VOLKSWAGEN','VOLVO') THEN 0.0377369589834846
         ELSE 0.0137709249086358
       END AS response,
       CASE
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd < 4.5 THEN 'Conversion_Band_01'
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('5) I&2N','I&P','I&S') THEN 'Conversion_Band_02'
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('BMW','CHRYSLER','CITROEN','DACIA','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','KIA','LAND ROVER','MAZDA','MERCEDES-BENZ','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PROTON','RE ULT','SAAB','SEAT','SKODA','SMART','SUZUKI','TOYOTA','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_03'
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time < 22.5 AND lead_time >= 21.5 THEN 'Conversion_Band_04'
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND make_banded IN ('ALFA ROMEO','AUDI','CHRYSLER','CITROEN','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','JEEP','KIA','MAZDA','MG','MINI','PERODUA','PROTON','RE ULT','ROVER','SAAB','SKODA','SMART','SUBARU','SUZUKI','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_05'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd < 5.5 THEN 'Conversion_Band_06'
         WHEN lead_time >= 20.5 AND lead_time >= 28.5 AND ncd >= 4.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','AUDI','CHEVROLET','FORD','JAGUAR','JEEP','LANDROVER','LEXUS','MITSUBISHI','NISSAN','PORSCHE','ROVER','SUBARU','VAUXHALL') THEN 'Conversion_Band_07'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd >= 5.5 AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CITROEN','DAEWOO','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','LAND ROVER','MAZDA','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PROTON','SAAB','SEAT','SKODA','SMART','TOYOTA','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_08'
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND make_banded IN ('BMW','CHEVROLET','DACIA','FORD','LANDROVER','LEXUS','MERCEDES-BENZ','MG-MOTOR UK','MITSUBISHI','NISSAN','PEUGEOT','PORSCHE','SEAT','TOYOTA','VAUXHALL') THEN 'Conversion_Band_09'
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time < 22.5 AND lead_time < 21.5 THEN 'Conversion_Band_10'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('I&P','I&S') AND make_banded IN ('ALFA ROMEO','AUDI','BMW','CHRYSLER','CITROEN','DACIA','DAEWOO','DAIHATSU','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','LAND ROVER','LEXUS','MAZDA','MERCEDES-BENZ','MG','MG-MOTOR UK','MINI','PERODUA','PEUGEOT','PORSCHE','PROTON','ROVER','SEAT','SKODA','SMART','SUBARU','VOLVO') THEN 'Conversion_Band_11'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') AND vehicle_purchasedyearsago < 0.5 THEN 'Conversion_Band_12'
         WHEN lead_time >= 20.5 AND lead_time < 28.5 AND lead_time >= 22.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') THEN 'Conversion_Band_13'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('5) I&2N','I&1N','I&P','I&S') AND ncd >= 5.5 AND make_banded IN ('AUDI','CHRYSLER','DACIA','FORD','JEEP','KIA','LANDROVER','LEXUS','MERCEDES-BENZ','MITSUBISHI','NISSAN','PORSCHE','RE ULT','ROVER','SUBARU','SUZUKI','VAUXHALL') THEN 'Conversion_Band_14'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('I&P','I&S') AND make_banded IN ('CHEVROLET','DS','FORD','JEEP','KIA','LANDROVER','MITSUBISHI','NISSAN','RE ULT','SAAB','SUZUKI','TOYOTA','VAUXHALL','VOLKSWAGEN') THEN 'Conversion_Band_15'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years < 20.5 AND restriction_derived_forrating IN ('6) I&3N','IOD') AND vehicle_purchasedyearsago >= 0.5 THEN 'Conversion_Band_16'
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('5) I&2N','I&P','I&S') THEN 'Conversion_Band_17'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('5) I&2N','6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','BMW','CITROEN','DAEWOO','DAIHATSU','FIAT','HONDA','HYUNDAI','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MERCEDES-BENZ','MG','MINI','PERODUA','PEUGEOT','PORSCHE','ROVER','SAAB','SEAT','SKODA','SMART','SUBARU','VOLVO') THEN 'Conversion_Band_18'
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CHRYSLER','CITROEN','DACIA','DAEWOO','DS','FIAT','HONDA','HYUNDAI','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MG','MINI','PEUGEOT','PORSCHE','RE ULT','ROVER','SKODA','SMART','SUZUKI','TOYOTA') THEN 'Conversion_Band_19'
         WHEN lead_time < 20.5 AND lead_time >= 2.5 AND min_licence_years >= 20.5 AND restriction_derived_forrating IN ('5) I&2N','6) I&3N','I&1N','IOD') AND make_banded IN ('AUDI','CHEVROLET','CHRYSLER','DACIA','DS','FORD','ISUZU','LANDROVER','MG-MOTOR UK','MITSUBISHI','NISSAN','PROTON','RE ULT','SUZUKI','TOYOTA','VAUXHALL','VOLKSWAGEN') THEN 'Conversion_Band_20'
         WHEN lead_time < 20.5 AND lead_time < 2.5 AND restriction_derived_forrating IN ('6) I&3N','I&1N','IOD') AND make_banded IN ('AUDI','DAIHATSU','FORD','ISUZU','LANDROVER','MERCEDES-BENZ','MG-MOTOR UK','MITSUBISHI','NISSAN','PERODUA','PROTON','SAAB','SEAT','SUBARU','VAUXHALL','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_21'
         ELSE 'Conversion_Band_NULL'
       END AS GROUP,
      CASE
         WHEN sale_timestamp IS NOT NULL THEN to_date (sale_timestamp)
         ELSE to_date (quote_date)
       END AS conversion_date,
      *
FROM aapricing.v_rating_factors_for_machine_learning_expoclm rf
 LEFT JOIN hourly_sales sal ON LOWER (rf.quote_id) = LOWER (sal.insurer_quote_ref)
WHERE to_date(quote_date) != '2999-12-31'
/*AND rmoqr1_motortransactiontype1 = 'NewBusiness'
AND business_purpose = ' '*/


       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: group {
     type: string
     sql: ${TABLE}.group ;;
   }



  dimension_group: quote {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      month,
      year
    ]
    sql: CAST (${TABLE}.conversion_date AS TIMESTAMP);;
    }

  dimension_group: exposure_date {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      week,
      month,
      year
    ]
    sql: CAST (${TABLE}.exposure_start AS TIMESTAMP);;
  }

    dimension: min_licence_years {
      type: number
      sql: ${TABLE}.min_licence_years ;;
    }

  dimension: min_licence_years_high {
    type: number
    sql: CASE WHEN ${TABLE}.min_licence_years < 26.5 THEN 1 ELSE 0 END ;;
  }

    measure: total_quotes {
      type: count
    }

    measure: total_sales {
      type: sum
        sql: CASE WHEN ${TABLE}.aauicl_sale = 1 THEN 1 ELSE 0 END ;;
    }

  measure: response {
    type:  average
    sql:  ${TABLE}.response ;;
  }


    measure: conversion_rate {
      type: number
      sql: 1.0*${total_sales}/${total_quotes} ;;
      value_format_name: percent_2
    }

    measure: exposure {
      type: sum
      sql: ${TABLE}.evy ;;
    }

    measure: earned_premium {
      type: sum
      sql: ${TABLE}.eprem;;
    }

    measure: total_incurred_cap_25k {
      type: sum
      sql: ${TABLE}.total_incurred_cap_25k ;;
    }

  measure: total_incurred_cap_50k {
    type: sum
    sql: ${TABLE}.total_incurred_cap_50k ;;
  }

  measure: total_incurred {
    type: sum
    sql: ${TABLE}.total_incurred ;;
  }

  measure: total_count {
    type: sum
    sql: ${TABLE}.total_count ;;
  }

  measure: total_count_exc_ws {
    type: sum
    sql: ${TABLE}.total_count_exc_ws ;;
  }

  measure: fault_frequency {
    type: number
    sql: ${total_count_exc_ws}/nullif(${exposure},0) ;;
    value_format_name: percent_1
  }
 }
