# introduction

I have dockerized the bert code an training data.
By default, the docker container should be running on a GPU-machine, in which GPU memory should be larger then 10gb(recommand using AWS GPU instance on p2 level or higher configuration). 
The key training parameters can be modified by pass through docker command below:

```bash
docker run --gpu=all -e MAX_SEQ_LENGTH=128 -d teddy913/bert_train
```

## docker image build/ship commands

```bash
# build 
docker build . -t bert_train:latest

# login and upload images to dockerhub, change to your own dockerhub account accordingly
docker login 
docker tag bert_train:latest teddy913/bert_train
docker push teddy913/bert_train

# docker run
docker pull teddy913/bert_train
docker run --gpus all teddy913/bert_train bash
```

## AWS GPU instance init shell

- to support --gpus args from Nvidia docker, docker engine need to be version 19.03

```bash
# upgrade/resintall docker via convenient script
curl -fsSL https://get.docker.com/ | sh

# checking docker version, make sure both cilent and engine is on version 19.03
docker version

## docker login and pull
docker login
docker pull teddy913/bert_train

# run docker 
docker run --name train_ins_1 --gpus all -d --rm\
    -v /data/Bert/output:/root/Bert/output\
    -e TRAIN_BATCH_SIZE=32\
    teddy913/bert_train bash -c "sh train.sh"
```


-------
# 介绍

本项目目的是提供一个bert模型训练的 docker image 框架。
默认本镜像的容器是运行在 GPU 上，GPU 显存推荐使用大于10gb（对应亚马逊 GPU 实例是 p2 或者以上）。

主要的训练参数都可以通过甚至容器的环境变量进行修改:

```bash
docker run --gpu=all -e MAX_SEQ_LENGTH=128 -d teddy913/bert_train
```

## 镜像构建和提交

```bash
# build 
docker build . -t bert_train:latest

# login and upload images to dockerhub, change to your own dockerhub account accordingly
docker login 
docker tag bert_train:latest teddy913/bert_train
docker push teddy913/bert_train

# docker run
docker pull teddy913/bert_train
docker run --gpus all teddy913/bert_train bash
```

## 亚马逊GPU实例初始化脚本

- docker 需要升级到 19.03 才能使用 --gpu 参数

```bash
# upgrade/resintall docker via convenient script
curl -fsSL https://get.docker.com/ | sh

# checking docker version, make sure both cilent and engine is on version 19.03
docker version

## docker login and pull
docker login
docker pull teddy913/bert_train

# run docker 
docker run --name train_ins_1 --gpus all -d --rm\
    -v /data/Bert/output:/root/Bert/output\
    -e TRAIN_BATCH_SIZE=32\
    teddy913/bert_train bash -c "sh train.sh"
```
