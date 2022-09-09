source ./script/function.sh
install_yay
if [ $1 -eq 0 ] ; then
  echo "Install application ..."
  ./script/app_install.sh
else
  echo "Install desktop..."
  ./script/desktop_install.sh
fi
