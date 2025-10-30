func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCESS\e[0m"
    else
      echo -e "\e[31mFAILURE\e[0m"
  fi
}

func_installed_status() {
  ansible --version
  if [ $? -eq 0 ]; then
    echo -e "\e[32mINSTALLED\e[0m"
    else
      echo -e "\e[31FAILURE\e[0m"

}