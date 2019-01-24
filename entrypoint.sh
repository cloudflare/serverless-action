#!/bin/bash

mkdir deploy-worker

cd deploy-worker

serverless create --template cloudflare-workers 

serverless plugin install --name serverless-cloudflare-workers

rm -rf helloWorld.js

mv $GITHUB_WORKSPACE/*.{yml,js} $GITHUB_WORKSPACE/deploy-worker/

sls deploy

