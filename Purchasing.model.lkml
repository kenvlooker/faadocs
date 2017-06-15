connection: "faa"
case_sensitive: no

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project
include: "/thelook/order_items.view.lkml" # include the view "order_items" from the project "thelook"

label: "Information for Purchasing"

explore: flights {
  label: "Inventory Items"

  join: aircraft {
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.tail_num} = ${aircraft.tail_num} ;;
    view_label: "Airplane Information"
  }

  join: carriers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.carrier} = ${carriers.code} ;;
  }

  join: origin_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.origin} = ${origin_airport.code} ;;
  }

  join: destination_airport {
    from: airports
    type: left_outer
    relationship: many_to_one
    sql_on: ${flights.destination} = ${destination_airport.code} ;;
  }

}
