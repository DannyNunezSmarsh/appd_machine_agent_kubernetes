# appd_machine_agent_kubernetes
Git repo to create kubernetes pod to run machine agent.

Download the AppDynamics Standalone machine agent (no JRE) and unzip to storage.

The link to the storage should be specified in the appdmachineagent.yaml file (The example shown is a local mount)

Edit conf/controller_info.xml to define the location of your AppDynamics controller
