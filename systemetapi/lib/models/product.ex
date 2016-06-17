defmodule SystemetAPI.Product do
  @derive {Poison.Encoder, only: [
    :nr, :name, :name_2, :price_vat, :volume_in_ml, :price_per_liter, :product_group, :sale_start,
    :package, :origin, :country, :producer, :supplier, :vintage_year, :abv, :assortment, :ecologic,
    :ethical, :koscher, :raw_material_description
  ]}
  use Ecto.Model

  schema "products" do
    field :nr, :integer
    field :name, :string
    field :name_2, :string
    field :price_vat, :float, default: 0.0
    field :volume_in_ml, :integer, default: 0
    field :price_per_liter, :float, default: 0.0
    field :sale_start, :string
    field :product_group, :string
    field :package, :string
    field :origin, :string
    field :country, :string
    field :producer, :string
    field :supplier, :string
    field :vintage_year, :integer, default: 0
    field :abv, :string
    field :assortment, :string
    field :ecologic, :boolean
    field :ethical, :boolean
    field :koscher, :boolean
    field :raw_material_description, :string
  end
end
