# TL;DR
以下のファイルを置いています.
+ エディタ
    + _atom
+ シェル
    + WindowsPowerShell
+ キーボードカスタム
    + Keyhac
    + ChgKey
+ マウスカスタム
    + ELECOM_Mouse_Driver
+ 構築用のスクリプト
    + utils

# 環境
+ Windows10
+ Macbook Pro7,1
+ 日本語キーボード

# キーカスタムについて
## 概要
+ Keyhac
    + ワンショットモディファイア
    + User0をVimマッピングの修飾キーに
    + Escapeと同時にSKKをasciiモードに
        + SKK側にショートカットを追加している(Ctrl-l)
        + AtomでのCtrl-lを無効化した
    + ディスク取り出しキーが動作しないので代替策
    + 文字キーは弄らない
        + Nキーロールオーバーではないので
    + クリップボード履歴最高!一番好きな履歴です.
+ ChangeKey
    + 修飾キーの移動
        + KeyhacだとKeyUpイベントが送出されないことがある
        + マウスジェスチャとの両立が容易
