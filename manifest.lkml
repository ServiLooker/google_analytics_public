project_name: "marketplace_ga4_manual"


## Connection Constants:
constant: GA4_CONNECTION {
  value: "analytics_servi"
  export: override_required
}

 constant: GA4_SCHEMA {
   value: "analytics_368295697"
   export: override_optional
}

constant: GA4_TABLE_VARIABLE {
  value: "events_*"
  export: override_optional
}

constant: EVENT_COUNT {
  value: "5000"
  export: override_optional
}


constant: GA4_BQML_train_months {
  value: "1"
  # export: override_optional
}

constant: GA4_BQML_test_months {
  value: "1"
  # export: override_optional
}

constant: GA4_BQML_future_synth_months {
  value: "1"
  # export: override_optional
}
