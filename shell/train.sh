set -x
MODEL="resnet18_baseline_nonpretrained_long_0.5"

mkdir -p models/resnet/${MODEL}
#cp shell/train.sh models/${MODEL}/

python3 main.py  \
--name ${MODEL}  \
--batch_size 120 \
--step 30 \
--epochs 80 \
--lr 1e-2 \
--p 0.5 \
--epochs 100 \
--weight_decay 5e-4  \
--optimized \
--momentum 0.9  \
2>&1 | tee models/resnet/${MODEL}/${MODEL}_training_50_finetune.report 

# Do the test thereafter
python3 test.py  \
--name ${MODEL}  \
2>&1 | tee models/resnet/${MODEL}/${MODEL}_test_50_finetune.report
