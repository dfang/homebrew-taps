class Naiveproxy < Formula
  desc "NaiveProxy"
  homepage "https://github.com/klzgrad/naiveproxy"
  url "https://github.com/klzgrad/naiveproxy/releases/download/v87.0.4280.66-1/naiveproxy-v87.0.4280.66-1-osx.tar.xz"
  version "87.0.4280.66"
  sha256 "0bec0c96f9118960d57d087f63a26682b902968e2eeb96e379ae8635418f9523"
  head "https://github.com/klzgrad/naiveproxy.git"

  # depends_on "cmake" => :build

  def install
    bin.install "naive"
  end

  def caveats
    <<~EOS

you might want to config like this (~/.config/naive/config.json):
        
mkdir -p ~/.config/naive
cat <<EOF | tee ~/.config/naive/config.json
  {
    "listen": "socks://127.0.0.1:1080",
    "proxy": "https://user:password@your.domain",
    "log": ""
  }
EOF
    EOS
  end
  
  plist_options :manual => "naive #{ENV["HOME"]}/.config/naive/config.json"

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
        <string>#{bin}/naive</string>
        <string>-d</string>
        <string>#{ENV["HOME"]}/.config/naive/config.json</string>
      </array>
      <key>StandardErrorPath</key>
      <string>/usr/local/var/log/naive.log</string>
      <key>StandardOutPath</key>
      <string>/usr/local/var/log/naive.log</string>
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
    system "#{bin}/naive", "--version"
  end
end
