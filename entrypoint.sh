#!/bin/bash
echo 'ls below'
ls
echo 'ls -la below'
ls -la
echo 'mkdir below'
mkdir deploy-worker

echo 'post mkdir ls'

ls

cd deploy-worker

serverless create --template cloudflare-workers 

serverless plugin install --name serverless-cloudflare-workers

rm -rf helloWorld.js

mv $GITHUB_WORKSPACE/*.{yml,js} $GITHUB_WORKSPACE/deploy-worker/

echo 'ls within deploy-worker directory'

ls

cat helloWorld.js
cat serverless.yml

echo $CLOUDFLARE_ACCOUNT_ID
echo $CLOUDFLARE_ZONE_ID
echo $CLOUDFLARE_AUTH_EMAIL
echo $CLOUDFLARE_AUTH_KEY

serverless deploy --verbose

