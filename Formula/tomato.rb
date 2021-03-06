class Tomato < Formula
  desc "Set Slack status and availability from the command line"
  homepage "https://github.com/rustamyusupov/tomato"
  url "https://github.com/rustamyusupov/tomato/archive/v0.2.1.tar.gz"
  sha256 "f254ec5e42645a49a017fa11dc39b44df6b608646658858996ee2d8e758e57f7"

  depends_on "erlang"
  depends_on "rebar" => :build
  depends_on "elixir" => :build

  def install
    system "mix local.hex --force"
    system "mix local.rebar --force"
    system "mix deps.get"
    system "mix escript.build"
  
    bin.install "tomato"
  end

  test do
    system "tomato -h"
  end
end