FROM node:10-slim


LABEL "maintainer"="tombrightbill <tombrightbill@gmail.com>"
LABEL "repository"="https://github.com/tombrightbill/serverless-action"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="Deploy Worker with the Serverless CLI"
LABEL "com.github.actions.description"="Deploy a Worker with Serverless"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="orange"

RUN npm i -g serverless

RUN serverless plugin install -n serverless-cloudflare-workers

ENTRYPOINT ["serverless deploy"]