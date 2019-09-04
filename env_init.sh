mkdir api
mkdir output

## export for dor
export BERT_BASE_DIR=$(pwd)/chinese_L-12_H-768_A-12 
export BERT_DATA=$(pwd)/data
export MODEL_PB_DIR=$(pwd)/api/
export MODEL_DIR=$(pwd)/output
export OUTPUT_DIR=$(pwd)/output

## export for train parameters
export MAX_SEQ_LENGTH=128
export TRAIN_BATCH_SIZE=32
export LEARNING_RATE=2e-5
export NUM_TRAIN_EPOCHS=7

# download bert model
if [ -d $(pwd)/"chinese_L-12_H-768_A-12" ]; then
    echo "bert init model data exists"
else
    echo "download bert init model"
    curl -O https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip && unzip chinese_L-12_H-768_A-12.zip && rm chinese_L-12_H-768_A-12.zip
fi

# install python env
pip install -r src/requirements.txt
