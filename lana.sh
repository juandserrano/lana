#!/bin/bash

start(){
  cp env .env

  docker-compose up -d
}

dev() {
  cp env .env

  docker-compose up
}

stop() {
  docker-compose down
}

clean() {
  
  while true; do
  read -r -p "Are your sure you want to remove all data? (Y/N)" answer;
    case $answer in
      [Y/y] )  
        docker-compose down;
        rm .env
        echo "All data has been removed"
        exit 0;;
      [N/n] )
        echo "Aborting clean..."
        exit 0;;
      * )
        echo -e "\nInvalid option.\n";;
    esac
  done
}

case $1 in
  "start")
    start;;
  "stop")
    stop;;
  "dev")
    dev;;
  "clean")
    clean;;
  *)
    exit 1;;
esac