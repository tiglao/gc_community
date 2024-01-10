defmodule GcCommunity.Repo do
  use Ecto.Repo,
    otp_app: :gc_community,
    adapter: Ecto.Adapters.Postgres
end
