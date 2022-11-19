defmodule Derm.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :dob, :date
    field :name, :string
    field :sex, Ecto.Enum, values: [:female, :male]
    field :ssn, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:name, :dob, :ssn, :sex])
    |> validate_required([:name, :dob, :ssn, :sex])
  end
end
