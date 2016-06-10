defmodule SystemetAPI.Repo do
  use Ecto.Repo,
    otp_app: :systemetapi,
    adapter: Sqlite.Ecto
end
