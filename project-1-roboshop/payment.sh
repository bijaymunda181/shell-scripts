component=payment
source common.sh
rabbitmq_app_password=$1
if [ -z "${rabbitmq_app_password}" ]; then
  Input rabbitmq_appUser Password is Missing
  exit 2
  fi
func_python