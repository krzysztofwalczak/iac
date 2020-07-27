#!/bin/sh
cd /opt/ibm/wlp/output/defaultServer/logs/state
git init
git config --global user.name "git" 
git config --global user.email "krzysztof.walczak1@unilodz.eu"
git remote add origin git@github.com:krzysztofwalczak/plugincfg.git
git add ./plugin-cfg.xml
git commit -m "Propagating plugin cfg file"
git push -uf origin master
