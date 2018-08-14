view: fixture_table {
  sql_table_name: fpl.fixture_table ;;

  dimension: gw1 {
    type: string
    sql: ${TABLE}.gw1 ;;
  }

  dimension: gw10 {
    type: string
    sql: ${TABLE}.gw10 ;;
  }

  dimension: gw11 {
    type: string
    sql: ${TABLE}.gw11 ;;
  }

  dimension: gw12 {
    type: string
    sql: ${TABLE}.gw12 ;;
  }

  dimension: gw13 {
    type: string
    sql: ${TABLE}.gw13 ;;
  }

  dimension: gw14 {
    type: string
    sql: ${TABLE}.gw14 ;;
  }

  dimension: gw15 {
    type: string
    sql: ${TABLE}.gw15 ;;
  }

  dimension: gw16 {
    type: string
    sql: ${TABLE}.gw16 ;;
  }

  dimension: gw17 {
    type: string
    sql: ${TABLE}.gw17 ;;
  }

  dimension: gw18 {
    type: string
    sql: ${TABLE}.gw18 ;;
  }

  dimension: gw19 {
    type: string
    sql: ${TABLE}.gw19 ;;
  }

  dimension: gw2 {
    type: string
    sql: ${TABLE}.gw2 ;;
  }

  dimension: gw20 {
    type: string
    sql: ${TABLE}.gw20 ;;
  }

  dimension: gw21 {
    type: string
    sql: ${TABLE}.gw21 ;;
  }

  dimension: gw22 {
    type: string
    sql: ${TABLE}.gw22 ;;
  }

  dimension: gw23 {
    type: string
    sql: ${TABLE}.gw23 ;;
  }

  dimension: gw24 {
    type: string
    sql: ${TABLE}.gw24 ;;
  }

  dimension: gw25 {
    type: string
    sql: ${TABLE}.gw25 ;;
  }

  dimension: gw26 {
    type: string
    sql: ${TABLE}.gw26 ;;
  }

  dimension: gw27 {
    type: string
    sql: ${TABLE}.gw27 ;;
  }

  dimension: gw28 {
    type: string
    sql: ${TABLE}.gw28 ;;
  }

  dimension: gw29 {
    type: string
    sql: ${TABLE}.gw29 ;;
  }

  dimension: gw3 {
    type: string
    sql: ${TABLE}.gw3 ;;
  }

  dimension: gw30 {
    type: string
    sql: ${TABLE}.gw30 ;;
  }

  dimension: gw31 {
    type: string
    sql: ${TABLE}.gw31 ;;
  }

  dimension: gw32 {
    type: string
    sql: ${TABLE}.gw32 ;;
  }

  dimension: gw33 {
    type: string
    sql: ${TABLE}.gw33 ;;
  }

  dimension: gw34 {
    type: string
    sql: ${TABLE}.gw34 ;;
  }

  dimension: gw35 {
    type: string
    sql: ${TABLE}.gw35 ;;
  }

  dimension: gw36 {
    type: string
    sql: ${TABLE}.gw36 ;;
  }

  dimension: gw37 {
    type: string
    sql: ${TABLE}.gw37 ;;
  }

  dimension: gw38 {
    type: string
    sql: ${TABLE}.gw38 ;;
  }

  dimension: gw4 {
    type: string
    sql: ${TABLE}.gw4 ;;
  }

  dimension: gw5 {
    type: string
    sql: ${TABLE}.gw5 ;;
  }

  dimension: gw6 {
    type: string
    sql: ${TABLE}.gw6 ;;
  }

  dimension: gw7 {
    type: string
    sql: ${TABLE}.gw7 ;;
  }

  dimension: gw8 {
    type: string
    sql: ${TABLE}.gw8 ;;
  }

  dimension: gw9 {
    type: string
    sql: ${TABLE}.gw9 ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
