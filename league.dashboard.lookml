- dashboard: league_stats
  title: League Stats
  layout: newspaper
  elements:
  - title: Avg Transfers
    name: Avg Transfers
    model: fntsypl
    explore: league_members
    type: single_value
    fields: [league_members.avg_transfers]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Gameweek: league_members.round
      League ID: league_members.league_id
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Chips
    name: Chips
    model: fntsypl
    explore: league_members
    type: looker_pie
    fields: [league_members.count, league_members.chip]
    filters: {}
    sorts: [league_members.chip]
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    colors: ["#a6cee3", "#1f78b4", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50",
      "#8BC34A", "#CDDC39", "#FFEB3B", "#9E9E9E", "#607D8B"]
    series_colors: {}
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Gameweek: league_members.round
      League ID: league_members.league_id
    row: 3
    col: 8
    width: 8
    height: 6
  - title: Top Selections
    name: Top Selections
    model: fntsypl
    explore: league_members
    type: looker_bar
    fields: [players.web_name, entry_picks.count_of_non_captains, entry_picks.count_of_captains,
      entry_picks.count_of_entries]
    filters: {}
    sorts: [entry_picks.count_of_entries desc]
    limit: 5000
    row_total: right
    query_timezone: America/Los_Angeles
    stacking: normal
    colors: ["#a6cee3", "#1f78b4", "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50",
      "#8BC34A", "#CDDC39", "#FFEB3B", "#9E9E9E", "#607D8B"]
    show_value_labels: true
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      1 - league_members.count: Captain
      0 - league_members.count: Selected
      entry_picks.count_of_captains: Captain
      entry_picks.count_of_non_captains: Selection
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes: [{label: '', orientation: bottom, series: [{id: entry_picks.count_of_non_captains,
            name: Selection, axisId: entry_picks.count_of_non_captains}, {id: entry_picks.count_of_captains,
            name: Captain, axisId: entry_picks.count_of_captains}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    hidden_fields: [entry_picks.count_of_entries]
    listen:
      Gameweek: league_members.round
      League ID: league_members.league_id
    row: 0
    col: 0
    width: 8
    height: 9
  - title: Captains
    name: Captains
    model: fntsypl
    explore: league_members
    type: looker_pie
    fields: [league_members.count, league_members.captain_name]
    filters:
      league_members.captain_name: "-EMPTY"
    sorts: [league_members.count desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 60
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Gameweek: league_members.round
      League ID: league_members.league_id
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Hits Taken
    name: Hits Taken
    model: fntsypl
    explore: league_members
    type: single_value
    fields: [league_members.count_with_a_hit]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Gameweek: league_members.round
      League ID: league_members.league_id
    row: 0
    col: 16
    width: 8
    height: 3
  filters:
  - name: Gameweek
    title: Gameweek
    type: field_filter
    default_value: '10'
    allow_multiple_values: true
    required: false
    model: fntsypl
    explore: league_members
    listens_to_filters: []
    field: league_members.round
  - name: League ID
    title: League ID
    type: field_filter
    default_value: '46823'
    allow_multiple_values: true
    required: false
    model: fntsypl
    explore: league_members
    listens_to_filters: []
    field: league_members.league_id
