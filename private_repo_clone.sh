#!/bin/bash

echo "Generating RSA Key..."
ssh-keygen -t rsa -b 4096

echo "Adding Bitbucket to known hosts..."
ssh-keyscan -t rsa globaldevtools.bbva.com >> ~/.ssh/known_hosts

echo "Adding GitHub to known hosts..."
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

echo "Configuring Git with provided email and username..."
git config --global user.email "$1"
git config --global user.name "$2"

echo "Your SSH public key (id_rsa.pub) is:"
echo "================================================================"
cat /root/.ssh/id_rsa.pub
echo "================================================================"
echo "Please copy the above SSH public key and add it to your GitHub account."
