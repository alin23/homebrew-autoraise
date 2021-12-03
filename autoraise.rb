class Autoraise < Formula
  desc "Focus-follows-mouse for MacOS"
  homepage "https://github.com/alin23/AutoRaise"
  version "3.1"
  url "https://github.com/alin23/AutoRaise/archive/refs/tags/v#{version}.tar.gz"
  sha256 "b46da4b77b179b865d92b80af76f969fa3b80b1c357ebcd85f5e3807ab9dea50"
  license "GPL-3.0"

  head do
    url "https://github.com/alin23/AutoRaise.git"
  end

  def install
    system "make clean"
    system "make"
    bin.install "AutoRaise"
  end

  plist_options :manual => "AutoRaise"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
          <string>#{opt_bin}/AutoRaise</string>
          </array>
          <key>StandardErrorPath</key>
          <string>#{ENV["HOME"]}/Library/Logs/AutoRaise.log</string>
          <key>StandardOutPath</key>
          <string>#{ENV["HOME"]}/Library/Logs/AutoRaise.log</string>
          <key>RunAtLoad</key>
          <true/>
        </dict>
      </plist>
    EOS
  end

  test do
    system "false"
  end
end
