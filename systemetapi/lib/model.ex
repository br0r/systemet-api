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
      select: %{nr: p.nr, name: p.name, name_2: p.name_2, price_vat: p.price_vat, volume_in_ml: p.volume_in_ml, price_per_liter: p.price_per_liter, ABV: p.abv},
      where: (like p.name, ^"%#{name}%"),
      limit: ^limit

    products = query |> Repo.all
    Logger.debug "Products are #{inspect products}"
    products
  end
end
