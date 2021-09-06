#!/bin/bash

export ELASTIC_HOME=/opt/elasticsearch
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-ppc64el
cd $ELASTIC_HOME
./bin/elasticsearch
