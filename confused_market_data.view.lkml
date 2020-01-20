  view: confused_market_data {
    derived_table: {
      sql: select
              q.quote_dttm as quote_date,
              cover_start_dt,
              m.rct_mi_13 as scheme_number,
              q.quotedpremium_ap_notinclipt as AAUICL_Premium,
              m.rct_mi_14 as market_model,
              c.top5annual as confused_prem_top5annual,
              originator_name

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

    dimension: scheme {
      type:  string
      sql:scheme_number  ;;
    }

    dimension: channel {
      type: string
      sql: originator_name ;;
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

}
