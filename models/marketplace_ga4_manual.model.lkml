# Define the database connection to be used for this model.

connection: "@{GA4_CONNECTION}"


# include all the views
include: "/views/**/*.view.lkml"
include: "/attributes/*.lkml"
include: "/dashboard/*.dashboard"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: marketplace_ga4_manual_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
datagroup:  ga4_main_datagroup {

sql_trigger: SELECT CURRENT_DATE() ;;
max_cache_age: "3 hour"
}


datagroup: ga4_default_datagroup {
  sql_trigger: SELECT FLOOR(((TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),'1970-01-01 00:00:00',SECOND)) - 60*60*1)/(60*60*24));;
  max_cache_age: "3 hour"
}

datagroup: ga4_attribution_channel {
  sql_trigger: SELECT 1 ;;
}

persist_with: ga4_main_datagroup


persist_with: marketplace_ga4_manual_default_datagroup

explore: sessions {
  hidden: no

  join: events {
    view_label: "Events"
    sql: LEFT JOIN UNNEST(${sessions.event_data}) as events with offset as event_row ;;
    relationship: one_to_many
  }

  join: audience_cohorts {
    type: left_outer
    sql_on: ${sessions.audience_trait} = ${audience_cohorts.audience_trait} ;;
    relationship: many_to_one
  }

  join: events__items {
    view_label: "Events: Items"
    sql: LEFT JOIN UNNEST(${events.items}) as events__items ;;
    relationship: one_to_many
    required_joins: [events]
  }


  join: user_previous_session {
    view_label: "GA4 Sessions"
    sql_on: ${sessions.sl_key} = ${user_previous_session.sl_key} ;;
    relationship: one_to_one
  }
  join: user_first_session {
    view_label: "GA4 Sessions"
    sql_on: ${sessions.sl_key} = ${user_first_session.sl_key} ;;
    relationship: one_to_one
  }

  join: user_segment {
    type: left_outer
    sql_on: ${sessions.user_pseudo_id} = ${user_segment.user_pseudo_id} ;;
    relationship: many_to_one
  }

  join: future_purchase_prediction {
    view_label: "Propensity to Purchase"
    relationship: one_to_one
    # sql_on: ${sessions.sl_key} = ${future_purchase_prediction.sl_key} ;;
    sql_on: ${sessions.user_pseudo_id} = ${future_purchase_prediction.user_pseudo_id} ;;
  }


  join: paid_shopping {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_shopping.channel}
          or REGEXP_CONTAINS(${sessions.session_attribution_campaign}, r"^(.(([^a-df-z]|^)shop|shopping).)$") = true
          and REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.cp.|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: paid_social {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_social.channel} and
      REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.cp.|ppc|paid.*)$") = true ;;
    relationship: many_to_one
  }

  join: paid_video {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_video.channel} and
      REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.cp.|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: paid_search {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${paid_search.channel}
      and REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.cp.|ppc|paid.*)$") = true;;
    relationship: many_to_one
  }
  join: organic_shopping {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_shopping.channel}
      or REGEXP_CONTAINS(${sessions.session_attribution_campaign}, r"^(.(([^a-df-z]|^)shop|shopping).)$") = true;;
    relationship: many_to_one
  }
  join: organic_social {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_social.channel}
      or REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"(social|social-network|social-media|sm|social network|social media)") = true;;
    relationship: many_to_one
  }
  join: organic_video {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_video.channel}
      or REGEXP_CONTAINS(${sessions.session_attribution_medium}, r"^(.video.)$") = true;;
    relationship: many_to_one
  }
  join: organic_search {
    fields: []
    sql_on: ${sessions.session_attribution_source}=${organic_video.channel}
      or ${sessions.session_attribution_medium} = 'organic';;
    relationship: many_to_one
  }
  join: others {
    fields: []
    sql_on: ${sessions.session_attribution_medium} = ${others.medium};;
    relationship: many_to_one
  }

  join: attribution_sources {
    sql:  ;;
  relationship: one_to_one
  view_label: "Acquisition"
}


  # join: events__event_params {
  #   view_label: "Events: Event Params"
  #   sql: LEFT JOIN UNNEST(${events.event_params}) as events__event_params ;;
  #   relationship: one_to_many
  # }
  # join: events__user_properties {
  #   view_label: "Events: User Properties"
  #   sql: LEFT JOIN UNNEST(${events.user_properties}) as events__user_properties ;;
  #   relationship: one_to_many
  # }
  # join: events__items__item_params {
  #   view_label: "Events: Items Item Params"
  #   sql: LEFT JOIN UNNEST(${events__items.item_params}) as events__items__item_params ;;
  #   relationship: one_to_many
  # }
}
explore: session_list_with_event_history{}
