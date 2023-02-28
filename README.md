# nvim lua 配置文档
```bash
https://neovim.io/doc/user/lua-guide.html

```
# 仓库源地址
```bash
B站: https://github.com/dansoncut/Neovim-Configuration-Tutorial
https://www.bilibili.com/video/BV1Td4y1578E/?spm_id_from=333.337.search-card.all.click&vd_source=14ad646cfd8b4b739f9cca206f57be2e
```

# coc-vim安装的插件
```json
{
  "dependencies": {
    "coc-cmake": ">=0.2.1",
    "coc-git": ">=2.6.1",
    "coc-highlight": ">=2.0.4",
    "coc-json": ">=1.8.0",
    "coc-yaml": ">=1.9.0",
    "coc-sh": ">=1.0.2",
    "coc-java": ">=1.14.1",
    "coc-go": ">=1.3.7",
    "coc-snippets": ">=3.1.6",
    "coc-clangd": ">=0.28.0",
    "coc-vimlsp": ">=0.13.0",
    "coc-syntax": ">=1.2.4",
    "coc-pairs": ">=1.4.2",
    "coc-jedi": ">=0.35.0",
    "coc-pyright": ">=1.1.295"
  }
}
```

# clangd 安装, language server以支持coc-clangd
```bash
#安装clang https://blog.csdn.net/u012804784/article/details/125734745
git clone -b llvmorg-14.0.6 --depth 1 https://github.com/llvm/llvm-project.git

cd llvm-project
mkdir _build
cd _build

# llvm install path, such as /usr/local/llvm
LLVM_PREFIX=$HOME/Apps/llvm-14.0.6

cmake -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=$LLVM_PREFIX \
-DLLVM_ENABLE_PROJECTS=clang \
-DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
-DLIBCXX_ENABLE_INCOMPLETE_FEATURES=ON \
../llvm

make -j`nproc`
make install

sudo ln -s $LLVM_PREFIX /usr/local/llvm

cat <<-EOF >> ~/.bashrc
# llvm
export LLVM_HOME=/usr/local/llvm
export PATH=$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_HOME/lib/x86_64-unknown-linux-gnu:$LD_LIBRARY_PATH
EOF

llvm-config --version
clang --version


#glibc2.18 NOT FOUND解决
1、下载文件
下载地址：wget https://mirrors.tuna.tsinghua.edu.cn/gnu/glibc/glibc-2.18.tar.gz

2、安装部署
解压
tar -zxvf  glibc-2.18.tar.gz

创建编译目录
cd glibc-2.18 
mkdir build

编译、安装
cd build/
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin

make -j 8
make install



```

# 生成compile_commands.json才能补全
## bazel项目
```bash
git clone https://github.com/vincent-picaud/Bazel_and_CompileCommands.git
cd MyProject
~/Bazel_and_CompileCommands/setup_compile_commands.sh
~/Bazel_and_CompileCommands/create_compile_commands.sh {MyProjectTarget}
```

# 版本
```bash
nvim --version
NVIM v0.9.0-dev-fae7540
Build type: Release
LuaJIT 2.1.0-beta3

lua -v
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio

clang --version
clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/llvm/bin

 ~/.config/coc/extensions/coc-clangd-data/install/15.0.6/clangd_15.0.6/bin/clangd -version
clangd version 15.0.6 (https://github.com/llvm/llvm-project 088f33605d8a61ff519c580a71b1dd57d16a03f8)
Features: linux+grpc
Platform: x86_64-unknown-linux-gnu

python3.10
```
