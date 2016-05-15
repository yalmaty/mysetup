function tools_vbox_install {
  vboxmanage -version >/dev/null 2>&1
  if [ $? = 127 ]
  then
    apt-get install virtualbox
  else 
    echo "Virtualbox is already installed"
  fi

# BOX_BASE_URL="http://download.virtualbox.org/virtualbox"
#
# VBOX_VERSION=`curl ${VBOX_BASE_URL}/LATEST.TXT 2>/dev/null`
# # echo $VBOX_VERSION
#
# UBUNTU_CODE_NAME=`lsb_release -c|awk '{print $2}'`
#  echo $UBUNTU_CODE_NAME
#
# VBOX_PKG=`curl "${VBOX_BASE_URL}/${VBOX_VERSION}/MD5SUMS" 2>/dev/null|grep "${UBUNTU_CODE_NAME}_amd64"|awk -F"*" '{print $2}'`
# echo $VBOX_PKG
#
# test  ! -f "${HOME}/Downloads/${VBOX_PKG}" && curl "${VBOX_BASE_URL}/${VBOX_VERSION}/${VBOX_PKG}" -o "${HOME}/Downloads/${VBOX_PKG}"
  echo "------------------------------"
}

function tools_docker_install {
  docker -v >/dev/null 2>&1
  if [ $? = 127 ]
  then
    # echo ${STATUS}
    apt-get install docker.io
  else 
    echo "Docker is already installed"
  fi
  echo "------------------------------"
}

function tools_bashrc {
  curl -o "${HOME}/.bashrc_git" https://raw.githubusercontent.com/yalmaty/mysetup/master/.bashrc 
  less ~/.bashrc|grep 'source ~/.bashrc_git'

  if [ $? -ne 0 ]
  then
    cat >> "${HOME}/.bashrc" << EOF
source ~/.bashrc_git
EOF
    echo ".bashrc is updated"
  fi
  echo "------------------------------"
}

function tools_gitpromt {
  test ! -f  "${HOME}/.gitpromt" && curl -o "${HOME}/.gitpromt" https://raw.githubusercontent.com/yalmaty/mysetup/master/.git-prompt.sh
  echo "Git promt is installed in ${HOME} directory"
  echo "------------------------------"
}

function tools_packer_download {
  BASE_URL="https://releases.hashicorp.com/packer/0.10.1"
  PKG_NAME=`curl -silent "${BASE_URL}/packer_0.10.1_SHA256SUMS"|grep linux|grep 64 |awk '{print $2}'`
  test ! -f  "${HOME}/Downloads/${PKG_NAME}" && curl -o "${HOME}/Downloads/${PKG_NAME}" "${BASE_URL}/${PKG_NAME}" 
  echo "${PKG_NAME} is dowloaded"
  mkdir "${HOME}/packer"
  unzip -n "${HOME}/Downloads/${PKG_NAME}" -d "${HOME}/packer/."
  rm "${HOME}/Downloads/${PKG_NAME}" 
  echo "Initial package is unziped and removed"
}

function tools_packer_install {
  packer --version >/dev/null 2>&1
  if [ $i? = 127 ]
  then
    tools_packer_download
  else 
    echo "Packer is already installed"
  fi
  echo "------------------------------"
}


function tools_install_all {
  tools_vbox_install
  tools_docker_install 
  tools_packer_install 
  tools_gitpromt
}

tools_install_all
