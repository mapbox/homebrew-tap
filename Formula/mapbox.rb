class Mapbox < Formula
  desc "Command-line interface for Mapbox APIs"
  homepage "https://github.com/mapbox/mapbox-cli"
  version "0.3.0"

  MAPBOX_CLI_USER_AGENT = "mapbox-cli-tap-install/1".freeze

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "c61eace5de4918550c60aa3fcf7af7c66cdff99729b229e8d728cb443249d269"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "db337072ff4f0a07b8a28bbf1dd5aacdc90dbf2604bdbf3ca61338d4ecc6ecad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "411796a474e380099b39c689fd210e7016747a03c55a5b56997e608dbe85ba05"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "ab4165770d1210456e1880082d2611712d6a974f01e0ce819b119625a938fd81"
    end
  end

  def install
    bin.install "mapbox"

    generate_completions_from_executable(bin/"mapbox", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mapbox --version")
  end
end
