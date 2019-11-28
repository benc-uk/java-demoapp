#!/bin/bash

# Variables
region=westeurope
rg=temp.spring
service=demobenc
app=java-demoapp
ver=1.0.0

echo -e "✨  === \e[35mAzure Spring Cloud Demo!\e[39m ===  ✨"

echo -e "\e[33m### 📂  \e[32mCreating resource group"
az group create -g $rg -l $region -o table

echo -e "\e[33m### 🎁  \e[32mCreating Azure Spring Cloud service:\e[39m $service"
az spring-cloud create -n $service -g $rg -o table

echo -e "\e[33m### 🚩  \e[32mCreating Azure Spring Cloud app:\e[39m $app"
az spring-cloud app create -s $service -g $rg -n $app -o table
echo -e "\e[33m### 🔨  \e[32mSetting app config, Java 11 & public traffic"
az spring-cloud app update -s $service -g $rg -n $app --runtime-version Java_11 --is-public true -o table

echo -e "\e[33m### ☕  \e[32mLocally building app JAR with Maven"
./mvnw -ntp clean package -Dapp.version=$ver -DskipTests -Dmaven.test.skip=true
echo -e "\e[33m### 🚀  \e[32mDeploying JAR to:\e[39m $app"
az spring-cloud app deploy -s $service -g $rg -n $app --jar-path ./target/java-demoapp-$ver.jar -o table

url=$(az spring-cloud app show -s $service -g $rg -n $app --query "properties.url" -o tsv)
echo -e "\n\e[33m### ✨  \e[32mWooo! App is deployed here:\e[39m $url/\n"