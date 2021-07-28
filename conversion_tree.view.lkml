 view: conversion_tree {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT CASE
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time >= 21.5 AND abi_group IN ('01','02','03','04','06','07','09','10','11','12','13','14','15','16','17','18','19','21','22','25','26','27','29','32','33','37','39','40','42','44','45','46','47','48','49','50') THEN 0.00305303558967202
         WHEN min_licence_years < 26.5 AND lead_time < 2.5 AND lead_time >= 0.5 THEN 0.0889898636840266
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage < 9100 AND make_banded IN ('ALFA ROMEO','AUDI','BMW','CHEVROLET','CHRYSLER','CITROEN','DACIA','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MERCEDES-BENZ','MG','MINI','NISSAN','PERODUA','PROTON','RE ULT','SAAB','SKODA','SMART','SUBARU','TOYOTA','VOLKSWAGEN','VOLVO') THEN 0.0353741496598639
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years >= 20.5 AND make_banded IN ('AUDI','DACIA','DS','FIAT','FORD','KIA','LANDROVER','LEXUS','MG-MOTOR UK','MITSUBISHI','NISSAN','RE ULT','SUBARU','SUZUKI','VAUXHALL','VOLKSWAGEN','VOLVO') THEN 0.0447303921568627
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago < 1.5 THEN 0.0162236480293309
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time < 21.5 THEN 0.0106879734357165
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years < 20.5 AND e1_b_11 < 33.5 THEN 0.0688963916438067
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs < 225 AND restriction_derived_forrating IN ('6) I&3N','I&P','I&S') THEN 0.0535220994475138
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years >= 20.5 AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CHRYSLER','CITROEN','DAEWOO','DAIHATSU','HONDA','HYUNDAI','JAGUAR','JEEP','MAZDA','MERCEDES-BENZ','MG','MINI','PERODUA','PEUGEOT','PORSCHE','PROTON','ROVER','SAAB','SEAT','SKODA','SMART','TOYOTA') THEN 0.025218793182865
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs < 225 AND restriction_derived_forrating IN ('5) I&2N','I&1N','IOD') THEN 0.100218424771939
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years < 20.5 AND e1_b_11 >= 33.5 THEN 0.0404350250976018
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time >= 22.5 THEN 0.0119935644288431
         WHEN min_licence_years < 26.5 AND lead_time < 2.5 AND lead_time < 0.5 THEN 0.157169402291731
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage < 9100 AND make_banded IN ('DAEWOO','FORD','LANDROVER','MG-MOTOR UK','MITSUBISHI','PEUGEOT','PORSCHE','ROVER','SEAT','SUZUKI','VAUXHALL') THEN 0.0578930718127175
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage >= 9100 THEN 0.0692047377326565
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time >= 21.5 AND abi_group IN ('05','08','20','23','24','28','30','31','34','35','36','38','41','43') THEN 0.00811359026369168
         WHEN min_licence_years >= 26.5 THEN 0.226821502153961
         ELSE 0.0772342619638048
       END AS response,
       CASE
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time >= 21.5 AND abi_group IN ('01','02','03','04','06','07','09','10','11','12','13','14','15','16','17','18','19','21','22','25','26','27','29','32','33','37','39','40','42','44','45','46','47','48','49','50') THEN 'Conversion_Band_01'
         WHEN min_licence_years < 26.5 AND lead_time < 2.5 AND lead_time >= 0.5 THEN 'Conversion_Band_02'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage < 9100 AND make_banded IN ('ALFA ROMEO','AUDI','BMW','CHEVROLET','CHRYSLER','CITROEN','DACIA','DAIHATSU','DS','FIAT','HONDA','HYUNDAI','ISUZU','JAGUAR','JEEP','KIA','LEXUS','MAZDA','MERCEDES-BENZ','MG','MINI','NISSAN','PERODUA','PROTON','RE ULT','SAAB','SKODA','SMART','SUBARU','TOYOTA','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_03'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years >= 20.5 AND make_banded IN ('AUDI','DACIA','DS','FIAT','FORD','KIA','LANDROVER','LEXUS','MG-MOTOR UK','MITSUBISHI','NISSAN','RE ULT','SUBARU','SUZUKI','VAUXHALL','VOLKSWAGEN','VOLVO') THEN 'Conversion_Band_04'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago < 1.5 THEN 'Conversion_Band_05'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time < 21.5 THEN 'Conversion_Band_06'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years < 20.5 AND e1_b_11 < 33.5 THEN 'Conversion_Band_07'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs < 225 AND restriction_derived_forrating IN ('6) I&3N','I&P','I&S') THEN 'Conversion_Band_08'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years >= 20.5 AND make_banded IN ('ALFA ROMEO','BMW','CHEVROLET','CHRYSLER','CITROEN','DAEWOO','DAIHATSU','HONDA','HYUNDAI','JAGUAR','JEEP','MAZDA','MERCEDES-BENZ','MG','MINI','PERODUA','PEUGEOT','PORSCHE','PROTON','ROVER','SAAB','SEAT','SKODA','SMART','TOYOTA') THEN 'Conversion_Band_09'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs < 225 AND restriction_derived_forrating IN ('5) I&2N','I&1N','IOD') THEN 'Conversion_Band_10'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time < 20.5 AND vol_xs >= 225 AND min_licence_years < 20.5 AND e1_b_11 >= 33.5 THEN 'Conversion_Band_11'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time >= 22.5 THEN 'Conversion_Band_12'
         WHEN min_licence_years < 26.5 AND lead_time < 2.5 AND lead_time < 0.5 THEN 'Conversion_Band_13'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage < 9100 AND make_banded IN ('DAEWOO','FORD','LANDROVER','MG-MOTOR UK','MITSUBISHI','PEUGEOT','PORSCHE','ROVER','SEAT','SUZUKI','VAUXHALL') THEN 'Conversion_Band_14'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time >= 23.5 AND mileage >= 9100 THEN 'Conversion_Band_15'
         WHEN min_licence_years < 26.5 AND lead_time >= 2.5 AND lead_time >= 20.5 AND lead_time < 23.5 AND vehicle_purchasedyearsago >= 1.5 AND lead_time < 22.5 AND lead_time >= 21.5 AND abi_group IN ('05','08','20','23','24','28','30','31','34','35','36','38','41','43') THEN 'Conversion_Band_16'
         WHEN min_licence_years >= 26.5 THEN 'Conversion_Band_17'
         ELSE 'Conversion_Band_NULL'
       END AS group,
      *
FROM aapricing.v_rating_factors_for_machine_learning
WHERE to_date(quote_date) != '2999-12-31'
AND rmoqr1_motortransactiontype1 = 'NewBusiness'
AND business_purpose = ' '
AND (to_date(SYSDATE) - to_date(quote_date)) <= 60

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
      month
    ]
    sql: CAST (${TABLE}.quote_date AS TIMESTAMP);;
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
 }
