FROM node:10-slim

RUN yarn global add serverless

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]