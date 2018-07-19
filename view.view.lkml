explore: pdt_mapping {}

view: pdt_mapping {
  derived_table: {
    sql:
      SELECT 'table' name, '${table.SQL_TABLE_NAME}' internal_name
    ;;
#     -- UNION SELECT 'series_dates', '${series_dates.SQL_TABLE_NAME}'
#       -- UNION SELECT 'funnel', '${funnel.SQL_TABLE_NAME}'
#       -- add additional pdts here...
  }

  dimension: name {}
  dimension: internal_name {}

  dimension: view_sql_mysql {
    sql: CONCAT('CREATE OR REPLACE VIEW pdt.', ${name} , ' AS ',
          'SELECT * FROM ' , ${internal_name} , ' WITH NO SCHEMA BINDING')
          ;;
  }

  dimension: view_sql_redshift {
    sql: 'CREATE OR REPLACE VIEW pdt.' || ${name} || ' AS '
          'SELECT * FROM ' || ${internal_name} || ' WITH NO SCHEMA BINDING'
          ;;
  }
}




# doesn't work

datagroup: dg {
  sql_trigger: select current_timetamp ;;
}

view: table {
  derived_table: {
    datagroup_trigger: dg
    create_process: {
      sql_step:
        DROP TABLE IF EXISTS ${SQL_TABLE_NAME} ;;
      sql_step:
        CREATE TABLE ${SQL_TABLE_NAME} (
          id int(11),
          web_name varchar(50)
        ) ;;

      sql_step:
        INSERT INTO ${SQL_TABLE_NAME} (id, web_name)
        SELECT id, web_name
        FROM fpl.players ;;

    }
  }
  dimension: id {}
  dimension: web_name {}
}

view: view {
  derived_table: {
    datagroup_trigger: dg
    create_process: {
      sql_step:
        DROP VIEW IF EXISTS not_obscure_table_name ;;
      sql_step:
        CREATE VIEW test as
        SELECT web_name FROM ${table.SQL_TABLE_NAME}; ;;
    }
  }

#   dimension: id {}
  dimension: web_name {}
}

explore: view {}



view: sweet_name {
  derived_table: {
    sql: select 1 as test ;;
  }

  dimension: test {}
}

explore: sweet_name {}
