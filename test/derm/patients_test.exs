defmodule Derm.PatientsTest do
  use Derm.DataCase

  alias Derm.Patients

  describe "patients" do
    alias Derm.Patients.Patient

    import Derm.PatientsFixtures

    @invalid_attrs %{dob: nil, name: nil, sex: nil, ssn: nil}

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Patients.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Patients.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{dob: ~D[2022-11-18], name: "some name", sex: :female, ssn: "some ssn"}

      assert {:ok, %Patient{} = patient} = Patients.create_patient(valid_attrs)
      assert patient.dob == ~D[2022-11-18]
      assert patient.name == "some name"
      assert patient.sex == :female
      assert patient.ssn == "some ssn"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patients.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()

      update_attrs = %{
        dob: ~D[2022-11-19],
        name: "some updated name",
        sex: :male,
        ssn: "some updated ssn"
      }

      assert {:ok, %Patient{} = patient} = Patients.update_patient(patient, update_attrs)
      assert patient.dob == ~D[2022-11-19]
      assert patient.name == "some updated name"
      assert patient.sex == :male
      assert patient.ssn == "some updated ssn"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Patients.update_patient(patient, @invalid_attrs)
      assert patient == Patients.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Patients.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Patients.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Patients.change_patient(patient)
    end
  end
end
