connection: "fntsypl"

include: "*.view.lkml"         # include all views in this project

persist_for: "48 hours"

explore: players {
  from: players_extended
  sql_always_where: ${fixtures.finished} = 1 ;;

  join: players_detail {
    from: players_detail_extended
    sql_on: ${players.id} = ${players_detail.element} ;;
    relationship: one_to_many
  }

  join: fixtures {
    sql_on: ${players_detail.fixture} = ${fixtures.id} ;;
    relationship: many_to_one
    fields: []
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

explore: stadiums {
  fields: [stadiums.id]
}

explore: league_members {
  label: "FPL Players"

  join: entry_picks {
    type: left_outer
    sql_on: ${league_members.entry} = ${entry_picks.entry}
              and ${league_members.round} = ${entry_picks.round};;
    relationship: one_to_many
  }

  join: players {
    type: inner
    sql_on: ${entry_picks.element} = ${players.id} ;;
    relationship: many_to_one
  }

  join: entry_facts {
    type: left_outer
    sql_on: ${entry_picks.round} = ${entry_facts.round} ;;
    relationship: many_to_one
  }
}
