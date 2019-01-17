#!/bin/bash

serverless create --template cloudflare-workers --path deploy-worker 

echo 'ls-ing below'

ls

cd deploy-worker 

serverless plugin install --name serverless-cloudflare-workers 

npm install

cp -r /github/workspace .

ls

serverless deploy
