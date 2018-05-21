view: teams {
  sql_table_name: fpl.teams ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

#   dimension: code {
#     type: number
#     sql: ${TABLE}.code ;;
#   }
#
#   dimension: draw {
#     type: number
#     sql: ${TABLE}.draw ;;
#   }
#
#   dimension: link_url {
#     type: string
#     sql: ${TABLE}.link_url ;;
#   }
#
#   dimension: loss {
#     type: number
#     sql: ${TABLE}.loss ;;
#   }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

#   dimension: played {
#     type: number
#     sql: ${TABLE}.played ;;
#   }

#   dimension: points {
#     type: number
#     sql: ${TABLE}.points ;;
#   }

#   dimension: table_position {
#     type: number
#     sql: ${TABLE}.position ;;
#   }

  dimension: short_name {
    label: "Name (abbrev)"
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: strength {
    type: number
    sql: ${TABLE}.strength ;;
  }

  dimension: strength_attack_away {
    type: number
    sql: ${TABLE}.strength_attack_away ;;
  }

  dimension: strength_attack_home {
    type: number
    sql: ${TABLE}.strength_attack_home ;;
  }

  dimension: strength_defence_away {
    type: number
    sql: ${TABLE}.strength_defence_away ;;
  }

  dimension: strength_defence_home {
    type: number
    sql: ${TABLE}.strength_defence_home ;;
  }

  dimension: strength_overall_away {
    type: number
    sql: ${TABLE}.strength_overall_away ;;
  }

  dimension: strength_overall_home {
    type: number
    sql: ${TABLE}.strength_overall_home ;;
  }

#   dimension: team_division {
#     type: number
#     sql: ${TABLE}.team_division ;;
#   }
#
#   dimension: unavailable {
#     type: string
#     sql: ${TABLE}.unavailable ;;
#   }
#
#   dimension: win {
#     type: number
#     sql: ${TABLE}.win ;;
#   }

  measure: count {
    type: count
    drill_fields: [id, name, short_name]
  }
}
