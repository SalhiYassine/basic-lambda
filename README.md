## What is this?

This is a set of instructions and commands to ship a Lambda function written in Node.js and TypeScript. Please note that this is not production-ready and was initially an experiment. The intention is to create infrastructure templates for quick deployment in the future.

## Why does this exist?

This project exists for two main reasons: 
1. A fun experiment.
2. A step towards creating infrastructure templates for fast deployment.

## How to run this?

**Note:** Ensure you have the AWS CLI installed on your machine and have run `aws configure` to provide your access key and secret.

1. Install `tfenv` (version manager for Terraform):

    ```bash
    brew install tfenv
    ```

2. Install the desired version of Terraform (1.4.6 is recommended for this project):

    ```bash
    tfenv install 1.4.6
    ```

3. Use the desired version:

    ```bash
    tfenv use 1.4.6
    ```

4. Use the Makefile commands to set up the environment:

    - Install Lambda function dependencies:

        ```bash
        make install-function-deps
        ```

    - Build the Lambda function:

        ```bash
        make build-function
        ```

    - Initialize Terraform:

        ```bash
        make init
        ```

    - Run the plan command to preview the infrastructure:

        ```bash
        make plan
        ```

    - If everything looks good, apply the changes:

        ```bash
        make apply
        ```

        You'll be prompted to accept the plan by entering `yes`.

5. Once you're done, clean up all resources:

    ```bash
    make destroy
    ```

You now have a Lambda function! Check the logs for the output (Lambda URL), and if everything went well, you should see your function return.
