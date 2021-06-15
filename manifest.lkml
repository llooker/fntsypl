project_name: "fntsypl"

application: bryce_ks {
  label: "bryce Kitchen sink"
#   url: "http://localhost:8080/data_portal.js"
  url: "http://localhost:8080/bundle.js"
  # url: "/bundle.js"
  # url: "https://cdn.jsdelivr.net/gh/ContrastingSounds/simple_data_portal@e905401785c80512891b4bb67fe18766b6c8fc24/dist/data_portal.js"
  # url: "https://github.com/ContrastingSounds/simple_data_portal/blob/master/dist/data_portal.js"
  # entitlements: {
  #   local_storage: yes
  #   navigation: yes
  #   new_window: yes
  #   allow_forms: yes
  #   allow_same_origin: yes
  #   core_api_methods: ["all_connections","search_folders", "run_inline_query", "me", "all_looks", "run_look"]
  #   external_api_urls: ["http://127.0.0.1:3000", "http://localhost:3000", "https://*.googleapis.com", "https://*.github.com", "https://REPLACE_ME.auth0.com"]
  #   oauth2_urls: ["https://accounts.google.com/o/oauth2/v2/auth", "https://github.com/login/oauth/authorize", "https://dev-5eqts7im.auth0.com/authorize", "https://dev-5eqts7im.auth0.com/login/oauth/token", "https://github.com/login/oauth/access_token"]
  # }
  entitlements: {
    allow_same_origin: yes
    allow_forms: yes
    core_api_methods: ["me","all_user_attributes","user_attribute_user_values", "board", "theme"]
  }
}

# application: bryce_ks {
#   label: "Data Portal"
#   url: "https://cdn.jsdelivr.net/gh/ContrastingSounds/simple_data_portal@26c382db6d3b9ecc96915449e6203e4889e09949/dist/data_portal.js"
#   entitlements: {
#     allow_same_origin: yes
#     allow_forms: yes
#     core_api_methods: ["me","all_user_attributes","user_attribute_user_values", "board"]
#   }
# }
