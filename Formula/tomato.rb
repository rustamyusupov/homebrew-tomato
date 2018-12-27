class Tomato < Formula
  desc "Set Slack status and availability from the command line"
  homepage "https://github.com/rustamyusupov/tomato"
  url "https://github.com/rustamyusupov/tomato/archive/v0.1.1.tar.gz"
  sha256 "8c8e443cbf4c242dc6629172fec3a59555a26a7cb19f05e0e325de98eff24473"

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