defmodule Bastion do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Bastion.Server, [System.get_env("PORT")])
    ]

    opts = [strategy: :one_for_one, name: Bastion.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
