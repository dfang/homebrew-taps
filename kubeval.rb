class Kubeval < Formula
  desc "Validate your Kubernetes configuration files, supports multiple Kubernetes versions"
  homepage "https://kubeval.instrumenta.dev"
  url "https://github.com/instrumenta/kubeval/releases/download/0.15.0/kubeval-darwin-amd64.tar.gz"
  version "0.15.0"
  sha256 "f445e9a7ff30645fb3850cdbdf9031095b14d5a9e524113dad6fc76d6e11d605"

  def install
    bin.install "kubeval"
  end

  test do
    system "#{bin}/kubeval", "--version"
  end
end
