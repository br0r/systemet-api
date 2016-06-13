defmodule SystemetAPI.Product do
  use Ecto.Model

  schema "products" do
    field :nr, :integer
    field :name, :string
    field :name_2, :string
    field :price_vat, :string
    field :volume_in_ml, :string
    field :price_per_liter, :string
    field :sale_start, :string
    field :product_group, :string
    field :package, :string
    field :origin, :string
    field :country, :string
    field :producer, :string
    field :supplier, :string
    field :vintage_year, :string
    field :ABV, :string
    field :assortment, :string
    field :ecologic, :boolean
    field :ethical, :boolean
    field :koscher, :boolean
    field :raw_material_description, :string
  end
end

defimpl Poison.Encoder, for: SystemetAPI.Product do
  require Logger
  def encode(model, opts) do
    model
    |> Map.take([:nr, :name, :name_2, :price_vat, :volume_in_ml, :price_per_liter, :ABV])
    |> Poison.Encoder.encode(opts)
  end
end
