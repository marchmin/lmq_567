THISDIR = $(shell pwd)
xray_dir="xray.com/core/main"
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
xray_SED_ARGS:=
xray_SED_ARGS += \
	s/_ "xray.com\/core\/main\/json"/\/\/ &/; \
	/\/\/ _ "xray.com\/core\/main\/jsonem"/s/\/\/ //;
xray_SED_ARGS += \
	s/_ "xray.com\/core\/main\/json"/\/\/ &/;
xray_VERSION := 1.6.1
xray_URL := https://github.com/yuos-bit/Padavan/raw/master/trunk/user/xray/xray/v

all:download_xray build_extract build_xray

download_xray:
	( if [  ! -f $(THISDIR)/xray  ]; then \
	curl --create-dirs -L $(xray_URL) -o $(THISDIR)/xray ; \
	fi )
	
build_extract:
	( if [ ! -f $(THISDIR)/xray ]; then \
	    mkdir -p $(THISDIR)/xray-core ; \
    	mkdir -p $(THISDIR)/bin ; \
	        ( if [ ! -d $(THISDIR)/xray-core/Xray-core-$(Xray_VERSION) ]; then \
	            rm -rf $(THISDIR)/xray-core/* ; \
	            tar zxfv $(THISDIR)/Xray-core-$(Xray_VERSION).tar.gz -C $(THISDIR)/xray-core ; \
	            fi ) \
	fi )

build_Xray:
    ( if [ ! -f $(THISDIR)/xray ]; then \
    	( cd $(THISDIR)/$(Xray_dir); \
    	if [ $(GOPROXY_ON) = "y" ]; then \
    	    go env -w GOPROXY=https://goproxy.cn,direct ; \
    	fi ; \
	        GOOS=linux GOARCH=mipsle go build -ldflags "-w -s" -o $(THISDIR)/bin/xray; \
	)
	fi )
else
all:
endif
clean:
	rm -rf $(THISDIR)/xray-core
	rm -rf $(THISDIR)/bin

romfs:
ifeq ($(GITHUB_ACTION),n)	
	$(ROMFSINST) -p +x $(THISDIR)/bin/xray /usr/bin/v2ray
else
	$(ROMFSINST) -p +x $(THISDIR)/xray /usr/bin/v2ray
endif
