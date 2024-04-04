view: event_data_user_properties {
  extension: required

## Dimensions
  dimension: user_property_age {
    group_label: "User Properties"
    label: "Age"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "age") ;;
    full_suggestions: yes
  }

  dimension: user_property_country {
    group_label: "User Properties"
    label: "Country"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "country") ;;
    full_suggestions: yes
  }

  dimension: user_property_device_category {
    group_label: "User Properties"
    label: "Device Category"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "device_category") ;;
    full_suggestions: yes
  }

  dimension: user_property_device_model {
    group_label: "User Properties"
    label: "Device Model"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "device_model") ;;
    full_suggestions: yes
  }

  dimension: user_property_gender {
    group_label: "User Properties"
    label: "Gender"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "gender") ;;
    full_suggestions: yes
  }

  dimension: user_property_interests {
    group_label: "User Properties"
    label: "Interests"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "interests") ;;
    full_suggestions: yes
  }

  dimension: user_property_language {
    group_label: "User Properties"
    label: "Language"
    type: string
    sql: (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "language") ;;
    full_suggestions: yes
  }

}
