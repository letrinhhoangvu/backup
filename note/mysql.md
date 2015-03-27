1/Can't login to remote MariaDB server with phpMyAdmin
Solved, the guilty was SELinux.

     getsebool -a | grep httpd
     setsebool -P httpd_can_network_connect_db on && service httpd restart
