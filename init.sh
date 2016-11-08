if [ ! -f setup/vault-pipeline-vars.yml ]; then
  echo "Creating setup/vault-pipeline-vars.yml"
  cp samples/vault-pipeline-vars-template.yml setup/vault-pipeline-vars.yml
fi
echo "!!!!!!!!!!!!!      BEFORE PROCEEDING      !!!!!!!!!!!!!!!!!"
echo "PLEASE MODIFY THE VALUES IN THE FILES IN the 'setup' directory TO MATCH YOUR SYSTEM"
echo
echo
echo
echo "to upload the oss pipeline please run:"
echo "$> fly -t TARGET set-pipeline -p deploy-vault -c ci/vault-pipeline.yml -l setup/vault-pipeline-vars.yml"
echo 
