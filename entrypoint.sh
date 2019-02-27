#!/bin/bash

ACTION_WORKSPACE=/root/worker-deploy

if [ -e $GITHUB_WORKSPACE/serverless.yml ]
then
	echo 'Custom serverless.yml found.'
    mv $GITHUB_WORKSPACE/serverless.yml $ACTION_WORKSPACE
fi

mv $GITHUB_WORKSPACE/*.js $ACTION_WORKSPACE

cd $ACTION_WORKSPACE && sls deploy