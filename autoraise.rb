class Autoraise < Formula
  desc "Focus-follows-mouse for MacOS"
  homepage "https://github.com/alin23/AutoRaise"
  version "3.1"
  url "https://github.com/alin23/AutoRaise/archive/refs/tags/v#{version}.tar.gz"
  sha256 "cd76bd5cde1f0694a94d3b234720b9c87171271a44868f224d7f5ac5e22335e3"
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
