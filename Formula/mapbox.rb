class Mapbox < Formula
  desc "Command-line interface for Mapbox APIs"
  homepage "https://github.com/mapbox/mapbox-cli"
  version "1.1.1"

  MAPBOX_CLI_USER_AGENT = "mapbox-cli-tap-install/1".freeze

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "10a3e24c6ea2407d9c247633e9104a826a3452b2d7bcb2b538212ac4ffc854a9"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "56b30d8a5b4801d2eac5376fa91a318fe2b8da377a0e3543d88bcbad66a813e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "e83e6e03e6f365cefd0935bd0e742155140e229c2c733d4a2ba0e1f6e09cba4a"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "ec2f8a1c3eb00ed318e6899ea2927f85eddbd84a6eb04e8971e79477e8ebe0c0"
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
