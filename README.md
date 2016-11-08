# concourse-deploy-vault

Deploy VAULT with [omg](https://github.com/enaml-ops) in a Concourse pipeline.

## Prerequisites

1. [Git](https://git-scm.com)
1. [Concourse](http://concourse.ci)

## Steps to use this pipeline

1. Clone this repository.

    ```
    git clone https://github.com/enaml-ops/concourse-deploy-vault.git
    ```

1. Initialize the repo for your deployment.

    ```
    cd concourse-deploy-vault
    ./init.sh
    ```

1. Edit `setup/vault-pipeline-vars.yml`

    complete the values for your environment

1. Create or update the pipeline.

    ```
    fly -t TARGET set-pipeline -p deploy-vault -c ci/vault-pipeline.yml -l setup/vault-pipeline-vars.yml
    ```


1. Delete or move `setup/*` to a secure location.
    These files are gitignored, but might contain sensitive information and
    great care should be taken in how/where/if these are kept

1. Trigger the deployment job and observe the output.

    ```
    fly -t TARGET trigger-job -j deploy-vault/deploy -w
    fly -t TARGET trigger-job -j deploy-vault/init -w
    ```

