FROM node:10-slim

RUN npm i -g serverless

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]