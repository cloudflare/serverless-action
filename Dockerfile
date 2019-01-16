FROM node:10-slim

RUN yarn global add serverless \
    && serverless plugin install --name serverless-cloudflare-workers \
    && serverless create --template cloudflare-workers --path deploy-worker \ 
    && cd deploy-worker \ 
    && npm install


ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]