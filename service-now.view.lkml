explore: service_now {
  cancel_grouping_fields: [service_now.incident_id]
}

view: service_now {
  derived_table: {
    sql: select 1 as incident_id union select 2 ;;
  }

  dimension: incident_id {
    tags: ["service-now-incident"]
  }
}
