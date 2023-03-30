#!/bin/bash

# Check if svelte is installed.
cd $PATH_TO_SUBMISSION_REPO
npm install
npm ls | grep "svelte"