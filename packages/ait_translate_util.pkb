create or replace package body ait_translate_util as

  gc_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';


  function get_browser_language (p_application_id in number default v('APP_ID'))
  return varchar2
  is 
  l_scope logger_logs.scope%type := gc_scope_prefix || 'get_browser_language';
  l_params logger.tab_param;

  l_browser_language      varchar2(256);
  l_final_browser_language varchar2(5);
  begin
    logger.append_param(l_params, 'p_application_id', p_application_id);
    logger.log('START', l_scope, null, l_params);

    select lower(column_value)
    into l_browser_language
    from table(apex_string.split(owa_util.get_cgi_env(param_name => 'HTTP_ACCEPT_LANGUAGE'), ','))
    fetch first 1 rows only;
    logger.log('. l_browser_language', l_scope, l_browser_language);

    select coalesce(l1.exact_match, l2.like_match, l3.like_match, aaa.application_primary_language) best_match
    into l_final_browser_language
    from dual
    left outer join (select translated_app_language exact_match
                      from apex_application_trans_map
                      where primary_application_id = p_application_id
                      and translated_app_language = l_browser_language
                      order by translated_app_language ) l1 on 1=1
    left outer join (select translated_app_language like_match
                      from apex_application_trans_map
                      where primary_application_id = p_application_id
                      and translated_app_language like '%'||l_browser_language||'%' -- 'fr' would get matched with 'fr-ca' if 'fr' is missing
                      order by translated_app_language
                      fetch first 1 rows only) l2 on 1=1
    left outer join (select translated_app_language like_match
                      from apex_application_trans_map
                      where primary_application_id = p_application_id
                      and l_browser_language  like '%'||translated_app_language||'%' -- 'fr' would get matched with 'fr-ca' if 'fr' is missing
                      order by translated_app_language
                      fetch first 1 rows only) l3 on 1=1
    left outer join apex_applications aaa on aaa.application_id = p_application_id;

    return l_final_browser_language;
    
    logger.log('END', l_scope);
  exception when others then 
    logger.log_error('Unhandled Exception', l_scope, null, l_params); 
    raise;
  end get_browser_language;

  /**
   * AIT episode 53
   * See instructions in the README for this repo
   *
   * @author Hayden Hudson 
   * @created 12.23.2021 
   * @param TODO
   * @return
   */
  procedure set_app_lang(p_application_id in number default v('APP_ID'),
                         p_language       in varchar2 default null)
  as
    l_scope logger_logs.scope%type := gc_scope_prefix || 'set_app_lang';
    l_params logger.tab_param;

    l_preference_language  varchar2(5)   := apex_util.get_preference(p_preference => 'FSP_LANGUAGE_PREFERENCE');
    l_browser_language     varchar2(256) := get_browser_language (p_application_id => p_application_id);
    l_final_language       varchar2(5);
  begin
    logger.append_param(l_params, 'p_application_id', p_application_id);
    logger.append_param(l_params, 'p_language', p_language);
    logger.append_param(l_params, 'app_user', v('APP_USER'));
    logger.log('START', l_scope, null, l_params);
    
    
    l_final_language := case when p_language is not null
                             then p_language
                             when l_preference_language is not null
                             then l_preference_language
                             else l_browser_language
                        end;

    logger.log('. l_final_language', l_scope, l_final_language);

    apex_util.set_session_lang( p_lang => l_final_language);

    case when v('APP_USER') != 'nobody'
         and p_language is not null 
         then
            apex_util.set_preference( p_preference => 'FSP_LANGUAGE_PREFERENCE'
                                    , p_value      => p_language );
    end case;

    logger.log('END', l_scope);
  exception
    when others then
      logger.log_error('Unhandled Exception', l_scope, null, l_params);
      raise;
  end set_app_lang;


end ait_translate_util;
/
