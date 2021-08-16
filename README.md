# UECda-2021 コンピュータ大貧民大会 C言語版開発キットの開発環境と動作環境の構築

Vagrantを使って、UECda-2021 コンピュータ大貧民大会のC言語版開発キットをUbuntu 16.04にインストールします。

## 事前準備

前もって
[VirtualBox](https://www.virtualbox.org/)と
[Vagrant](https://www.vagrantup.com/)をインストールしておきます。

## 仮想環境の構築手順 

適当なディレクトリで以下の手順を実行します。

```
$ git clone https://github.com/tetsuya-suzuki/daihinmin-dev-env
$ cd daihinmin-dev-env
$ ls
README.md Vagrantfile bootstrap.sh
$ vagrant up
```

C言語版開発キットはゲストOSのディレクトリ /home/vagrant/work (~/work)  配下に展開され、コンパイルされます。
コンパイル前にサーバのファイル(ゲストOSの ~/work/tndhm_devkit_c-20180826/server/src/tndhms.cfg)が変更されます。変更内容はbootstrap.sh内のヒアドキュメントを参照してください。

開発キットのソースファイルとコンパイル結果は、ホストOSのディレクトリ daihinmin-dev-env/work (Vagrantfileを配置したディレクトリのサブディレクトリwork) 配下からも参照できます。そのディレクトリは最初の `vagrant up` の実行時に自動的に作成されます。

つまり、サーバやクライアントのソースファイルの編集にはホストOSの使い慣れたツールを使い、コンパイルと実行はゲストOSで行うこともできます。

## サーバの起動

下記の手順でサーバはクライアントからの接続を待ちます。５つのクライアントが接続するとゲームが開始します。
ゲームの経過は端末に表示されます。GUIのウィンドウは開きません。

仮想マシンにログインしていなければ、まず下記の手順でログインします。

```
$ vagrant ssh
```

次に下記の手順でサーバを起動します。
```
$ cd ~/work/tndhm_devkit_c-20180826/server/src
$ ./tndhms
```

## クライアントの起動

サーバを起動してから下記のように５つのクライアントを起動するとゲームが開始します。

仮想マシンにログインしていなければ、まず下記の手順でログインします。

```
$ vagrant ssh
```

次に下記の手順でクライアントを起動します。

```
$ cd ~/work/tndhm_devkit_c-20180826/client
$ ./client -n 1 &
$ ./client -n 2 &
$ ./client -n 3 &
$ ./client -n 4 &
$ ./client -n 5 &
```

## サーバの再コンパイル

もし必要ならば下記の手順でサーバを再コンパイルできます。

仮想マシンにログインしていなければ、まず下記の手順でログインします。

```
$ vagrant ssh
```

次に下記の手順でコンパイルします。

```
$ cd ~/work/tndhm_devkit_c-20180826/server/
$ ./configure
$ make
```

## クライアントの再コンパイル

もし必要ならば下記の手順でクライアントを再コンパイルできます。

仮想マシンにログインしていなければ、まず下記の手順でログインします。

```
$ vagrant ssh
```

次に下記の手順でコンパイルします。

```
$ cd ~/work/tndhm_devkit_c-20180826/client/
$ ./configure
$ make
```



