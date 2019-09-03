FROM tensorflow/tensorflow:1.13.1-gpu-py3
# train paramter
ARG max_seq_length=128
ARG train_batch_size=4
ARG learning_rate=2e-5
ARG num_train_epochs=7.0

# define path 
ARG bert_data="/root/Bert/data"
ARG bert_output="/root/Bert/output"
ARG bert_init_models="/root/Bert/models"
ARG bert="/root/Bert"
ARG work_space="/root/work"
# mkdir
WORKDIR $work_space
WORKDIR $bert
WORKDIR $bert_data
WORKDIR $bert_output
WORKDIR $bert_init_models
# download bert pretrain model
RUN curl -O https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip && unzip chinese_L-12_H-768_A-12.zip && rm chinese_L-12_H-768_A-12.zip
# install vim
RUN apt update && apt install vim -y
# github code
WORKDIR $work_space
ADD ./src ./src
WORKDIR $work_space/src
RUN pip install -r requirements.txt
ADD data $bert_data
# env
ENV BERT_BASE_DIR=$bert_init_models/chinese_L-12_H-768_A-12 
ENV BERT_DATA=$bert_data 
ENV MODEL_PB_DIR=$bert/api/
ENV MODEL_DIR=$bert_output
ENV OUTPUT_DIR=$bert_output

## env for train parameters
ENV MAX_SEQ_LENGTH=$max_seq_length
ENV TRAIN_BATCH_SIZE=$train_batch_size
ENV LEARNING_RATE=$learning_rate
ENV NUM_TRAIN_EPOCHS=$num_train_epochs