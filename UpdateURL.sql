SELECT * FROM lifequilt.wp_options;
update lifequilt.wp_options set option_value = '192.168.1.2:8080' where option_name in ('siteurl');
SELECT * FROM lifequilt.wp_options;
commit;