#!/bin/bash

docker build -t="lintong/storm:1.0.0" storm
docker build -t="lintong/storm-nimbus:1.0.0" storm-nimbus
docker build -t="lintong/storm-supervisor:1.0.0" storm-supervisor
docker build -t="lintong/storm-ui:1.0.0" storm-ui
