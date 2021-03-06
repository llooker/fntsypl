view: round_facts {
  derived_table: {
    sql: SELECT round, count(distinct entry) as total_entry_count_for_week
      FROM fpl.entry_picks
      group by round
       ;;
  }

  dimension: round {
    type: number
    hidden: yes
    primary_key: yes
  }

  dimension: total_entry_count_for_week {
    type: number
    hidden: yes
  }
}
