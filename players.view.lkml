view: players {
  sql_table_name: fpl.players ;;
  view_label: "Players"

# default dimensions
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: web_name {
    view_label: "Attributes"
    label: "Name"
    type: string
    sql: CONVERT(CAST(CONVERT(${TABLE}.web_name USING latin1) AS binary) USING utf8) ;;
    required_fields: [id]
  }

  dimension: element_type {
    view_label: "Attributes"
    label: "Position"
    type: string
    sql: case when ${TABLE}.element_type = 1 then 'GK'
         when ${TABLE}.element_type = 2 then 'DEF'
         when ${TABLE}.element_type = 3 then 'MID'
         when ${TABLE}.element_type = 4 then 'FWD' end ;;
  }

  dimension: form {
    view_label: "Season Statistics"
    type: number
    sql: ${TABLE}.form ;;
  }

  dimension: total_points_tier {
    view_label: "Season Statistics"
    type: tier
    style: integer
    tiers: [1, 50, 100, 150, 200]
    sql: ${total_points} ;;
  }

  dimension: total_goals_scored_tier {
    view_label: "Season Statistics"
    type: tier
    style: integer
    tiers: [1, 3, 5, 7, 10, 15, 20]
    sql: ${goals_scored} ;;
    drill_fields: [players_detail.goals*]
  }

  dimension: now_cost {
    view_label: "Attributes"
    label: "Price"
    type: number
    sql: ${TABLE}.now_cost / 10 ;;
    value_format: "\"£\"#.0"
  }

  dimension: points_per_game {
    type: number
    sql: ${TABLE}.points_per_game ;;
    hidden: yes
  }

  measure: count {
    label: "Count of Players"
    type: count
  }

  measure: avg_points_per_game {
    type: number
    sql: ${points_per_game} ;;
    value_format_name: decimal_2
  }

  dimension: transfers_out_event {
    view_label: "Fantasy Metrics"
    description: "Transfers out this gameweek"
    type: number
    sql: ${TABLE}.transfers_out_event ;;
  }

  dimension: transfers_in_event {
    view_label: "Fantasy Metrics"
    description: "Transfers in this gameweek"
    type: number
    sql: ${TABLE}.transfers_in_event ;;
  }

# hidden dimensions

  dimension: goals_scored {
    type: number
    sql: ${TABLE}.goals_scored ;;
    hidden: yes
  }

  dimension: total_points {
    type: number
    sql: ${TABLE}.total_points ;;
    hidden: yes
  }

  dimension: team {
    type: number
    sql: ${TABLE}.team ;;
    hidden: yes
  }


#   dimension: chance_of_playing_next_round {
#     type: number
#     sql: ${TABLE}.chance_of_playing_next_round ;;
#   }
#
#   dimension: chance_of_playing_this_round {
#     type: number
#     sql: ${TABLE}.chance_of_playing_this_round ;;
#   }
#
#   dimension: dreamteam_count {
#     type: number
#     sql: ${TABLE}.dreamteam_count ;;
#   }
#
#   dimension: assists {
#     type: number
#     sql: ${TABLE}.assists ;;
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
#   dimension: code {
#     type: number
#     sql: ${TABLE}.code ;;
#   }
#
#   dimension: cost_change_event {
#     type: number
#     sql: ${TABLE}.cost_change_event ;;
#   }
#
#   dimension: cost_change_event_fall {
#     type: number
#     sql: ${TABLE}.cost_change_event_fall ;;
#   }
#
#   dimension: cost_change_start {
#     type: number
#     sql: ${TABLE}.cost_change_start ;;
#   }
#
#   dimension: cost_change_start_fall {
#     type: number
#     sql: ${TABLE}.cost_change_start_fall ;;
#   }
#
#   dimension: creativity {
#     type: number
#     sql: ${TABLE}.creativity ;;
#   }
#
#   dimension: ea_index {
#     type: number
#     sql: ${TABLE}.ea_index ;;
#   }
#
#   dimension: ep_next {
#     type: number
#     sql: ${TABLE}.ep_next ;;
#   }
#
#   dimension: ep_this {
#     type: number
#     sql: ${TABLE}.ep_this ;;
#   }
#
#   dimension: event_points {
#     type: number
#     sql: ${TABLE}.event_points ;;
#   }

#   dimension: first_name {
#     type: string
#     sql: ${TABLE}.first_name ;;
#   }


#
#   dimension: goals_conceded {
#     type: number
#     sql: ${TABLE}.goals_conceded ;;
#   }
#

#
#   dimension: ict_index {
#     type: number
#     sql: ${TABLE}.ict_index ;;
#   }
#
#   dimension: in_dreamteam {
#     type: string
#     sql: ${TABLE}.in_dreamteam ;;
#   }
#
#   dimension: influence {
#     type: number
#     sql: ${TABLE}.influence ;;
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
#   dimension: loans_in {
#     type: number
#     sql: ${TABLE}.loans_in ;;
#   }
#
#   dimension: loans_out {
#     type: number
#     sql: ${TABLE}.loans_out ;;
#   }
#
#   dimension: minutes {
#     type: number
#     sql: ${TABLE}.minutes ;;
#   }
#
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#   }
#
#   dimension: news {
#     type: string
#     sql: ${TABLE}.news ;;
#   }
#
#   dimension: news_added {
#     type: string
#     sql: ${TABLE}.news_added ;;
#   }
#

#
#   dimension: own_goals {
#     type: number
#     sql: ${TABLE}.own_goals ;;
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
#   dimension: photo {
#     type: string
#     sql: ${TABLE}.photo ;;
#   }
#
#
#   dimension: red_cards {
#     type: number
#     sql: ${TABLE}.red_cards ;;
#   }
#
#   dimension: saves {
#     type: number
#     sql: ${TABLE}.saves ;;
#   }
#
#   dimension: second_name {
#     type: string
#     sql: ${TABLE}.second_name ;;
#   }
#
#   dimension: selected_by_percent {
#     type: number
#     sql: ${TABLE}.selected_by_percent ;;
#   }
#
#   dimension: special {
#     type: string
#     sql: ${TABLE}.special ;;
#   }
#
#   dimension: squad_number {
#     type: number
#     sql: ${TABLE}.squad_number ;;
#   }
#
#   dimension: status {
#     type: string
#     sql: ${TABLE}.status ;;
#   }

#
#   dimension: team_code {
#     type: number
#     sql: ${TABLE}.team_code ;;
#   }
#
#   dimension: threat {
#     type: number
#     sql: ${TABLE}.threat ;;
#   }

#
#   dimension: transfers_in {
#     type: number
#     sql: ${TABLE}.transfers_in ;;
#   }

#   dimension: transfers_out {
#     type: number
#     sql: ${TABLE}.transfers_out ;;
#   }


#   dimension: value_form {
#     type: number
#     sql: ${TABLE}.value_form ;;
#   }
#
#   dimension: value_season {
#     type: number
#     sql: ${TABLE}.value_season ;;
#   }


#   dimension: yellow_cards {
#     type: number
#     sql: ${TABLE}.yellow_cards ;;
#   }

#   measure: total_yellow_cards {
#     type: sum
#     sql: ${yellow_cards} ;;
#   }
}

view: players_extended {
  extends: [players]
  view_label: "Players - Extended Detail"
}
