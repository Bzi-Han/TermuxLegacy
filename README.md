# TermuxLegacy

## 介绍

官方历史仓库：[https://archive.org/details/termux-repositories-legacy](https://archive.org/details/termux-repositories-legacy)

对于`Android5.0` `6.0`使用旧版Termux的一个解决方案，所有东西均可在官方历史仓库中找到。

## 注意

由于`Github`的限制，此仓库的文件不是完整的所有文件，排除的详细文件请查看`.gitignore`。

如果你是本地搭建，可在官方历史仓库中下载`termux-repositories-legacy-24.12.2019.tar`文件并解压所缺失的文件即可。

## 使用

在TermuxApp中进行以下步骤

1. 备份`sources.list`
    + `mv $PREFIX/etc/apt/sources.list $PREFIX/etc/apt/sources.list.bak`
2. 备份`game.list`
    + `mv $PREFIX/etc/apt/sources.list.d/game.list $PREFIX/etc/apt/sources.list.d/game.list.bak`
3. 备份`science.list`
    + `mv $PREFIX/etc/apt/sources.list.d/science.list $PREFIX/etc/apt/sources.list.d/science.list.bak`
4. 创建源
    + `echo "deb https://bzi-han.github.io/TermuxLegacy/termux-repositories-legacy/webroot/termux-packages stable main" > $PREFIX/etc/apt/sources.list.d/termux-legacy-main.list`
    + `echo "deb https://bzi-han.github.io/TermuxLegacy/termux-repositories-legacy/webroot/game-packages-21 games stable" > $PREFIX/etc/apt/sources.list.d/termux-legacy-game.list`
    + `echo "deb https://bzi-han.github.io/TermuxLegacy/termux-repositories-legacy/webroot/science-packages-21 science stable" > $PREFIX/etc/apt/sources.list.d/termux-legacy-science.list`
5. 更新源
    + `apt-get update && apt-get upgrade -y`

如果你有办法把`termux-usage-legacy-repositories.sh`移动到`/data/data/com.termux/files/home`或者已经有`wget`工具的情况下可以选择以下步骤(以wget为例)

1. 下载脚本到`/data/data/com.termux/files/home`
    + `wget https://bzi-han.github.io/TermuxLegacy/termux-usage-legacy-repositories.sh`
2. 添加执行权限
    + `chmod +x ./termux-usage-legacy-repositories.sh`
3. 执行脚本
    + `./termux-usage-legacy-repositories.sh`
4. 更新源
    + `apt-get update && apt-get upgrade -y`

## 本地部署使用

将此仓库`clone`或者下载到本地，使用任意的`http服务器`以仓库的目录为根目录启动服务即可。

以`python3`为例，在仓库目录执行`python -m http.server`即可启动一个简易的`http服务器`，服务地址一般为`http://ip:8000`。

服务启动好后按照上面的步骤进行即可，但需将`https://bzi-han.github.io/TermuxLegacy`替换成你的服务地址，例如：`http://192.168.1.1:8000`。

如果你使用的是`termux-usage-legacy-repositories.sh`脚本，则需要将`baseUrl`的值改为你的服务地址，然后按照上面的步骤进行，例如：`sed -i 's/https:\/\/bzi-han.github.io\/TermuxLegacy/http:\/\/192.168.1.1:8000/g' ./termux-usage-legacy-repositories.sh`