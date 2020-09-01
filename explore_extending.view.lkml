
explore: base {
  extends: [one_explore]

  join: two {}
}

explore: one_explore {
  view_name: one
  from: one

  join: three {}
}

explore: two {
  view_name: two
  from: one
}

view: base {
  dimension: base {}
}

view: one {
  dimension: one {}

  dimension: one_one {}
}

view: two {
  dimension: two {}
}

view: three {
  dimension: three {}
}
