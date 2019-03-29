connection: "thelook_events"

datagroup: a {
  sql_trigger: select current_timestamp ;;
}

explore: pdt_schedule_testing {}

view: pdt_schedule_testing {
  derived_table: {
    sql: select status from order_items ;;
    datagroup_trigger: a
  }

  dimension: status {}
}
