log=/tmp/http.log

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSuccess\e[0m"
    else
      echo -e "\e[31m FAILURE\e[0m"
      fi
}

fucc_http_stats() {
  systemctl status httpd &>>${log}
  if [ $? -eq 0 ]; then
    echo -e "\e[32mActive\e[0m"
    else
      echo -e "\e[31mInactive\e[0m"
      fi
}