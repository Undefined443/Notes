# Annoying Things

## Mac 右键菜单中出现多个 Edge 版本

```sh
cd "/Applications/Microsoft Edge.app/Contents/Frameworks/Microsoft Edge Framework.framework/Versions"
ls
rm -rf <old_version>

cd ~/"Library/Application Support/Microsoft/EdgeUpdater/apps/msedge-stable"
ls
rm -rf <old_version>

sudo shutdown -r now
```

> 如何查找软件位置： > 系统信息(⌥) > 应用程序(系统设置 > 通用 > 关于本机 > 系统报告 > 应用程序)