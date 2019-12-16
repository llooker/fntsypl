view: mini_leagues {
  sql_table_name: fpl.mini_leagues ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: classic {
    type: number
    sql: ${TABLE}.classic ;;
  }

  dimension: gameweek {
    type: number
    sql: ${TABLE}.gameweek ;;
  }

  dimension: league_id {
    type: number
    sql: ${TABLE}.league_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
