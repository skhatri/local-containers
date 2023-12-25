
uninstall (){
  local module=$1
  helm del $module > /dev/null 2>&1 || echo $module not found
}

uninstall postgres
uninstall pg-data

uninstall cassandra
uninstall cass-data

uninstall kafka
uninstall kafka-setup

uninstall airflow



