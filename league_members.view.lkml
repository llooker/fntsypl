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
    # sql: CONVERT(CAST(CONVERT(${TABLE}.captain_name USING latin1) AS binary) USING utf8) ;;
  }

  dimension: chip_raw {
    type: string
    sql: ${TABLE}.chip ;;
    hidden: yes
  }

  dimension: chip {
    type: string
    case: {
      when: {
        sql: ${chip_raw} = '3xc' ;;
        label: "Triple Captain"
      }
      when: {
        sql: ${chip_raw} = 'bb' ;;
        label: "Bench Boost"
      }
      when: {
        sql: ${chip_raw} = 'fh' ;;
        label: "Free Hit"
      }
      when: {
        sql: ${chip_raw} = 'wildcard' ;;
        label: "Wildcard"
      }
      else: "None"
    }
  }

  dimension: entry {
    type: number
    sql: ${TABLE}.entry ;;
    # html: {{ player_name }} ;;
  }

  dimension: entry_name {
    type: string
    sql: ${TABLE}.entry_name ;;
    # sql: CONVERT(CAST(CONVERT(${TABLE}.entry_name USING latin1) AS binary) USING utf8) ;;
  }

  dimension: event_total {
    type: number
    sql: ${TABLE}.event_total ;;
  }

  measure: gw_pts_total {
    type: sum
    sql: ${total} ;;
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
    # sql: CONVERT(CAST(CONVERT(${TABLE}.player_name USING latin1) AS binary) USING utf8) ;;
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

  measure: total_transfer_cost {
    type: sum
    sql: ${transfer_cost} ;;
  }

  measure: avg_transfer_cost {
    type: average
    sql: ${transfer_cost} ;;
    value_format_name: decimal_1
  }

  measure: count {
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [player_name, entry_name, captain_name, event_total]
  }

  measure: count_with_a_hit {
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [player_name, entry_name, captain_name, event_total]

    filters: {
      field: transfer_cost
      value: ">0"
    }
  }

  measure: total_transfers {
    type: sum
    sql: ${event_transfers} ;;
  }

  measure: max_pts {
    type: max
    sql: ${total} ;;
  }

  measure: avg_transfers {
    type: average
    sql: ${event_transfers} ;;
  }

  measure: rank_tier_percentage {
    type: number
    sql: ${count} / ${round_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }

  measure: percent_with_a_hit {
    type: number
    sql: ${count_with_a_hit} / ${round_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }
}
