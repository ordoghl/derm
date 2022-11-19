defmodule Derm.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :name, :string, null: false
      add :dob, :date, null: false
      add :ssn, :string
      add :sex, :string, null: false

      timestamps()
    end
  end
end
