view: players_detail {
  view_label: "Match Performance"
  sql_table_name: fpl.players_detail ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: ppg {
    type: number
    sql: case when ${minutes} > 0 then ${points} else ;;
  }

  dimension: vapm {
    label: "VAPM"
    description: "Value add per minutes ( (Points - 2) / Value )"
    type: number
    sql: case when ${minutes} > 0 then (${points} - 2) / (${players.now_cost} / 10) else 0 end ;;
  }

  measure: avg_vapm {
    label: "Average VAPM"
    type: average
    sql: ${vapm} ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: points {
    type: number
    sql: ${TABLE}.total_points ;;
  }

  measure: total_points {
    type: sum
    sql: ${points} ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: total_assists {
    type: sum
    sql: ${assists} ;;
    drill_fields: [goals*]
  }

#   dimension: attempted_passes {
#     type: number
#     sql: ${TABLE}.attempted_passes ;;
#   }
#
#   dimension: big_chances_created {
#     type: number
#     sql: ${TABLE}.big_chances_created ;;
#   }
#
#   dimension: big_chances_missed {
#     type: number
#     sql: ${TABLE}.big_chances_missed ;;
#   }
#
#   dimension: bonus {
#     type: number
#     sql: ${TABLE}.bonus ;;
#   }
#
#   dimension: bps {
#     type: number
#     sql: ${TABLE}.bps ;;
#   }
#
#   dimension: clean_sheets {
#     type: number
#     sql: ${TABLE}.clean_sheets ;;
#   }
#
#   dimension: clearances_blocks_interceptions {
#     type: number
#     sql: ${TABLE}.clearances_blocks_interceptions ;;
#   }
#
#   dimension: completed_passes {
#     type: number
#     sql: ${TABLE}.completed_passes ;;
#   }
#
#   dimension: creativity {
#     type: number
#     sql: ${TABLE}.creativity ;;
#   }
#
#   dimension: dribbles {
#     type: number
#     sql: ${TABLE}.dribbles ;;
#   }
#
#   dimension: ea_index {
#     type: number
#     sql: ${TABLE}.ea_index ;;
#   }
#
  dimension: element {
    description: "Player ID"
    type: number
    sql: ${TABLE}.element ;;
    hidden: yes
  }
#
#   dimension: errors_leading_to_goal {
#     type: number
#     sql: ${TABLE}.errors_leading_to_goal ;;
#   }
#
#   dimension: errors_leading_to_goal_attempt {
#     type: number
#     sql: ${TABLE}.errors_leading_to_goal_attempt ;;
#   }
#
  dimension: fixture {
    type: number
    sql: ${TABLE}.fixture ;;
    hidden: yes
  }
#
#   dimension: fouls {
#     type: number
#     sql: ${TABLE}.fouls ;;
#   }
#
#   dimension: goals_conceded {
#     type: number
#     sql: ${TABLE}.goals_conceded ;;
#   }
#
  dimension: goals {
    type: number
    sql: ${TABLE}.goals_scored ;;
  }

  measure: total_goals_scored {
    type: sum
    sql: ${goals} ;;
    drill_fields: [goals*]
  }

  measure: total_own_goals {
    type: sum
    sql: ${own_goals} ;;
    drill_fields: [goals*]
  }

  measure: total_goals {
    type: number
    sql: ${total_goals_scored} + ${total_own_goals} ;;
    drill_fields: [goals*]
  }
#
#   dimension: ict_index {
#     type: number
#     sql: ${TABLE}.ict_index ;;
#   }
#
#   dimension: influence {
#     type: number
#     sql: ${TABLE}.influence ;;
#   }
#
#   dimension: key_passes {
#     type: number
#     sql: ${TABLE}.key_passes ;;
#   }
#
#   dimension: kickoff_time {
#     type: string
#     sql: ${TABLE}.kickoff_time ;;
#   }
#
#   dimension: kickoff_time_formatted {
#     type: string
#     sql: ${TABLE}.kickoff_time_formatted ;;
#   }
#
#   dimension: loaned_in {
#     type: number
#     sql: ${TABLE}.loaned_in ;;
#   }
#
#   dimension: loaned_out {
#     type: number
#     sql: ${TABLE}.loaned_out ;;
#   }
#
  dimension: minutes {
    type: number
    sql: ${TABLE}.minutes ;;
  }
#
#   dimension: offside {
#     type: number
#     sql: ${TABLE}.offside ;;
#   }
#
#   dimension: open_play_crosses {
#     type: number
#     sql: ${TABLE}.open_play_crosses ;;
#   }
#
#   dimension: opponent_team {
#     type: number
#     sql: ${TABLE}.opponent_team ;;
#   }
#
  dimension: own_goals {
    type: number
    sql: ${TABLE}.own_goals ;;
  }

#   dimension: penalties_conceded {
#     type: number
#     sql: ${TABLE}.penalties_conceded ;;
#   }
#
#   dimension: penalties_missed {
#     type: number
#     sql: ${TABLE}.penalties_missed ;;
#   }
#
#   dimension: penalties_saved {
#     type: number
#     sql: ${TABLE}.penalties_saved ;;
#   }
#
#   dimension: recoveries {
#     type: number
#     sql: ${TABLE}.recoveries ;;
#   }
#
#   dimension: red_cards {
#     type: number
#     sql: ${TABLE}.red_cards ;;
#   }
#
  dimension: round {
    label: "Gameweek"
    type: number
    sql: ${TABLE}.round ;;
    hidden:  yes
  }
#
#   dimension: saves {
#     type: number
#     sql: ${TABLE}.saves ;;
#   }
#
#   dimension: selected {
#     type: number
#     sql: ${TABLE}.selected ;;
#   }
#
#   dimension: tackled {
#     type: number
#     sql: ${TABLE}.tackled ;;
#   }
#
#   dimension: tackles {
#     type: number
#     sql: ${TABLE}.tackles ;;
#   }
#
#   dimension: target_missed {
#     type: number
#     sql: ${TABLE}.target_missed ;;
#   }
#
#   dimension: team_a_score {
#     type: number
#     sql: ${TABLE}.team_a_score ;;
#   }
#
#   dimension: team_h_score {
#     type: number
#     sql: ${TABLE}.team_h_score ;;
#   }
#
#   dimension: threat {
#     type: number
#     sql: ${TABLE}.threat ;;
#   }
#

#
#   dimension: transfers_balance {
#     type: number
#     sql: ${TABLE}.transfers_balance ;;
#   }
#
#   dimension: transfers_in {
#     type: number
#     sql: ${TABLE}.transfers_in ;;
#   }
#
#   dimension: transfers_out {
#     type: number
#     sql: ${TABLE}.transfers_out ;;
#   }
#
#
#   dimension: was_home {
#     type: number
#     sql: ${TABLE}.was_home ;;
#   }
#
#   dimension: winning_goals {
#     type: number
#     sql: ${TABLE}.winning_goals ;;
#   }
#
#   dimension: yellow_cards {
#     type: number
#     sql: ${TABLE}.yellow_cards ;;
#   }
#
#   measure: total_yellow_cards {
#     type: sum
#     sql: ${yellow_cards} ;;
#   }

  measure: count {
    type: count
    drill_fields: [id]
  }

  set: goals {
    fields: [players.web_name, own_goals, goals, assists]
  }
}
