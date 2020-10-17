class GitRedate < Formula
  desc "Change dates of git commits"
  homepage "https://github.com/dfang/git-redate"
  url "https://github.com/dfang/git-redate/archive/0.2.tar.gz"
  version "0.2"
  sha256 "b148a15a7e9d2c6584f7be0d20fb83af312cb7951a8603cc818df5b76a1878a3"

  def install
    bin.install "git-redate"
  end
end
