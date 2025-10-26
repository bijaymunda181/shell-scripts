log=/tmp/http.log

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSuccess\e[0m"
    else
      echo -e "\e[31m FAILURE\e[0m"
      fi
}

func_http_stats() {
 if systemctl is-active --quiet httpd; then
     echo "HTTPD Service is Running"
 else
     echo "HTTPD Service is Not Running"
 fi
}

