#!/bin/bash

set -eux

export TEST_REPO=test
export TEST_REPO_URL=`https://github.com/shiftbase-inc/STARPASS-starter-project.git`
git clone https://x-access-token:$SHIFTBASE_PAT@$(echo $TEST_REPO_URL | sed s/https:\\/\\///g) $TEST_REPO

echo Running tests...

# Clean existing test code.
rm -rf $TEST_REPO/test/

# Copy original test code
cp -r test/ $TEST_REPO/test/

# Run test. Test sns temporarily.
cd $TEST_REPO
yarn
yarn test:sns

# Exit with last status.
exit $?