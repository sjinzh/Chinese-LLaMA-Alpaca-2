#!/bin/bash

# temporary script to chat with Chinese Alpaca-2 model
# usage: ./chat.sh alpaca2-ggml-model-path your-first-instruction

SYSTEM_PROMPT='You are a helpful assistant. 你是一个乐于助人的助手。'
FIRST_INSTRUCTION=$2

./main -m $1 \
--color -i -c 4096 -t 8 --temp 0.5 --top_k 40 --top_p 0.9 --repeat_penalty 1.1 -eps 1e-5 \
--in-prefix-bos --in-prefix ' [INST] ' --in-suffix ' [/INST]' -p \
"[INST] <<SYS>>
$SYSTEM_PROMPT
<</SYS>>

$FIRST_INSTRUCTION [/INST]"