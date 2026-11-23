select 'ALTER SYSTEM KILL SESSION '''|| SID || ',' || serial# || ''' IMMEDIATE;' from V$session where username<>'BACKGROUND';
