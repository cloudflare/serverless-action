FROM node:10-slim

RUN npm --version \
    && npm i -g serverless \
    && serverless plugin install --name serverless-cloudflare-workers

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]