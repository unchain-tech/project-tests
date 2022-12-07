#!/bin/bash

set -eux

#TODO: exportがいるのか
#TODO: 関数化かシェルスクリプト化する

export USER=x-access-token
export URL_WITHOUT_SCHEME=${SUBMISSION_REPO_HTTPS_URL##https://}
export basename=$(basename $SUBMISSION_REPO_HTTPS_URL)
export SUBMISSION_REPO=${basename%.*}
export PATH_TO_SUBMISSION_REPO=$PWD/$SUBMISSION_REPO
git clone https://$USER:$SUBMITTER_PAT@$URL_WITHOUT_SCHEME

case "$TEST_TYPE" in
    "STARPASS_SNS" )
        export USER=x-access-token
        export TEST_CODE_REPO_HTTPS_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        export URL_WITHOUT_SCHEME=${TEST_CODE_REPO_HTTPS_URL##https://}
        export basename=$(basename $TEST_CODE_REPO_HTTPS_URL)
        export TEST_CODE_REPO=${basename%.*}
        export PATH_TO_TEST_CODE_REPO=$PWD/$TEST_CODE_REPO
        git clone https://$USER:$SHIFTBASE_PAT@$URL_WITHOUT_SCHEME
        bash starpass_sns.sh
        ;;
    * ) echo no match ;;
esac

# Exit with last status.
exit $?