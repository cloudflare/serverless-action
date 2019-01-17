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

