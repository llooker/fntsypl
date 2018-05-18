view: fixtures {
  sql_table_name: fpl.fixtures ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: kickoff {
    type: time
    timeframes: [raw, date, week, year]
    sql: ${TABLE}.kickoff_time ;;
  }

  dimension: team_a_score {
    label: "Away Score"
    type: number
    sql: ${TABLE}.team_a_score ;;
  }

  dimension: team_h {
    label: "Home Team"
    type: number
    sql: ${TABLE}.team_h ;;
  }

  dimension: team_a {
    label: "Away Team"
    type: number
    sql: ${TABLE}.team_a ;;
  }

  dimension: team_h_score {
    label: "Home Score"
    type: number
    sql: ${TABLE}.team_h_score ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  dimension: event {
    type: number
    sql: ${TABLE}.event ;;
    label: "Gameweek"
  }
#
#
#   dimension: code {
#     type: number
#     sql: ${TABLE}.code ;;
#   }
#
#   dimension: deadline_time {
#     type: string
#     sql: ${TABLE}.deadline_time ;;
#   }
#
#   dimension: deadline_time_formatted {
#     type: string
#     sql: ${TABLE}.deadline_time_formatted ;;
#   }
#
#
#   dimension: event_day {
#     type: number
#     sql: ${TABLE}.event_day ;;
#   }
#
#   dimension: finished {
#     type: number
#     sql: ${TABLE}.finished ;;
#   }
#
#   dimension: finished_provisional {
#     type: number
#     sql: ${TABLE}.finished_provisional ;;
#   }


#   dimension: minutes {
#     type: number
#     sql: ${TABLE}.minutes ;;
#   }
#
#   dimension: provisional_start_time {
#     type: number
#     sql: ${TABLE}.provisional_start_time ;;
#   }
#
#   dimension: started {
#     type: number
#     sql: ${TABLE}.started ;;
#   }
#

#   dimension: team_a_difficulty {
#     type: number
#     sql: ${TABLE}.team_a_difficulty ;;
#   }
#
#   dimension: team_h_difficulty {
#     label: "Home Team"
#     type: number
#     sql: ${TABLE}.team_h_difficulty ;;
#   }
#


}
