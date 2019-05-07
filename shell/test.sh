#!/usr/bin/env bash
set -x
#MODEL="resnet18_baseline"
MODEL="resnet18_baseline_attention_SE_nonpretrained_long"

mkdir -p models/resnet/${MODEL}

python3 eval.py  \
--model_path models/resnet/${MODEL}/model_best.pth \
2>&1 | tee models/resnet/${MODEL}/${MODEL}_test_50_finetune.report
