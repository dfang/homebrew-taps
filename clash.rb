class Clash < Formula
  desc "A rule-based tunnel in Go."
  homepage "https://github.com/Dreamacro/clash"
  url "https://github.com/Dreamacro/clash/releases/download/v1.3.0/clash-darwin-amd64-v1.3.0.gz"
  version "v1.3.0"
  sha256 "ce72b9d5440585d48c5ec6b6888420a92196e3e5e24c32c6fdc52793987a8038"
  head "https://github.com/Dreamacro/clash.git"

  # depends_on "cmake" => :build

  def install
    bin.install "clash-darwin-amd64" => "clash"
  end

  plist_options :manual => "clash -d #{ENV["HOME"]}/.config/clash/"

  def plist; <<~EOS
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>RunAtLoad</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/clash</string>
        <string>-d</string>
        <string>#{ENV["HOME"]}/.config/clash/</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/usr/local/var/log/clash.log</string>
      <key>StandardOutPath</key>
      <string>/usr/local/var/log/clash.log</string>
    </dict>
  </plist>
  EOS
  end


  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test v2ray-core`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/clash", "-v"
  end
end
