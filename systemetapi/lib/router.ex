defmodule SystemetAPI.Router do
  use Plug.Router

  require SystemetAPI.Model
  require Logger
  alias Plug.Conn

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, Poison.encode!(%{status: :ok, version: "0.1.0"}))
  end

  get "/product" do
    query = Conn.fetch_query_params conn
    params = query.params
    Logger.debug "Got params #{inspect params}"
    products = SystemetAPI.Model.getProductsByName params["name"], params["n"]
    Logger.debug "Got products #{inspect(products)}"
    send_resp(conn, 200, Poison.encode!(%{data: products}))
  end

  match _ do
    send_resp(conn, 404, "Nothing here")
  end
end
