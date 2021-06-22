# Implementation M2Det using CPU
* python: 3.7.10

requirements.txtから必要なファイルをインストール
```
pip install -r requirements.txt
```

## 検証環境
* mac + condaで検証。
* dockerの環境構築はまだできていないので、中のDocker関係のファイルは無視。requirements.txtのインストール中にエラーが発生。

## CPU利用のために修正したファイル
* utils/build.py
* utils/num_wrapper.py
* utils/core.py
* demo.py
