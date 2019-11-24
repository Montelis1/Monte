/*

Log sistema

*/

#include YSI\y_hooks

stock log_create(text, receive_l, sent_l)
{
    new log_date[3];
    getdate(log_date[0], log_date[1], log_date[2]);
  
	new sql_log[130];
	format(sql_log, sizeof(sql_log), "INSERT INTO logai (israsas, gavejas, siuntejas, data) VALUES ('%s', '%s', '%s', '%02d.%02d.%02d')", text, receive_l, sent_l, log_date[0], log_date[1], log_date[2]);
	mysql_query(sql_log);
	return 1;
}