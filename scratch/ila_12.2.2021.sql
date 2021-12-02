select coalesce(l1.strict_value, l2.like_value, l3.like_value) best_match
from dual
left outer join (select return_value strict_value
                    from apex_application_lov_entries
                    where application_id = :APP_ID
                    and list_of_values_name = 'APP_LANGUAGES'
                    and return_value  = :browser_lang) l1 on 1=1
left outer join (select return_value like_value
                    from apex_application_lov_entries
                    where application_id = :APP_ID
                    and list_of_values_name = 'APP_LANGUAGES'
                    and return_value  like '%'||:browser_lang||'%' -- 'en' would get matched with 'en-us' if 'en' is missing
                    order by length(return_value)
                    fetch first 1 rows only) l2 on 1=1
left outer join (select return_value like_value
                    from apex_application_lov_entries
                    where application_id = :APP_ID
                    and list_of_values_name = 'APP_LANGUAGES'
                    and :browser_lang like '%'||return_value||'%' -- 'en-us' would get matched with 'en' if 'en-us' is missing
                    order by length(return_value)
                    fetch first 1 rows only) l3 on 1=1