# homebrew-mac-new-file

Homebrew tap for [mac-new-file](https://github.com/yechaozheng2-dotcom/mac-new-file) — 在 macOS Finder 右键菜单添加「新建文件」快捷操作。

## 安装

```bash
brew tap mwpl2012/mac-new-file
brew install --cask mac-new-file
```

安装后需在 **系统设置 → 键盘 → 键盘快捷键 → 服务** 中勾选「新建文件 / New File」。

## 升级

```bash
brew upgrade --cask mac-new-file
```

## 卸载

```bash
brew uninstall --cask mac-new-file
```

卸载会自动删除 `~/Library/Services/NewFile.workflow`。
