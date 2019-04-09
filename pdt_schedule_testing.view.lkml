connection: "thelook_events"

datagroup: a {
  # any trigger, this is just an example
  sql_trigger: select current_date  ;;
}

explore: a {}

view: a {
  derived_table: {
    create_process: {
      # drop and recreate a table each day with the today's date
      sql_step: DROP TABLE saleseng_scratch.temp_a ;;
      sql_step: create table saleseng_scratch.temp_a as select current_date as dt ;;

      # create pdt A
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} as SELECT current_date as dt ;;
    }

    datagroup_trigger: b
  }

  dimension: dt {}
}

datagroup: b {
  # any trigger, this is just an example
  sql_trigger: select current_date  ;;
}

explore: b {}

view: b {
  derived_table: {
    create_process: {
      # drop and recreate a table each day with the today's date
      sql_step: DROP TABLE saleseng_scratch.temp_b ;;
      sql_step: create table saleseng_scratch.temp_b as select current_date as dt ;;

      # create pdt B
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} as SELECT current_date as dt ;;
    }

    datagroup_trigger: b
  }

  dimension: dt {}
}

# datagroup to use for schedules - only triggers once both pdt A and pdt B have been rebuilt for the day
# returns current_date if both have been rebuilt, null if not
datagroup: c {
  sql_trigger: select temp_b.dt from temp_a left join temp_b on temp_a.dt = temp_b.dt ;;
}















# old
explore: pdt_schedule_testing {}

view: pdt_schedule_testing {
  derived_table: {
    sql: select status from order_items ;;
    datagroup_trigger: a
  }

  dimension: status {}
}
