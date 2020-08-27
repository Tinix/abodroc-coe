defmodule Abodroc.ClientsTest do
  use Abodroc.DataCase

  alias Abodroc.Clients

  describe "clients" do
    alias Abodroc.Clients.Client

    @valid_attrs %{address: "some address", age: 42, dni: "some dni", full_name: "some full_name", phone: "some phone", question1: true, question2: true, question3: true, question4: true, question5: true, question6: true}
    @update_attrs %{address: "some updated address", age: 43, dni: "some updated dni", full_name: "some updated full_name", phone: "some updated phone", question1: false, question2: false, question3: false, question4: false, question5: false, question6: false}
    @invalid_attrs %{address: nil, age: nil, dni: nil, full_name: nil, phone: nil, question1: nil, question2: nil, question3: nil, question4: nil, question5: nil, question6: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clients.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Clients.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Clients.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Clients.create_client(@valid_attrs)
      assert client.address == "some address"
      assert client.age == 42
      assert client.dni == "some dni"
      assert client.full_name == "some full_name"
      assert client.phone == "some phone"
      assert client.question1 == true
      assert client.question2 == true
      assert client.question3 == true
      assert client.question4 == true
      assert client.question5 == true
      assert client.question6 == true
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clients.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, %Client{} = client} = Clients.update_client(client, @update_attrs)
      assert client.address == "some updated address"
      assert client.age == 43
      assert client.dni == "some updated dni"
      assert client.full_name == "some updated full_name"
      assert client.phone == "some updated phone"
      assert client.question1 == false
      assert client.question2 == false
      assert client.question3 == false
      assert client.question4 == false
      assert client.question5 == false
      assert client.question6 == false
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Clients.update_client(client, @invalid_attrs)
      assert client == Clients.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Clients.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Clients.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Clients.change_client(client)
    end
  end
end
