#!/usr/bin/env bash
python classifier.py \
  --task_name=setiment \
  --do_train=true \
  --do_eval=true \
  --data_dir=$BERT_DATA \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=$MAX_SEQ_LENGTH \
  --train_batch_size=$TRAIN_BATCH_SIZE \
  --learning_rate=$LEARNING_RATE \
  --num_train_epochs=$NUM_TRAIN_EPOCHS \
  --output_dir=$OUTPUT_DIR