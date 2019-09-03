# DOCKER build commands

```bash
# build 
docker build . -t bert_train:latest

# login and upload images to dockerhub, change to your own dockerhub account accordingly
docker login 
docker tag bert_train:latest teddy913/bert_train
docker push teddy913/bert_train

# docker ruin
docker run --gpus all teddy913/bert_train bash
```

# AWS GPU instance init shell

- to support --gpus args from Nvidia docker, docker engine need to be version 19.03

- loading bert models will eat up 10gb of GPU ram, choose GPU instance at least on p2 level
- Assuming docker running on a GPU instance, if you want to run on cpu-only machine, change src/requirments.txt accordingly

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