defmodule ErlangGithub.Mixfile do
  use Mix.Project

  @version "2.0.1"

  def project do
    [
      app: :egithub,
      version: @version,
      language: :erlang,
      deps: deps(Mix.env()),
      description: "Github client for Erlang",
      package: package(),
      source_url: "https://github.com/aruki-delivery/erlang-github",
      start_permanent: Mix.env() == :prod,
      deps: deps(Mix.env()),
    ]
  end

  def application do
    [
      extra_applications: [
        :eex,
        :logger,
        :flex_logger,
        :kernel,
        :stdlib,
        :hackney,
        :jiffy,
        :lager,
        :goldrush
      ]
    ]
  end

  defp deps(_) do
    [
      {:goldrush, "~> 0.1"},
      {:lager,    "~> 3.2"},
      {:jiffy,    "~> 0.14"},
      {:hackney,  "~> 1.6"},
      {:flex_logger, "~> 0.2.1"},
      #{:elvis_shell, "~> 0.4.1", hex: :elvis, only: :dev},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:ex_unit_notifier, "~> 0.1", only: :test},
    ]
  end

  def package do
    [
      maintainers: ["aruki-delivery", "cblage"],
      licenses: ["Copyright"],
      links: %{"GitHub" => "https://github.com/aruki-delivery/erlang-github" }
    ]
  end
end
