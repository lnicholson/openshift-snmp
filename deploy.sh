#!/bin/bash
oc create namespace openshift-snmp
oc create sa snmpcollector -n openshift-snmp
oc create role snmp-collector-privileged \
    --verb use \
    --resource securitycontextconstraints \
    --resource-name privileged \
    -n openshift-snmp
oc create rolebinding snmp-collector-privileged-binding \
    --role=snmp-collector-privileged \
    --serviceaccount=openshift-snmp:snmpcollector \
     -n openshift-snmp
oc create -f openshift/configmap-snmpd-config.yaml -n openshift-snmp
oc create -f openshift/daemonset-snmpd.yaml -n openshift-snmp
