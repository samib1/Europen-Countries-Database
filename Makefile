.PHONY := build


group10.class: group10.java 
	javac group10.java

build: group10.class 

run: build
	java -cp .:sqlite-jdbc-3.39.3.0.jar group10
