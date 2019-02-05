Github Action to Deploy a Cloudflare Worker with the Serverless Framework.

If you are new to GitHub actions please see the official guide [here](https://help.github.com/articles/creating-a-workflow-with-github-actions/).

To use this action you must provide the appropriate file structure in your repo containing a Worker as well as the appropriate environmental variables.

<b>File Structure</b>

Your repo must include the CF Worker script to be deployed and a serverless.yml file. Your file structure should look like:

    .
    |- workerScript.js
    |- serverless.yml

<b> Serverless.yml </b>

The Serverless framework expects a ```serverless.yml``` file which allows us to use our existing Serverless integration to deploy Workers for this GitHub action.
    
An example serverless.yml file could look like:
```
service:
    name: workerScript # can be arbitary

provider:
  name: cloudflare
  config:
    accountId: ${env:CLOUDFLARE_ACCOUNT_ID} # how ENV variables are referenced within the Serverless framework
    zoneId: ${env:CLOUDFLARE_ZONE_ID}

plugins:
  - serverless-cloudflare-workers
functions:
  worker-action: # this descriptor can be an arbitrary name
    name: worker-action  # the name of your script within the Cloudflare UI, MUST match the function name one line above
    script: workerScript  # there must be a file called workerScript.js in your repository containing serverless.yml
    
 ```

NOTE: advanced users may specify an ``events`` block in ```serverless.yml```. Read [here]( https://developers.cloudflare.com/workers/deploying-workers/serverless/) for more information.

In a multiscript (Enterprise) environment the ```name``` will be seen in the UI where all your scripts are listed. In a single script environment the ```name``` will not be shown in the UI (as there is only one script).

<b>Environmental Variables </b>

This action will expect the following environmental variables to be passed:

```
CLOUDFLARE_AUTH_EMAIL # the email associated with the accout
CLOUDFLARE_ACCOUNT_ID # your account ID
CLOUDFLARE_ZONE_ID # your Cloudflare zone ID
CLOUDFLARE_AUTH_KEY # your global API key; use the secret variable type available within GitHub Actions for this variable
```

The ```main.workflow``` output could look something like:

```
workflow "Cloudflare Worker" {
  on = "push"
  resolves = ["Deploy CF Worker"]
}

action "Deploy CF Worker" {
  uses = "cloudflare/serverless-action@master"
  env = {
    CLOUDFLARE_AUTH_EMAIL = "email@example.com"
    CLOUDFLARE_ACCOUNT_ID = "ACCOUNT_ID_HERE"
    CLOUDFLARE_ZONE_ID = "ZONE_ID_HERE"
  }
  secrets = ["CLOUDFLARE_AUTH_KEY"]
}
```

<b>License</b>

The Dockerfile and associated scripts and documentation in this project are released under the [MIT](https://github.com/tombrightbill/serverless-action/blob/master/LICENSE) License.

