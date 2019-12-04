view: players_detail {
  sql_table_name: fpl.players_detail ;;
  view_label: "Players - Attributes"

# default dimensions
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: minutes {
    view_label: "Match Performance"
    label: "M"
    type: number
    sql: ${TABLE}.minutes ;;
    hidden: yes
  }

  dimension: round {
    label: "Gameweek"
    type: number
    sql: ${TABLE}.round ;;
  }

  dimension: assists {
    view_label: "Match Performance"
    type: number
    sql: ${TABLE}.assists ;;
    hidden: yes
  }

  dimension: bonus {
    type: number
    sql: ${TABLE}.bonus ;;
    hidden: yes
  }


  dimension: points {
    view_label: "Match Performance"
    label: "FPL Points"
    type: number
    sql: ${TABLE}.total_points ;;
    # hidden: yes
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: own_goals {
    view_label: "Match Performance"
    type: number
    sql: ${TABLE}.own_goals ;;
    hidden: yes
  }

  dimension: clean_sheet {
    view_label: "Match Performance"
    type: number
    sql: ${TABLE}.clean_sheets ;;
    hidden: yes
  }

  dimension_group: kickoff {
    view_label: "Match Information"
    type: time
    timeframes: [time, date, month, year]
    sql: replace(replace(${TABLE}.kickoff_time,'T',' '),'Z','') ;;
    hidden: yes
  }

  dimension: bps {
    type: number
    sql: ${TABLE}.bps ;;
    hidden: yes
  }

# built dimensions

  measure: avg_bps {
    label: "BPS"
    description: "average"
    type: average
    sql: ${bps} ;;
    value_format_name: decimal_1
  }

  dimension: vapm {
    label: "VAPM"
    description: "Value add per minutes ( (Points - 2) / Value )"
    type: number
    sql: (${points} - 2) / (${players.now_cost} / 10) ;;
    value_format_name: decimal_2
    hidden: yes
  }

# measures
  measure: total_points {
    label: "FPL Points"
    type: sum
    sql: ${points} ;;
    drill_fields: [stats*]
  }

  measure: average_points {
    label: "PPG"
    description: "Average Points across the season"
    type: average
    sql: ${points} ;;
  }

  measure: total_minutes {
    label: "M"
    description: "Total Minutes across the season"
    type: sum
    sql: ${minutes} ;;
  }

  measure: average_minutes {
    label: "M"
    description: "Average Minutes across the season"
    type: average
    sql: ${minutes} ;;
    value_format_name: decimal_1
  }

  measure: average_vapm {
    label: "VAPM"
    description: "Value add per minutes ( (Points - 2) / Value )"
    type: average
    sql: ${vapm} ;;
    value_format_name: decimal_2
  }

  measure: total_goals_scored {
    label: "G"
    description: "total"
    type: sum
    sql: ${goals} ;;
    drill_fields: [players.web_name, total_goals_scored, total_points]
  }

  measure: total_own_goals {
    label: "OG"
    type: sum
    sql: ${own_goals} ;;
    drill_fields: [stats*]
  }

  measure: total_goals {
    label: "G"
    type: number
    sql: ${total_goals_scored} ;;
    drill_fields: [players.web_name, total_goals_scored, total_points]
  }

  measure: total_assists {
    label: "A"
    type: sum
    sql: ${assists} ;;
    drill_fields: [stats*]
  }

  measure: count_matches {
    type: count
    drill_fields: [id]
  }

  measure: clean_sheets {
    label: "CS"
    type: sum
    sql: ${clean_sheet} ;;
  }

  measure: two_pt_appearances {
    type: count
    filters: {
      field: minutes
      value: ">59"
    }
  }

  measure: one_pt_appearances {
    type: count
    filters: {
      field: minutes
      value: "<=59"
    }
  }

  measure: minutes_pts {
    type: number
    sql: (${two_pt_appearances} * 2) + ${one_pt_appearances} ;;
  }

  measure: cs_pts {
    type: sum
    sql: ${players.cs_points} * ${clean_sheet} ;;
  }

  measure: total_bonus {
    type: sum
    sql: ${bonus} ;;
  }

# set
  set: stats {
    fields: [players.web_name, round, goals, assists, clean_sheet, points]
  }

# hidden
  dimension: ppg {
    type: number
    sql: case when ${minutes} > 0 then ${points} else ;;
    hidden: yes
  }

  dimension: element {
    description: "Player ID"
    type: number
    sql: ${TABLE}.element ;;
    hidden: yes
  }

  dimension: fixture {
    type: number
    sql: ${TABLE}.fixture ;;
    hidden: yes
  }

  dimension: goals {
    type: number
    sql: ${TABLE}.goals_scored ;;
    hidden: yes
  }
}

view: players_detail_extended {
  extends: [players_detail]
  view_label: "Players - Metrics"


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


#
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
}
