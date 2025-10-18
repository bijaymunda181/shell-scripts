source common.sh
component=nginx
log=/tmp/roboshop.log

echo -e "\e[36m >>>>>>>>>>>>>>> installing nginx <<<<<<<<<<<<<<<\e[0m"
yum install nginx -y &>>$log
echo $?

func_systemd

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> removing default nginx content <<<<<<<<<<<<<<<\e[0m"
rm -rf /usr/share/nginx/html/* &>>$log
echo $?

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>> downloding roboshop frontent content <<<<<<<<<<<<<<<<</e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>$log
echo $?

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>>>>>>> unzip the content >>>>>>>>>>>>>>>>/e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$log
echo $?