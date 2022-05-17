#!/bin/bash



sh deploy-vets-service.sh
sh deploy-customers-service.sh
sh deploy-visits-service.sh
sh deploy-petclinic-web-v2.sh

oc rollout status -w dc/vets-service &&
  oc rollout status -w dc/customers-service &&
  oc rollout status -w dc/visits-service &&
  oc rollout status -w dc/petclinic-web-v2