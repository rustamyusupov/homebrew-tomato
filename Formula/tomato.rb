class Tomato < Formula
  desc "Set Slack status and availability from the command line"
  homepage "https://github.com/rustamyusupov/tomato"
  url "https://github.com/rustamyusupov/tomato/archive/v0.2.0.tar.gz"
  sha256 "1a376198881892b9e644b7d01439415cf8ecabc36511934bed617751b10edab5"

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