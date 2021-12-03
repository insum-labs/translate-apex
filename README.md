# Recommendation for setting session language in Multi-lingual APEX applications

## Preliminary work

Compile my ait_translate_util package in the "packages" folder. I have also included an APEX export that exhibits the completion of the below steps.

## Step 1 - Globalization settings

Set the "Application Language Derived From" setting to "Session".

## Step 2 - Public Branch reload branches

On public pages, create a "Before Header" branch that redirects to itself with the following condition:

```
declare
l_retval boolean := false;
begin
 if apex_util.get_session_lang is null then
     ait_translate_util.set_session_lang(p_application_id => :APP_ID);
      l_retval := true;
  end if;

  return l_retval;
end;
```

## Step 3 - After Authentication process

Create an "After Authentication" process that runs the below code:

```
begin
    ait_translate_util.set_session_lang(p_application_id => :APP_ID);
end;
```

## Step 4 - Enabling user to set preference

I recommend having a page process that runs the following code on page 0, with a radio list of the available languages:

```
ait_translate_util.set_session_lang(p_application_id => :APP_ID,
                                p_language       => :P0_LANG);
```
