learning_rate="5e-5"
n_epochs=6
batch_size=32
gradient_accumulation_steps=1

export TORCH_DISTRIBUTED_DEBUG=DETAIL

for tgt_lang in "ARA" "DEU"
do
    cmd="python src/ets/train_sft.py \
        --dataset data/ets/train \
        --save_path trained_models/ets/sft/transfer/${tgt_lang} \
        --mode transfer \
        --llama_model meta-llama/Llama-2-7b-hf \
        --target_native_language $tgt_lang \
        --n_epochs 6 \
        --batch_size 32 \
        --gradient_accumulation_steps 1 \
        --learning_rate 5e-5"
    echo $cmd
    eval $cmd
done
