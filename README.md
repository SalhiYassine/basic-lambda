## What is this?
All you need to ship a lambda function written in Node & Typescript

PS: this is not production ready, this was an initial experiment. I will have a production worthy one up soon

## Why does this exist?
Partly me having fun, partly a step towards making myself some infrastructure templates I can use in the future if I need to ship something fast 🚀


### How to run this?
NOTE: ensure you have the aws cli installed on your machine and have run `aws configure` to provide your access key and secret

Install tfenv (version manager for terraform)
`brew install tfenv`

I used version `1.4.6` so for I recommend the same for if you choose to run this

Install desired version
`tfenv install 1.4.6`

Use the desired version
`tfenv use 1.4.6`

Next, use the Makefile commands to get you up and running

Install the lambda function dependencies
`make install-function-deps`

Build the lambda function
`make build-function`

Initialise terraform
`make init`

Run the plan command to see what infrastructure you are about to create
`make plan`

Provided everything looks good
`make apply` - you will be prompted to accept the plan by entering `yes`

Once you are done, clean up all resources your created
`make destroy`

Done! You now have a lambda!

Check the logs for the output (lambda url) and if everything went well you should see your function return
