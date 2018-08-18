connection: "fntsypl"

include: "*.view.lkml"         # include all views in this project

explore: players {
  from: players_extended

  join: players_detail {
    from: players_detail_extended
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
}

explore: players_detail {
  from: players_detail_extended

#   sql_always_where: DATE_FORMAT(${players_detail.kickoff_time}, '%Y-%m-%d %h:%i%p') <= NOW() ;;
  sql_always_where: ${fixtures.finished} = 1 ;;

  join: fixtures {
    sql_on: ${players_detail.fixture} = ${fixtures.id} ;;
    relationship: many_to_one
  }

  join: players {
    from: players_extended
    sql_on: ${players.id} = ${players_detail.element} ;;
    relationship: many_to_one
  }
}

#   join: opposition {
#     from: teams
#     sql_on: ${players_detail.} = ${opposition.id} ;;
#     relationship: many_to_one
#   }
