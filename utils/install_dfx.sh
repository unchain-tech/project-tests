#!/bin/bash

install_dfx()
{
  DFX_VERSION=0.14.0 sh -ci "$(curl -sSL https://internetcomputer.org/install.sh)"
}