source ./script/function.sh
install_yay
mkdir_local_bin
mkdir_local_share_fonts
if [ $1 -eq 0 ] ; then
  echo "Install application ..."
  ./script/app_install.sh
else
  echo "Install desktop..."
  ./script/desktop_install.sh
fi
