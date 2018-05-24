defmodule Agala.Provider.Whatsapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :agala_whatsapp,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :agala]
    ]
  end

  defp deps do
    [
      {:amqp, "~> 1.0"},
      {:agala, "~> 2.0"},
      {:ex_doc, "~> 0.16", only: :dev},
      {:inch_ex,"~> 0.5", only: :docs},
      {:credo, "~> 0.8", only: [:dev, :test]}
    ]
  end

  defp description do
    """
    Whatsapp provider for Agala framework.
    """
  end

  defp package do
    [
      maintainers: ["Dmitry Rubinstein", "Yaroslav Zemlyanuhin"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/agalaframework/agala_whatsapp"},
      files: ~w(mix.exs README* CHANGELOG* lib)
    ]
  end
end
