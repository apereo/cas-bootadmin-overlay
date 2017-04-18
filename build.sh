#!/bin/bash

function clean() {
	./mvnw clean "$@"
}

function package() {
	./mvnw clean package -T 5 "$@"
}

function bootrun() {
	./mvnw clean package spring-boot:run -T 5 "$@"
}

function run() {
	package && java -Xdebug -Xrunjdwp:transport=dt_socket,address=5010,server=y,suspend=n -jar target/casbootadminserver.war 
}

if [ $# -eq 0 ]; then
    echo -e "No commands provided. Defaulting to [run]\n"
    run
    exit 0
fi


case "$1" in
"clean")
	shift
    clean "$@"
    ;;   
"package")
	shift
    package "$@"
    ;;
"bootrun")
	shift
    bootrun "$@"
    ;;
"run")
    run "$@"
    ;;
*)
    help
    ;;
esac

