create or replace package ait_translate_util as

    procedure set_session_lang(p_application_id in number default v('APP_ID'),
                               p_language       in varchar2 default null);

end ait_translate_util;
/
