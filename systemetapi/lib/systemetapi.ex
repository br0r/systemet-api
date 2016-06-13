defmodule SystemetAPI.Starter do
  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http SystemetAPI.Router, [], port: 4001
  end
end

defmodule SystemetAPI do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(SystemetAPI.Repo, []),
      # Define workers and child supervisors to be supervised
      worker(SystemetAPI.Starter, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SystemetAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
