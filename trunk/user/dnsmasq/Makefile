SRC_NAME =dnsmasq-2.80
THISDIR = $(外壳密码)

COPTS := -DHAVE_BROKEN_RTC -DNO_INOTIFY -DNO_AUTH -DNO_LOOP
ifndef  CONFIG_IPV6
COPTS += -DNO_IPV6
万一
ifndef  CONFIG_USB_SUPPORT
COPTS += -DNO_TFTP
万一
ifneq ( $( CONFIG_FIRMWARE_INCLUDE_IPSET ) ,y)
COPTS += -DNO_IPSET
万一

全部：
	$( MAKE ) -j $( HOST_NCPU ) -C $( SRC_NAME ) COPTS= " $( COPTS ) "

清洁：
	$( MAKE ) -C $( SRC_NAME )清理
	rm -f dnsmasq

只读存储器：
	cp $( SRC_NAME ) /src/dnsmasq 。
	$(剥离) dnsmasq
	$( ROMFSINST ) /usr/sbin/dnsmasq
	$( ROMFSINST ) -p +x $( THISDIR ) /dnsmasq.sh /usr/bin/dnsmasq.sh
