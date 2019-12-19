view: understat_mapping {
  sql_table_name: fpl.understat_mapping ;;

  dimension: fpl_id {
    type: number
    sql: ${TABLE}.fpl_id ;;
    primary_key: yes
  }

  dimension: understat_id {
    type: number
#     hidden: yes
    sql: ${TABLE}.understat_id ;;
  }

  measure: count {
    type: count
    drill_fields: [understat.player_name, understat.id]
  }
}
