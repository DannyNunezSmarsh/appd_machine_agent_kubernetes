# appd_machine_agent_kubernetes
Git repo to create kubernetes pod to run machine agent.

Download the AppDynamics Standalone machine agent (no JRE) and unzip to storage.

The yaml file (appdmachineagent.yaml) mounts
/Users/mark.jeffery/Documents/kubernetes/MachineAgent as /appd_machine_agent

This entry should be changed to reflect the location used.

## Installing the AppDynamics Docker Extension

The AppDynamics Docker extension can be downloaded [here](https://www.appdynamics.com/community/exchange/extension/docker-monitoring-extension/), and should be extracted into the <Machine-Agent>/monitors directory, and configured normally.

When configuring the AppDynamics Docker extension, enter

``` yaml
tcpSockets:
    - baseUrl: http://$KUBERNETES_SERVICE_HOST:2375
      name: Server1
```

The start_machine_agent.sh script will modify the file, substituting the hostname for the value of the KUBERNETES_SERVICE_HOST environment variable.

*This means that this mount point can't be shared amongst multiple Docker hosts.*

Edit conf/controller_info.xml to define the location of your AppDynamics controller

## TODO

*if there is more than 1 appdynamics machine agent in a node, then the script will not work, as it returns each pod name. The script should be fixed so that it only shows the nodename for this pod.
