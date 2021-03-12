defmodule Events.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    #field :event_id, :id
    #field :user_id, :id
    belongs_to :user, Events.Users.User
    belongs_to :happening, Events.Happenings.Happening

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body,:happening_id,:user_id])
    |> validate_required([:body,:happening_id,:user_id])
  end
end
