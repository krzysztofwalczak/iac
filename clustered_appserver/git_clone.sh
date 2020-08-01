#!/bin/sh
cd /opt/ibm/wlp/output/defaultServer/logs/state
git init
git config --global user.name "git"
git config --global user.email "krzysztof.walczak1@unilodz.eu"
git clone ssh://git@github.com/krzysztofwalczak/plugincfg.git
