defmodule Abodroc.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :full_name, :string
      add :address, :string
      add :age, :integer
      add :phone, :string
      add :dni, :string
      add :question1, :boolean, default: false, null: false
      add :question2, :boolean, default: false, null: false
      add :question3, :boolean, default: false, null: false
      add :question4, :boolean, default: false, null: false
      add :question5, :boolean, default: false, null: false
      add :question6, :boolean, default: false, null: false

      timestamps()
    end

  end
end
