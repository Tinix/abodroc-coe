defmodule Abodroc.Repo do
  use Ecto.Repo,
    otp_app: :abodroc,
    adapter: Ecto.Adapters.Postgres
end
