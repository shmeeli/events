defmodule Events.Happenings.Happening do
  use Ecto.Schema
  import Ecto.Changeset

  schema "happening" do
    field :date, :string
    field :desc, :string
    field :name, :string
    field :username, :string
    belongs_to :user, Events.Users.User
    has_many :comments, Events.Comments.Comment, on_delete: :nothing

    timestamps()
  end

  @doc false
  def changeset(happening, attrs) do
    happening
    |> cast(attrs, [:name, :date, :desc, :user_id, :username])
    |> validate_required([:name, :date, :desc, :user_id, :username])
  end
end
