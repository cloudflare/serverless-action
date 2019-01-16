FROM node:10-slim

RUN yarn global add serverless \
    && serverless create --template cloudflare-workers --path deploy-worker \
    && cd deploy-worker \
    && serverless plugin install --name serverless-cloudflare-workers \
    && npm install


ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]