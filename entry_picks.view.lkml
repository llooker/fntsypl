view: entry_picks {
  sql_table_name: fpl.entry_picks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: element {
    type: number
    sql: ${TABLE}.element ;;
    hidden: yes
  }

  dimension: entry {
    type: number
    sql: ${TABLE}.entry ;;
    hidden: yes
  }

  dimension: is_captain {
    type: number
    sql: ${TABLE}.is_captain ;;
    hidden: yes
  }

  dimension: is_vice_captain {
    type: number
    sql: ${TABLE}.is_vice_captain ;;
    hidden: yes
  }

  dimension: multiplier {
    type: number
    sql: ${TABLE}.multiplier ;;
    hidden: yes
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
    hidden: yes
  }

  dimension: round {
    type: number
    sql: ${TABLE}.round ;;
  }

  measure: captain_points {
    type: sum
    sql: case when ${is_captain} = 1 and ${players_detail.minutes} > 0 then ${players_detail.points} * ${multiplier}
           -- when ${is_vice_captain} = 1 and ${players_detail.minutes} > 0 then ${players_detail.points} * ${multiplier}
            else 0 end ;;
  }

  measure: captain_percent {
    type: number
    sql: ${captain_points} / ifnull(${players_detail.total_points}, 0) ;;
    value_format_name: percent_1
  }

  measure: count_of_entries {
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [id]
  }

  measure: count_of_captains {
    type: count

    filters: {
      field: is_captain
      value: "1"
    }
  }

  measure: count_of_non_captains {
    type: count

    filters: {
      field: is_captain
      value: "0"
    }
  }

  measure: percent_captain {
    type: number
    sql: ${count_of_captains} / ${entry_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }

  measure: percent_vice_captain {
    type: number
    sql: ${count_of_vice_captains} / ${entry_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }

  measure: count_of_vice_captains {
    type: count

    filters: {
      field: is_vice_captain
      value: "1"
    }
  }

  measure: percent_of_entries {
    type: number
    sql: ${count_of_entries} / ${entry_facts.total_entry_count_for_week} ;;
    value_format_name: percent_1
  }
}
