FROM node:10-slim

LABEL "com.github.actions.name"="Deploy a Worker"
LABEL "com.github.actions.description"="Deploy a Worker with the Serverless Framework"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="orange"

RUN yarn global add serverless 

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]