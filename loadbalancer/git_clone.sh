#!/bin/sh
cd /opt/IBM/HTTPServer/conf
git init 
git config --global user.name "git"
git config --global user.email "krzysztof.walczak1@unilodz.eu"
git clone ssh://git@github.com/krzysztofwalczak/plugincfg.git
