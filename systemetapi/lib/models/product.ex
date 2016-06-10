defmodule SystemetAPI.Product do
  use Ecto.Model

  schema "products" do
    field :nr, :integer
    field :name, :string
    field :name_2, :string
    field :price_vat, :float
    field :volume_in_ml, :integer
    field :price_per_liter, :float
    field :sale_start, :string
    field :product_group, :string
    field :package, :string
    field :origin, :string
    field :country, :string
    field :producer, :string
    field :supplier, :string
    field :vintage_year, :integer
    field :ABV, :string
    field :assortment, :string
    field :ecologic, :boolean
    field :ethical, :boolean
    field :koscher, :boolean
    field :raw_material_description, :string
  end
end
