#!/bin/bash

# 讀取 build.conf 取得 board 設定
. ./build.conf

# 根據 board 決定 itb 檔案名稱
case $board in
    bpi-r4|bpi-r4pro|bpi-r4lite|mt7987a-rfb)
        ITB_FILE="bpi-r4.itb"
        ;;
    *)
        ITB_FILE="bpi-r3.itb"
        ;;
esac

# 顯示選單
echo "請選擇操作："
echo "1. linux"
echo "2. 複製檔案"
echo "3. 離開"

# 讀取使用者輸入
read -p "請輸入您的選擇 (1-3): " choice

# 使用 switch case 處理不同選項
case $choice in
    1)
        # 執行 uboot 相關操作
        echo "執行 編譯linux 操作..."
        bash ./build.sh importconfig; ./build.sh
        ;;
    2)
        # 複製檔案操作
        cp $ITB_FILE /mnt/hgfs/share/.
        echo "檔案複製完成 ($ITB_FILE)."
        ;;
    3)
        # 離開腳本
        echo "離開腳本..."
        exit 0
        ;;
    *)
        # 處理無效輸入
        echo "無效的選擇，請重新輸入."
        ;;
esac
