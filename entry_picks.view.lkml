view: entry_picks {
  sql_table_name: fpl.entry_picks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
  }

  dimension: is_vice_captain {
    type: number
    sql: ${TABLE}.is_vice_captain ;;
  }

  dimension: multiplier {
    type: number
    sql: ${TABLE}.multiplier ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: round {
    type: number
    sql: ${TABLE}.round ;;
  }

  measure: count_of_entries {
    type: count_distinct
    sql: ${entry} ;;
    drill_fields: [id]

    filters: {
      field: round
      value: "9"
    }
  }

  measure: count_of_captains {
    type: count

    filters: {
      field: round
      value: "9"
    }

    filters: {
      field: is_captain
      value: "1"
    }
  }

  measure: count_of_vice_captains {
    type: count

    filters: {
      field: round
      value: "9"
    }

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
