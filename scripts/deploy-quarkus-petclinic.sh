#!/bin/bash

echo Deploy Pet Clinic........

oc delete all -l app=petclinic-database

oc new-app openshift/postgresql:10-el8 \
            --name=petclinic-database \
            -e POSTGRESQL_USER=petclinic \
            -e POSTGRESQL_PASSWORD=mysecretpassword \
            -e POSTGRESQL_DATABASE=petclinic 

mvn clean package -DskipTests -f $CHE_PROJECTS_ROOT/quarkus-workshop-m3-labs/quarkus-petclinic
#mvn clean package -Pnative -DskipTests -f $CHE_PROJECTS_ROOT/quarkus-workshop-m3-labs/quarkus-petclinic-vets-service

oc label deployment/petclinic-database app.openshift.io/runtime=postgresql --overwrite && \
oc label deployment/petclinic-database app.kubernetes.io/part-of=quarkus-petclinic --overwrite