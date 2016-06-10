defmodule SystemetAPI.Model do
  import Ecto.Query
  alias SystemetAPI.Repo
  alias SystemetAPI.Product

  def getProductsByName name, limit do
    limit = case limit do
            nil -> 10
            _ -> limit
    end

    query = from p in Product,
      select: {p.nr, p.name},
      where: (like p.name, ^"%#{name}%"),
      limit: ^limit

    products = Repo.all query
    Enum.map products, fn {nr, x} -> %{nr: nr, name: x} end
  end
end
