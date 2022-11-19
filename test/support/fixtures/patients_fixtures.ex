defmodule Derm.PatientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Derm.Patients` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        dob: ~D[2022-11-18],
        name: "some name",
        sex: :female,
        ssn: "some ssn"
      })
      |> Derm.Patients.create_patient()

    patient
  end
end
