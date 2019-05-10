#!/usr/bin/env bash
set -x
#MODEL="resnet18_baseline"
MODEL="resnet18_baseline_attention_SE_nonpretrained_long"
MODEL ='resnet50_0.5_non_local_lr4e2_long_pretrained'
mkdir -p models/resnet/${MODEL}

python3 eval.py  \
--model_path models/resnet/${MODEL}/model_best.pth \
2>&1 | tee models/resnet/${MODEL}/${MODEL}_test_DL_50_finetune.report
