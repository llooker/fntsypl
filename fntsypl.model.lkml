connection: "fpl-gcp"

include: "*.view.lkml"         # include all views in this project

persist_with: min

datagroup: min {
  sql_trigger: SELECT sum(minutes) FROM fpl.players_detail ;;
}

# explore: user {}

explore: entry_picks {
  join: players_detail {
    type: inner
    sql_on: ${entry_picks.element} = ${players_detail.element} and ${entry_picks.round} = ${players_detail.round} ;;
    relationship: one_to_one
  }

  join: players {
    type: inner
    sql_on: ${players_detail.element} = ${players.id} ;;
    relationship: many_to_one
  }

  join: league_members {
    type: inner
    sql_on: ${entry_picks.entry} = ${league_members.entry} and ${entry_picks.round} = ${league_members.round} ;;
    relationship: many_to_one
  }

  join: round_facts {
    type: left_outer
    sql_on: ${entry_picks.round} = ${round_facts.round} ;;
    relationship: many_to_one
  }

  join: teams {
    type: inner
    sql_on: ${players.team} = ${teams.id} ;;
    relationship: many_to_one
  }
}

explore: players {
  from: players_extended
  # sql_always_where: ${fixtures.finished} = 1 ;;

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
  label: "Player Performance"
  from: players_detail_extended

#   sql_always_where: DATE_FORMAT(${players_detail.kickoff_time}, '%Y-%m-%d %h:%i%p') <= NOW() ;;
  # sql_always_where: ${fixtures.finished} = 1 ;;

  join: fixtures {
    sql_on: ${players_detail.fixture} = ${fixtures.id} ;;
    relationship: many_to_one
  }

  join: players {
    from: players_extended
    sql_on: ${players.id} = ${players_detail.element} ;;
    relationship: many_to_one
  }

  join: understat {
    type: left_outer
    sql_on: ${understat.player_name} = concat(${players.first_name}, ' ', ${players.second_name})
          or ${understat.player_name} = ${players.web_name}
          or SUBSTRING_INDEX(${understat.player_name}, ' ', -1) = ${players.web_name}
          or ${understat.player_name} = concat(${players.second_name}, ' ', ${players.first_name})
          ;; # and ${understat.team_title} = ${players.team} ;;
    relationship: one_to_one
  }

  join: understat_mapping {
    fields: []
    type: left_outer
    sql_on: ${players.id} = ${understat_mapping.fpl_id} ;;
    relationship: one_to_one
  }

  join: teams {
    type: inner
    sql_on: ${players.team} = ${teams.id} ;;
    relationship: many_to_one
  }

#   join: understat {
#     type: left_outer
#     sql_on: ${understat_mapping.understat_id} = ${understat.id} ;;
#     relationship: one_to_one
#   }
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

  join: players_detail {
    type: inner
    sql_on: ${players.id} = ${players_detail.element} ;;
    relationship: one_to_many
  }

  join: round_facts {
    type: left_outer
    sql_on: ${entry_picks.round} = ${round_facts.round} ;;
    relationship: many_to_one
  }
}
