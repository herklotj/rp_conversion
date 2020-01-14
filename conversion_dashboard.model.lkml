connection: "echo_actian"

# include all the views
include: "*.view"

datagroup: conversion_dashboard_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

persist_with: conversion_dashboard_default_datagroup

explore: conversion {}
explore: confused_market_data {}
