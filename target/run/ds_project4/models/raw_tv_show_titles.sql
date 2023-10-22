-- back compat for old kwarg name
  
  
        
    

    

    merge into `summer-gadget-399414`.`netflix`.`raw_tv_show_titles` as DBT_INTERNAL_DEST
        using (

with __dbt__cte__netflix_titles as (


SELECT
    * EXCEPT(
        date_added
    ),
    CASE
        WHEN date_added <> "" THEN PARSE_DATE("%B %d, %Y", date_added)
        ELSE NULL
    END AS date_added
FROM
    `summer-gadget-399414`.`netflix`.`netflix`
) SELECT
    *
FROM
    __dbt__cte__netflix_titles
WHERE
    type = 'TV Show'


    AND date_added > (
        SELECT
            MAX(date_added)
        FROM
            `summer-gadget-399414`.`netflix`.`raw_tv_show_titles`
    )

        ) as DBT_INTERNAL_SOURCE
        on (FALSE)

    

    when not matched then insert
        (`description`, `release_year`, `duration`, `rating`, `type`, `country`, `listed_in`, `show_id`, `cast`, `director`, `title`, `date_added`)
    values
        (`description`, `release_year`, `duration`, `rating`, `type`, `country`, `listed_in`, `show_id`, `cast`, `director`, `title`, `date_added`)


    