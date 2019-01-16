FROM node:10-slim

RUN yarn global add serverless \
    && serverless plugin install --name serverless-cloudflare-workers

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]