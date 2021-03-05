defmodule Events.Repo.Migrations.CreateHappening do
  use Ecto.Migration

  def change do
    create table(:happening) do
      #add :user_id, references(:users)
      add :name, :text, null: false
      add :date, :text, null: false
      add :desc, :text, null: false

      timestamps()
    end

  end
end
