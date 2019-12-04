
explore: zendesk_tickets_xf {}

view: zendesk_tickets_xf {
  dimension: ticket_id {
    type: number
    description: "id of the ticket"
    # tests: [unique, not_null]
  }

  dimension: ticket_name {
    description: "name of the ticket"
  }

  dimension: created_date {}
}

test: ticket_id_not_null {
  explore_source: zendesk_tickets_xf {
    column: ticket_id {}
  }

  assert: s {
    expression: ${zendesk_tickets_xf.ticket_id} is not null ;;
  }
}
