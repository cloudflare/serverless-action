<b> Github Action to Deploy a Cloudflare Worker with the Serverless Framework </b>

If you are new to GitHub actions please see the official guide [here](https://help.github.com/articles/creating-a-workflow-with-github-actions/).

To use this action you must provide a Worker script (i.e. `worker-script.js`) in your repo attached to this action as well as the appropriate environmental variables.

<b>File Structure</b>

Your repo must include the CF Worker script to be deployed and an optional `serverless.yml file`. If you do not include a `serverless.yml` file then the action will assume some smart defaults to deploy the worker based on the ENV variables you pass. Any included `serverless.yml` must exist in the root of your repo along with your worker script.

<b>Environmental Variables </b>

This action will expect the following environmental variables to be passed:

```
CLOUDFLARE_AUTH_EMAIL #the email associated with the account
CLOUDFLARE_ACCOUNT_ID #your account ID
CLOUDFLARE_ZONE_ID #your Cloudflare zone ID
CLOUDFLARE_AUTH_KEY #your global API key; use the secret variable type available within GitHub Actions for this variable
CLOUDFLARE_SCRIPT_NAME #the name of your worker-script.js file with .js ommited. NOTE: Worker names can contain lowercase letters, numbers, underscores, and dashes. They cannot start with dashes or contain uppercase letters.
```
<b> Using a Custom Serverless.yml </b>

The Serverless framework expects a ```serverless.yml``` file which allows us to use our existing Serverless integration to deploy Workers for this GitHub action. By default we provide one to deploy your worker. If you'd like to bring your own, please see [here]( https://developers.cloudflare.com/workers/deploying-workers/serverless/) for getting started.
 
You may pass in other environmental variables to your custom ```serverless.yml``` if needed just make sure to refer to them by using ```${env:YOUR_VARIABLE}``` syntax.

In a multiscript (Enterprise) environment the ```name``` will be seen in the UI where all your scripts are listed. In a single script environment the ```name``` will not be shown in the UI (as there is only one script).

<b> main.workflow </b>

The ```main.workflow``` output could look something like:

```
workflow "Depkoy Worker {
  on = "push"
  resolves = ["cloudflare/serverless-action@master"]
}

action "Deploy Worker" {
  uses = "cloudflare/serverless-action@master"
  env = {
    CLOUDFLARE_ACCOUNT_ID = "ACCOUNT_ID"
    CLOUDFLARE_ZONE_ID = "ZONE_ID"
    CLOUDFLARE_AUTH_EMAIL = "hello@example.com"
    CLOUDFLARE_SCRIPT_NAME = "worker-script"
  }
  secrets = ["CLOUDFLARE_AUTH_KEY"]
}
```

<b>License</b>

The Dockerfile and associated scripts and documentation in this project are released under the [MIT](https://github.com/tombrightbill/serverless-action/blob/master/LICENSE) License.
