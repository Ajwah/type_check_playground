defmodule P.MixProject do
  use Mix.Project

  def project do
    [
      app: :type_check_playground,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:type_check, "~> 0.12.1"},
      {:stream_data, "~> 0.5", only: :test},
    ]
  end
end
