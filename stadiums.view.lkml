view: stadiums {
  sql_table_name: fpl.stadiums ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: woeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.woeid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
