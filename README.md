# openshift-snmp
Run snmpd daemon in a container on Openshift nodes, and expose using hostPort 161, to monitor the cluster

## Customizing for an environment

Modify configmap-snmpd-config.yaml

For custom snmpd.conf configurations, modify this secion of the file with needed SNMP configurations

```
data:
  snmpd.conf: |2
```

Modify daemonset-snmpd.yaml

Modify this file for modifying, adding or deleting variables in the configmap-snmpd-config.yaml file or changing the SNMP port.

Variables section:
```
          - name: SNMPCOMMUNITY
            value: 'read only smnp community name'
          - name: SNMPOWNER
            value: 'snmp contact name and information'
          - name: SNMPLOCATION
            value: 'location of the system hosting the snmp client'
```
SNMP listening port section:
```
        ports:
        - containerPort: 161
          protocol: UDP
          hostPort: 161
```

## Daemonset deployment

On a machine which has the oc command installed and is logged in to the desired Openshift Cluster to install the SNMP Daemonset, execute the deploy.sh script which will install the SNMP Daemonset on all nodes in the Openshift cluster.
