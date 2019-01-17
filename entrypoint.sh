#!/bin/bash
pwd
ls
serverless create --template cloudflare-workers 

serverless plugin install --name serverless-cloudflare-workers 

npm install

serverless deploy
