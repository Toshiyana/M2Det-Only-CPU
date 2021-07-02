# Implementation M2Det using CPU
## pythonバージョン（試したもの）
* Python 3.7.10 (mac + conda)
* Python 3.6.9 (docker)

## 検証環境
* mac + conda
* docker

## パターン1: anacondaによる環境構築
1. anacondaでpythonの仮想環境を作る(pythonのバージョンは3.7)

2. requirements.txtから必要なライブラリをインストール
```
pip install -r requirements.txt
```

3. m2detのdemo.pyを実行
```
python demo.py -c=configs/m2det512_vgg.py -m=weights/m2det512_vgg.pth --show
```

## パターン2: dockerによる環境構築
dockerとは何かを理解したい方は以下を参照。（理解できていなくても問題ないです）
https://knowledge.sakura.ad.jp/13265/


コマンドを実行する前にdockerという仮想環境を作るtoolをダウンロード。以下が参考になるかも。
* Mac: https://qiita.com/kurkuru/items/127fa99ef5b2f0288b81
* Windows: https://sukkiri.jp/technologies/virtualizers/docker/docker-win_install.html


ダウンロード後、以下のコマンドを順に実行。

コンテナ=仮想環境。

1. イメージのビルド及びコンテナの作成

```
docker-compose up -d --build
```

m2detの実行に必要なライブラリはDockerfileに記述済みなので、上記のコマンドで自動的にインストールされる。
実行し終わるまでに、結構時間かかる。


2. コンテナに入る
```
docker-compose exec python3 bash
```

3. m2detのdemo.pyを実行
```
python demo.py -c=configs/m2det512_vgg.py -m=weights/m2det512_vgg.pth --show
```

### 注意
demo.py実行時に、途中でKilledと出力された場合、dockerの設定からresourceのmemoryを2GBから8GBぐらいに増やす。

### docker補足コマンド
* コンテナから抜ける
```
exit
```

* コンテナの停止
```
docker-compose stop
```

* コンテナの停止かつ削除
```
docker-compose down
```

* コンテナの起動
```
docker start [コンテナ名 or コンテナID]
```

* イメージの削除
```
docker rmi [イメージID]
```

* コンテナの削除
```
docker rm [コンテナID]
```

## CPU利用のために修正したファイル
* utils/build.py
* utils/num_wrapper.py
* utils/core.py
* demo.py

# 参考
* https://qiita.com/mnishiki/items/410ae36272e7ad6c6ee6