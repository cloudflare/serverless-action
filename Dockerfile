FROM node:10-slim

LABEL "com.github.actions.name"="Deploy a CloudFlare Worker"
LABEL "com.github.actions.description"="Deploy a CloudFlare Worker with the Serverless Framework"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="orange"

RUN yarn global add serverless  &&\
	mkdir -p /$HOME/worker-deploy &&\
	cd $HOME/worker-deploy &&\
	serverless create --template cloudflare-workers &&\
	serverless plugin install --name serverless-cloudflare-workers &&\
	rm -f *.{yml,js}

ADD serverless.yml /root/worker-deploy/serverless.yml

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]