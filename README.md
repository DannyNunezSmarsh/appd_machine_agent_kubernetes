# appd_machine_agent_kubernetes
Git repo to create kubernetes pod to run machine agent.

Download the AppDynamics Standalone machine agent (no JRE) and unzip to /appd/machine-agent directory of this repo.

Edit conf/controller_info.xml to define the location of your AppDynamics controller

## Instructions for building docker image (GKE)

docker build -t gcr.io/$PROJECT_ID/appdmachineagent:latest .
gcloud docker push gcr.io/$PROJECT_ID/appdmachineagent:latest