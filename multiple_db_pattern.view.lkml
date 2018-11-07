# view: aggregation {
#   derived_table: {
#     sql:
#     SELECT SUBSTRING(combined, 1, length(combined) - 10) as pass_this
#     FROM (
#       SELECT GROUP_CONCAT(each_db SEPARATOR ' ') as combined
#       FROM (
#         SELECT
#           CONCAT('SELECT * FROM ' , db.db , '.teams UNION ALL ') as each_db
#         FROM mysql.db
#         where db not in ('sys', 'performance_schema', 'looker_scratch', 'mysql')
#         LIMIT 10
#       ) statements
#     ) total ;;
#     persist_for: "12 hours"
#   }
#
#   dimension: pass_this {
#     hidden: yes
#     sql: concat("SELECT THIS........................................................::",${TABLE}.pass_this,"::") ;;
#   }
# }
#
# view: teams_aggregated {
#   derived_table: {
#     sql: {% assign prop = db_selection._parameter_value | split: "::"  %}{{ prop[1] }};;
# #     sql: AS {{ db_selection._parameter_value | replace: "'", "" }} ;;
#     persist_for: "12 hours"
#   }
#
#   parameter: db_selection {
#     suggest_explore: aggregation
#     suggest_dimension: aggregation.pass_this
#     hidden: yes
#   }
#
#   dimension: name {}
#
#   dimension: id {}
#
#   dimension: any_other_field {}
# }
#
# explore: aggregation {
#   join: teams_aggregated {
#     type: cross
#   }
#   always_filter: {
#     filters: {
#       field: teams_aggregated.db_selection
#     }
#   }
# }
