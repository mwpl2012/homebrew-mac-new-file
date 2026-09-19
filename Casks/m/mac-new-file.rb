cask "mac-new-file" do
  version "0.1.0"
  sha256 "0801b224509c4883b3814b6466f84d115db7db52ffdb6311b00573a961f5b6bc"

  url "https://codeload.github.com/yechaozheng2-dotcom/mac-new-file/tar.gz/refs/heads/main"
  name "mac-new-file"
  desc "Add a \"New File\" Quick Action to macOS Finder's right-click menu"
  homepage "https://github.com/yechaozheng2-dotcom/mac-new-file"

  depends_on macos: :ventura

  artifact "mac-new-file-main/dist/NewFile.workflow",
           target: "#{Dir.home}/Library/Services/NewFile.workflow"

  postflight_steps do
    run "/System/Library/CoreServices/pbs", args: ["-flush"], must_succeed: false
  end

  caveats <<~EOS
    安装后请手动启用服务：
      系统设置 → 键盘 → 键盘快捷键 → 服务 → 勾选「新建文件 / New File」

    首次使用时 macOS 会请求辅助功能权限：
      系统设置 → 隐私与安全性 → 辅助功能 → 允许 Automator
  EOS
end
