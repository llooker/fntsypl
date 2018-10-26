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
    label: "Team Name"
    view_label: "Players - Attributes"
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
    label: "Team Name (abbrev)"
    view_label: "Players - Attributes"
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: strength {
    type: number
    sql: ${TABLE}.strength ;;
    hidden: yes
  }

  dimension: strength_attack_away {
    type: number
    sql: ${TABLE}.strength_attack_away ;;
    hidden: yes
  }

  dimension: strength_attack_home {
    type: number
    sql: ${TABLE}.strength_attack_home ;;
    hidden: yes
  }

  dimension: strength_defence_away {
    type: number
    sql: ${TABLE}.strength_defence_away ;;
    hidden: yes
  }

  dimension: strength_defence_home {
    type: number
    sql: ${TABLE}.strength_defence_home ;;
    hidden: yes
  }

  dimension: strength_overall_away {
    type: number
    sql: ${TABLE}.strength_overall_away ;;
    hidden: yes
  }

  dimension: strength_overall_home {
    type: number
    sql: ${TABLE}.strength_overall_home ;;
    hidden: yes
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

#   measure: count {
#     type: count
#     drill_fields: [id, name, short_name]
#   }
}
