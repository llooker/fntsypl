view: league_members {
  sql_table_name: fpl.overall ;;

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

  dimension: rank_tiers {
    type: tier
    tiers: [1, 100, 1000, 10000, 100000, 1000000]
    sql: ${rank} ;;
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
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [id, captain_name, player_name, entry_name]
  }

  measure: count_with_a_hit {
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [id, captain_name, player_name, entry_name]

    filters: {
      field: transfer_cost
      value: ">0"
    }
  }

  measure: avg_transfers {
    type: average
    sql: ${event_transfers} ;;
  }

  measure: rank_tier_percentage {
    type: number
    sql: ${count} / ${entry_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }

  measure: percent_with_a_hit {
    type: number
    sql: ${count_with_a_hit} / ${entry_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }
}
