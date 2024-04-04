# The name of this view in Looker is "Events Items"
view: events__items {
 # drill_fields: #[item_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.


  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Affiliation" in Explore.

  dimension: affiliation {
    type: string
    sql: affiliation ;;
  }

  dimension: coupon {
    type: string
    sql: coupon ;;
  }

  dimension: creative_name {
    type: string
    sql: creative_name ;;
  }

  dimension: creative_slot {
    type: string
    sql: creative_slot ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events__items {
    type: string
    hidden: yes
    sql: events__items ;;
  }

  dimension: item_brand {
    type: string
    sql: item_brand ;;
  }

  dimension: item_category {
    type: string
    sql: item_category ;;
  }

  dimension: item_category2 {
    type: string
    sql: item_category2 ;;
  }

  dimension: item_category3 {
    type: string
    sql: item_category3 ;;
  }

  dimension: item_category4 {
    type: string
    sql: item_category4 ;;
  }

  dimension: item_category5 {
    type: string
    sql: item_category5 ;;
  }

  dimension: item_list_id {
    type: string
    sql: item_list_id ;;
  }

  dimension: item_list_index {
    type: string
    sql: item_list_index ;;
  }

  dimension: item_list_name {
    type: string
    sql: item_list_name ;;
  }

  dimension: item_name {
    type: string
    sql: item_name ;;
  }

  dimension: item_params {
    hidden: yes
    sql: item_params ;;
  }

  dimension: item_refund {
    type: number
    sql: item_refund ;;
  }

  dimension: item_refund_in_usd {
    type: number
    sql: item_refund_in_usd ;;
  }

  dimension: item_revenue {
    type: number
    sql: item_revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_item_revenue {
    type: sum
    sql: ${item_revenue} ;;  }
  measure: average_item_revenue {
    type: average
    sql: ${item_revenue} ;;  }

  dimension: item_revenue_in_usd {
    type: number
    sql: item_revenue_in_usd ;;
  }

  dimension: item_variant {
    type: string
    sql: item_variant ;;
  }

  dimension: location_id {
    type: string
    sql: location_id ;;
  }

  dimension: price {
    type: number
    sql: price ;;
  }

  dimension: price_in_usd {
    type: number
    sql: price_in_usd ;;
  }

  dimension: promotion_id {
    type: string
    sql: promotion_id ;;
  }

  dimension: promotion_name {
    type: string
    sql: promotion_name ;;
  }

  dimension: quantity {
    type: number
    sql: quantity ;;
  }
}

# The name of this view in Looker is "Events Event Params"
view: events__event_params {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events__event_params {
    type: string
    hidden: yes
    sql: events__event_params ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__double_value {
    type: sum
    sql: ${value__double_value} ;;  }
  measure: average_value__double_value {
    type: average
    sql: ${value__double_value} ;;  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

# The name of this view in Looker is "Events User Properties"
view: events__user_properties {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events__user_properties {
    type: string
    hidden: yes
    sql: events__user_properties ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__double_value {
    type: sum
    sql: ${value__double_value} ;;  }
  measure: average_value__double_value {
    type: average
    sql: ${value__double_value} ;;  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__set_timestamp_micros {
    type: number
    sql: ${TABLE}.value.set_timestamp_micros ;;
    group_label: "Value"
    group_item_label: "Set Timestamp Micros"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

# The name of this view in Looker is "Events Items Item Params"
view: events__items__item_params {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_value__double_value {
    type: sum
    sql: ${value__double_value} ;;  }
  measure: average_value__double_value {
    type: average
    sql: ${value__double_value} ;;  }

  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }

  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }

  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}
