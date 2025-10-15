#!/bin/bash
set +x 
yum update -y
yum install git -y
yum install podman -y
set -x
