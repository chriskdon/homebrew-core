class Bandit < Formula
  include Language::Python::Virtualenv

  desc "Security-oriented static analyser for Python code"
  homepage "https://github.com/PyCQA/bandit"
  url "https://files.pythonhosted.org/packages/5e/67/997278e785edf155bd57163ae7030f979a0907857365cb30815d93b5354b/bandit-1.7.5.tar.gz"
  sha256 "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197e54e0389dd59e11e"
  license "Apache-2.0"
  revision 5
  head "https://github.com/PyCQA/bandit.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "99db09e424e18a339a3c1494c1a9ca21bf5965c33dd8adf3d75db38cace61252"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "179af6afa5976ed202d573ef6e503c35885fd2892ae1257df2dc901d587300ea"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5fb548f724583650247870727893047b1fb90111500d8e302802725162557506"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e6eb7bf83b4e5fa6aa765bda6b91b14a8c28bf01458a8670d3cfa53d21aa9e00"
    sha256 cellar: :any_skip_relocation, sonoma:         "553aafd65d7dc023af22d1e31e439b76a311443d7e7682899511f70288bc961d"
    sha256 cellar: :any_skip_relocation, ventura:        "a8b04adb67f5bd0856e5cf0d8ee523a48037613673eb5234bd56d0fd24657f93"
    sha256 cellar: :any_skip_relocation, monterey:       "b1a1b3ac0f880c5664d2ac13112b58a1462409ba28af4e5f3c0e4d60e9dd2fb5"
    sha256 cellar: :any_skip_relocation, big_sur:        "0c6de25b35fd39fb04ed1683731f5074a5753de4b158e25b099fc53d72ab39ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e169be9d32de17687809c91b68f4ef9f85066dd1c0a95e57e5c010268a01ed7a"
  end

  depends_on "pygments"
  depends_on "python@3.11"
  depends_on "pyyaml"

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/4b/47/dc98f3d5d48aa815770e31490893b92c5f1cd6c6cf28dd3a8ae0efffac14/gitdb-4.0.10.tar.gz"
    sha256 "6eb990b69df4e15bad899ea868dc46572c3f75339735663b81de79b06f17eb9a"
  end

  resource "gitpython" do
    url "https://files.pythonhosted.org/packages/c6/33/5e633d3a8b3dbec3696415960ed30f6718ed04ef423ce0fbc6512a92fa9a/GitPython-3.1.37.tar.gz"
    sha256 "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pbr" do
    url "https://files.pythonhosted.org/packages/02/d8/acee75603f31e27c51134a858e0dea28d321770c5eedb9d1d673eb7d3817/pbr-5.11.1.tar.gz"
    sha256 "aefc51675b0b533d56bb5fd1c8c6c0522fe31896679882e1c4c63d5e4a0fccb3"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b1/0e/e5aa3ab6857a16dadac7a970b2e1af21ddf23f03c99248db2c01082090a3/rich-13.6.0.tar.gz"
    sha256 "5c14d22737e6d5084ef4771b62d5d4363165b403455a30a1c8ca39dc7b644bef"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/88/04/b5bf6d21dc4041000ccba7eb17dd3055feb237e7ffc2c20d3fae3af62baa/smmap-5.0.1.tar.gz"
    sha256 "dceeb6c0028fdb6734471eb07c0cd2aae706ccaecab45965ee83f11c8d3b1f62"
  end

  resource "stevedore" do
    url "https://files.pythonhosted.org/packages/ac/d6/77387d3fc81f07bc8877e6f29507bd7943569093583b0a07b28cfa286780/stevedore-5.1.0.tar.gz"
    sha256 "a54534acf9b89bc7ed264807013b505bf07f74dbe4bcfa37d32bd063870b087c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"test.py").write "assert True\n"
    output = JSON.parse shell_output("#{bin}/bandit -q -f json test.py", 1)
    assert_equal output["results"][0]["test_id"], "B101"
  end
end
