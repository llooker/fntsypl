explore: liquid {}

view: liquid {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    # sql: select
    #         order_id,

    #       {% for payment_method in ["bank_transfer", "credit_card", "gift_card"] %}
    #         sum(
    #           case when payment_method = '{{ payment_method }}' then amount else 0 end
    #         ) as {{ payment_method }}_amount,
    #       {% endfor %}

    #         sum(amount) as total_amount

    #       from app_data.payments

    #       group by 1
    #   ;;

    sql: select * from {% if 1 == 1 %} sql {% endif %} ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: bank_transfer_amount {
    type: number
    sql: ${TABLE}.bank_transfer_amount ;;
  }

}
