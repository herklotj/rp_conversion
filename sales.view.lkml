view: sales {
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
          case when max(cast(substr(c.rct_modelnumber,23,3),int)) over() = cast(substr(c.rct_modelnumber,23,3),int) then 1 else 0 end as is_most_recent_model,
          postal_area,
          drv.*,
          v.*,
          year(sysdate) - year_of_registration as vehicle_age,
          c.cover_start_dt - to_date(c.quote_dttm) as leadtime,
          ra.pi_rated_area
        FROM
            (select *
             from
                qs_cover
             WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 12
             and motor_transaction_type = 'NewBusiness' and business_purpose = '' and rct_noquote_an = 0
             ) c
        LEFT JOIN hourly_sales s
          on c.quote_id = s.insurer_quote_ref
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
            WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 12
            group by quote_id
          )drv
          on c.quote_id = drv.quote_id
        inner join
          (select
              *
           from
              qs_vehicles
           WHERE quote_dttm < sysdate and months_between(to_date(sysdate),quote_dttm) <= 12
          ) v
          on v.quote_id=c.quote_id
     ;;
  }


  dimension_group: quote_date {
    type: time
    timeframes: [
      date,
      week,
      month
    ]
    sql: ${TABLE}.quote_dttm ;;
  }

  dimension_group: cover_start {
    type: time
    timeframes: [
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


  measure: average_quoted_premium {
    type: average
    sql:  ${TABLE}.quoted_premium ;;
    value_format_name: gbp_0
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
