class GitRedate < Formula
  desc "Change dates of git commits"
  homepage "https://github.com/dfang/git-redate"
  url "https://github.com/dfang/git-redate/archive/0.1.tar.gz"
  version "0.1"
  sha256 "970f07bb369211e0b366e07a07fac7a872a70d10"

  def install
    bin.install "git-redate"
  end
end
