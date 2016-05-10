VBOX_BASE_URL="http://download.virtualbox.org/virtualbox"

VBOX_VERSION=`curl ${VBOX_BASE_URL}/LATEST.TXT 2>/dev/null`
# echo $VBOX_VERSION

UBUNTU_CODE_NAME=`lsb_release -c|awk '{print $2}'`
 echo $UBUNTU_CODE_NAME

VBOX_PKG=`curl "${VBOX_BASE_URL}/${VBOX_VERSION}/MD5SUMS" 2>/dev/null|grep "${UBUNTU_CODE_NAME}_amd64"|awk -F"*" '{print $2}'`
echo $VBOX_PKG

test  ! -f "${HOME}/Downloads/${VBOX_PKG}" && curl "${VBOX_BASE_URL}/${VBOX_VERSION}/${VBOX_PKG}" -o "${HOME}/Downloads/${VBOX_PKG}"
