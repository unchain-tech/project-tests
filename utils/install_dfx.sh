#!/bin/bash

install_dfx()
{
  DFX_VERSION=0.12.1 sh -ci "$(curl -sSL https://internetcomputer.org/install.sh)"
}