#! /bin/bash
tomcat_home=$1
SHUTDOWN=$tomcat_home/bin/shutdown.sh
STARTTOMCAT=$tomcat_home/bin/startup.sh
$SHUTDOWN
sleep 5
#ps -ef|grep tomcat|grep $tomcat_home|grep -v 'grep'|awk '{print $2}'|xargs kill -9
pidlist=`ps -ef|grep $tomcat_home|grep -v "grep"|grep -v "bash"`
pidlistid=`ps -ef|grep $tomcat_home|grep -v "grep"|grep -v "bash"|awk '{print $2}'`
if [ "$pidlistid" = "" ]
   then
       echo "no tomcat pid alive!"
else
  echo "$pidlist"
  kill -9 $pidlistid
  echo "kill -9 $pidlistid"
fi
#删除日志文件
rm $tomcat_home/logs/* -rf
echo "rm $tomcat_home/logs/* -rf"
#删除tomcat的临时目录
rm $tomcat_home/work/* -rf
echo "rm $tomcat_home/work/* -rf"
sleep 5
$STARTTOMCAT
#启动日志
tail -f $tomcat_home/logs/catalina.out
