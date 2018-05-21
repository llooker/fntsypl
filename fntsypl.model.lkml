connection: "fntsypl"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: players {
  join: players_detail {
    sql_on: ${players.id} = ${players_detail.element} ;;
    relationship: one_to_many
  }

  join: fixtures {
    sql_on: ${players_detail.fixture} = ${fixtures.id} ;;
    relationship: many_to_one
  }

  join: teams {
    sql_on: ${players.team} = ${teams.id} ;;
    relationship: many_to_one
  }

#   join: opposition {
#     from: teams
#     sql_on: ${players_detail.} = ${opposition.id} ;;
#     relationship: many_to_one
#   }
}
