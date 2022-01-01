#!/bin/bash

############ START - SET PROPERTIES #########

ADDRESS="<stars1...>"
VALIDATOR="<starvaloper...>"
KEY_NAME="<key_name>"
PWD="<wallet_password>"

CHAIN_ID="<chain-id>" #for mainnet: stargaze-1
GAS_VALUE="<gas_value>" #for example: 200000 or auto
FEE_VALUE="<fee_value>" #for example: 200ustars

############ END - SET PROPERTIES #########

############ START - AUTO DELEGATION #########

# Withdraw 
starsd tx distribution withdraw-rewards "${VALIDATOR}" --commission --from "${KEY_NAME}" --chain-id=${CHAIN_ID} --gas="${GAS_VALUE}" --fees="${FEE_VALUE}" -y

sleep 10s

AVAILABLE_COIN=$(starsd query bank balances ${ADDRESS} --output json | jq -r '.balances | map(select(.denom == "ustars")) | .[].amount' | tr -cd [:digit:])
KEEP_FOR_FEES=1000000
AMOUNT=$(($AVAILABLE_COIN - $KEEP_FOR_FEES))
AMOUNT_FINAL=$AMOUNT"ustars"

sleep 10s

# Delegate
starsd tx staking delegate "${VALIDATOR}" "${AMOUNT_FINAL}" --from "${KEY_NAME}" --chain-id=${CHAIN_ID} --gas="${GAS_VALUE}" --fees="${FEE_VALUE}" -y

echo $PWD | starsd tx staking delegate "${VALIDATOR}" "${AMOUNT_FINAL}" --from "${KEY_NAME}" --chain-id=${CHAIN_ID} --gas="${GAS_VALUE}" --fees="${FEE_VALUE}" -y

############ END - AUTO DELEGATION #########
