log=/tmp/ansible.log
source non-func-reqirement.sh

echo -e "\e[36mEnable the EPEL repository\e[0m"
sudo yum install epel-release -y &>>${log}
func_exit_status

echo -e "\e[36mInstall Ansible\e[0m"
sudo yum install ansible -y &>>${log}
func_exit_status

echo -e "\e[36mVerify installation\e[0m"
func_installed_status
#You should see output similar to:

#ansible [core 2.9.27]
#  python version = 3.x.x
