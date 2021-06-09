#!/usr/bin/env bash

# e.g. checkpoint_dir=../log/cscd/noBN_L1_sd100_B16/

expm=$1
sampledir=/content/RESULTS
echo "sampledir: "$sampledir
time=`date +"%m-%d-%H-%M"`
logfile=${sampledir}/log_$time.txt
mkdir -p $sampledir
touch $logfile

cd src
echo "RUNNING EVALUATE.py"
unbuffer python evaluate.py \
    --dnnet=convResnet \
    --dtnet=hypercolumn \
    --sample_dir=$sampledir \
    --checkpoint_dir=../log/cscd/noBN_L1_sd100_B16/ \
    --csv_path=/content/sample_data/test.csv \
    --low_thres=500 \
    --up_thres=3000 \
    --image_size=1920 \
    --gpu \
2>&1 | tee $logfile

