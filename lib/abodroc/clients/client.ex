defmodule Abodroc.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :address, :string
    field :age, :integer
    field :dni, :string
    field :full_name, :string
    field :phone, :string
    field :question1, :boolean, default: false
    field :question2, :boolean, default: false
    field :question3, :boolean, default: false
    field :question4, :boolean, default: false
    field :question5, :boolean, default: false
    field :question6, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:full_name, :address, :age, :phone, :dni, :question1, :question2, :question3, :question4, :question5, :question6])
    |> validate_required([:full_name, :address, :age, :phone, :dni, :question1, :question2, :question3, :question4, :question5, :question6])
  end
end
