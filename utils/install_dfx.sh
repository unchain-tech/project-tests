#!/bin/bash

install_dfx()
{
  DFX_VERSION=0.14.1 sh -ci "$(curl -sSL https://internetcomputer.org/install.sh)"
}