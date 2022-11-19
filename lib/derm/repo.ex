defmodule Derm.Repo do
  use Ecto.Repo,
    otp_app: :derm,
    adapter: Ecto.Adapters.Postgres
end
