#!/bin/bash

#################################################################################################
# Author : Ashutosh Bambal
# Date : 20/08/2023
# Description : This script is used to install minikube on ubuntu machine
# OS : Ubuntu & Distibution
# Version : V1
##################################################################################################

# Step 1: Update System Packages
sudo apt update -y

# Step 2: Install Required Packages
sudo apt install -y curl wget apt-transport-https

# Step 3: Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Step 4: Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Step 5: Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Step 6: Start Minikube
sudo usermod -aG docker $USER && newgrp docker
minikube start --driver=docker
minikube start

# Step 7: ChecCluster Status
minikube status
