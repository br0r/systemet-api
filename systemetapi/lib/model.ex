defmodule SystemetAPI.Model do
  require Logger
  import Ecto.Query
  alias SystemetAPI.Repo
  alias SystemetAPI.Product

  def getProductsByName name, limit do
    limit = case limit do
            nil -> 10
            _ -> limit
    end

    query = from p in Product,
      select: p,
      where: (like p.name, ^"%#{name}%"),
      limit: ^limit

    products = query |> Repo.all
    Logger.debug "Products are #{inspect products}"
    products
  end
end
