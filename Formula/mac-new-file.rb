class MacNewFile < Formula
  desc "Add a \"New File\" Quick Action to macOS Finder's right-click menu"
  homepage "https://github.com/yechaozheng2-dotcom/mac-new-file"
  url "https://codeload.github.com/yechaozheng2-dotcom/mac-new-file/tar.gz/refs/heads/main"
  sha256 "0801b224509c4883b3814b6466f84d115db7db52ffdb6311b00573a961f5b6bc"
  version "0.1.0"
  license "MIT"

  depends_on :macos => :ventura

  def install
    prefix.install "dist/NewFile.workflow"
  end

  def post_install_steps
    services_dir = Pathname.new(Dir.home)/"Library/Services"
    services_dir.mkpath
    cp_r prefix/"NewFile.workflow", services_dir
    system "/System/Library/CoreServices/pbs", "-flush"
  end

  def caveats
    <<~EOS
      安装后请手动启用服务：
        系统设置 → 键盘 → 键盘快捷键 → 服务 → 勾选「新建文件 / New File」

      卸载时请同时删除服务文件：
        brew uninstall mac-new-file
        rm -rf ~/Library/Services/NewFile.workflow
    EOS
  end

  test do
    assert_predicate prefix/"NewFile.workflow/Contents/Info.plist", :exist?
  end
end
