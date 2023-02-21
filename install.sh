#!/bin/sh

SVC_PATH="/etc/storage/gozerotier.sh"
  if [ ! -e "$SVC_PATH" ] || [ ! -s "$SVC_PATH" ] ; then
       for h_i in $(seq 1 2) ; do
       [[ "$($SVC_PATH -h 2>&1 | wc -l)" -lt 2 ]] && [ ! -z $SVC_PATH ] && rm -rf $SVC_PATH
       wgetcurl_file "$SVC_PATH" "https://github.com/lmq8267/567/releases/download/scriptfile/gozerotier.sh"
       done
   else
   logger -t "【zerotier】" "已有$SVC_PATH，文件重名,无法安装"
   exit 1
  fi

  if [ -f "$SVC_PATH" ] ; then
       chmod 777 /etc/storage/gozerotier.sh
       cat >> "/etc/storage/started_script.sh" <<-OSC        
  
	#ZeroTier启动脚本
	#填写完，再去自定义脚本0里填写好路由表，最后在系统管理-控制台 输入/etc/storage/gozerotier.sh start即可
	#填写你在zerotier官网创建的网络ID，填写格式如:nvram set zerotier_id=6cccb567v880adf8
	nvram set zerotier_id=
	#填写Moon服务器生成的ID，没有则不填，有把下方#去掉启用,填写格式如:=a56c826623
	#nvram set zerotier_moonid=
	#ZeroTier Moon服务器 IP，把下方#去掉启用,填写格式如=175.13.156.223
	#nvram set zerotiermoon_ip=
	#下方填=1将使用Wan口获得的IP作为服务器 IP（请确认Wan口为公网IP），把下方#去掉启用
	#nvram set zerotiermoon_ip=         
               
        /etc/storage/gozerotier.sh start
  
OSC
       cat >> "/etc/storage/script0_script.sh" <<-OSC        
  
	#添加ZeroTier路由表 需要访问其它ZeroTier的内网LAN网段，IP和网关与ZeroTier官网的配置对应即可
        #多条路由规则按以下格式添加，将下方修改为你的，前面是路由网段后面是对应zerotier分配的IP
        #route add -net 192.168.2.0/24 gw 192.168.192.50

OSC
    else
    logger -t "【zerotier】" "下载失败，请稍后重试"
 fi
