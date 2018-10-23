view: league_members {
  sql_table_name: fpl.league_members ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: calc_cost {
    type: number
    sql: ${TABLE}.calc_cost ;;
  }

  dimension: captain_name {
    type: string
    sql: ${TABLE}.captain_name ;;
  }

  dimension: chip {
    type: string
    sql: ${TABLE}.chip ;;
  }

  dimension: entry {
    type: number
    sql: ${TABLE}.entry ;;
  }

  dimension: entry_name {
    type: string
    sql: ${TABLE}.entry_name ;;
  }

  dimension: event_total {
    type: number
    sql: ${TABLE}.event_total ;;
  }

  dimension: event_transfers {
    type: number
    sql: ${TABLE}.event_transfers ;;
  }

  dimension: last_rank {
    type: number
    sql: ${TABLE}.last_rank ;;
  }

  dimension: league_id {
    type: number
    sql: ${TABLE}.league_id ;;
  }

  dimension: movement {
    type: string
    sql: ${TABLE}.movement ;;
  }

  dimension: player_name {
    type: string
    sql: ${TABLE}.player_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: rank_sort {
    type: number
    sql: ${TABLE}.rank_sort ;;
  }

  dimension: round {
    type: number
    sql: ${TABLE}.round ;;
  }

  dimension: team_value {
    type: string
    sql: ${TABLE}.team_value ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: transfer_cost {
    type: number
    sql: ${TABLE}.transfer_cost ;;
  }

  measure: count {
    type: count
    drill_fields: [id, captain_name, player_name, entry_name]
  }
}
