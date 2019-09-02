# DOCKER build commands


```bash
# build 
docker build . -t bert_train:latest

# upload to dockerhub
docker tag bert_train:latest teddy913/bert_train
docker push teddy913/bert_train
```