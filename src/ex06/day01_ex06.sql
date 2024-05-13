SELECT action_date, person.name
FROM
    (SELECT DISTINCT order_date AS action_date, person_order.person_id
    FROM person_order
    JOIN person_visits ON person_order.person_id = person_visits.person_id 
        AND person_order.order_date = person_visits.visit_date) AS new_tab
JOIN person ON new_tab.person_id = person.id
ORDER BY 1, 2 DESC;