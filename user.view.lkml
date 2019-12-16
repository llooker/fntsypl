# include: "team_base.view"
# view: user {
#   extends: [user_base]

#   parameter: rolling_metric_window {
#     view_label: "User - Activity"
#     type: unquoted
#     allowed_value: {
#       label: "1 Day"
#       value: "1D"
#     }
#     allowed_value: {
#       label: "28 Days"
#       value: "28D"
#     }
#   }

#   dimension: test {}
# }
