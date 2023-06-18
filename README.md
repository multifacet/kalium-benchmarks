# Benchmarks for Kalium

**Warning** This guide should be followed after installing OpenFaas on a Kubernetes cluster.

The guide contains the steps to generate the performance data and graphs in the evaluation section of the paper. More specifically, the repository contains the data and setup needed to reproduce Figures 7 and 8 along with the fine grained measurements for the per-system call overhead.

### Table of Contents
1. [Setting up MySql Database](#mysql)
2. [Running Valve Benchmarks](#valve)
3. [Running Microbenchmark](#micro)
4. [Generating Performance Graph (Figure 8)](#benchmarks)
5. [Generating Policy Accuracy Graph (Figure 7)](#policy)


### Setting up MySql Database <a name="mysql"></a>
Some of the benchmark functions require a prebuilt database.
```
cd mysql
kubectl apply -f ./mysql-pv.yml
kubectl apply -f ./mySqlDeployment.yml
```

Check if the mysql pod is ready by running `kubectl get pods -n openfaas-fn -o wide`

Once the pod is ready, populate it by connecting to it, creating a new user and uploading the prebuilt database.
```
$ sudo apt install -y mariadb-client-core-10.1
$ mysql -u root -ppassword -h <mysql pod IP> -P 3306
CREATE USER 'abc'@'%' IDENTIFIED BY 'xyz';
GRANT ALL PRIVILEGES ON * . * TO 'abc'@'%';
create database helloRetail;
exit
$ mysql -u root -ppassword -h <mysql pod IP> -P 3306 -D helloRetail < ../vanilla-hello-retail/helloRetailVanillaFinal.sql
```

### Running Valve Benchmarks <a name="valve"></a>

