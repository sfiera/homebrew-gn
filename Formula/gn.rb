class Gn < Formula
  desc "Meta-build system that generates build files for Ninja"
  homepage "https://github.com/sfiera/gn"
  url "https://github.com/sfiera/gn/releases/download/0.0.1792/gn-0.0.1792.tar.gz"
  sha256 "1b2383128125fee4f79f549a91fd65782adbe3a89cdb793ec3069403b24388bd"
  head "https://github.com/sfiera/gn.git"

  bottle do
    root_url "https://github.com/sfiera/homebrew-gn/releases/download/v0.0.1792/"
    sha256 cellar: :any_skip_relocation, catalina: "198134b89a03a7fe0c6a3af6997af07768ca0064d6e519ca18370f58ef66c584"
  end

  depends_on "ninja" => :build

  def install
    system "python3", "build/gen.py"
    system "ninja", "-C", "out"

    bin.install "out/gn"
  end

  test do
    system "out/gn_unittests"
  end
end
