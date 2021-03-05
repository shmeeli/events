defmodule Events.Happenings.Happening do
  use Ecto.Schema
  import Ecto.Changeset

  schema "happening" do
    field :date, :string
    field :desc, :string
    field :name, :string
    #belongs_to :user, Events.Users.User

    timestamps()
  end

  @doc false
  def changeset(happening, attrs) do
    happening
    |> cast(attrs, [:name, :date, :desc])
    |> validate_required([:name, :date, :desc])
  end
end
