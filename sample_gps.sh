#!/bin/bash

# 奇数回目のメッセージを出力する関数
function print_odd_message {
  local iteration=$1
  mosquitto_pub -h localhost -p 1883 -d -t /test5/GLOBAL_POSITION_INT -m '{   "time_boot_ms": 526356,    "lat": 357615000,    "lon": 1389328106,    "alt": 1100060,    "relative_alt": -20, "vx": 1, "vy": -1, "vz": 0, "hdg": 35873 }' && mosquitto_pub -h localhost -p 1883 -d -t /test6/GLOBAL_POSITION_INT -m '{   "time_boot_ms": 526356,    "lat": 357612000,    "lon": 1389328106,    "alt": 1100060,    "relative_alt": -20, "vx": 1, "vy": -1, "vz": 0, "hdg": 35873 }' 
}

# 偶数回目のメッセージを出力する関数
function print_even_message {
  local iteration=$1
  mosquitto_pub -h localhost -p 1883 -d -t /test5/GLOBAL_POSITION_INT -m '{   "time_boot_ms": 526356,    "lat": 357615000,    "lon": 1389338000,    "alt": 1100060,    "relative_alt": -20, "vx": 1, "vy": -1, "vz": 0, "hdg": 35873 }' && mosquitto_pub -h localhost -p 1883 -d -t /test6/GLOBAL_POSITION_INT -m '{   "time_boot_ms": 526356,    "lat": 357612000,    "lon": 1389329000,    "alt": 1100060,    "relative_alt": -20, "vx": 1, "vy": -1, "vz": 0, "hdg": 35873 }'
}
# メッセージを出力する関数
function print_message {
  local iteration=$1
  echo "ループ $iteration 回目"
}

# 引数のチェック
if [ $# -ne 1 ]; then
  echo "使い方: $0 <ループ回数>"
  exit 1
fi

# 引数を変数に代入
loop_count=$1

# ループ回数が正の整数か確認
if ! [[ "$loop_count" =~ ^[0-9]+$ ]]; then
  echo "エラー: ループ回数は正の整数でなければなりません。"
  exit 1
fi

# 指定された回数分ループ
for ((i = 1; i <= loop_count; i++)); do
  if (( i % 2 == 1 )); then
    print_odd_message $i
  else
    print_even_message $i
  fi
  print_message $i
  sleep 5 
done

