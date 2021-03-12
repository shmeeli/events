# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Events.Repo.insert!(%Events.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Events.Repo
alias Events.Users.User
alias Events.Happenings.Happening

#eli = Repo.insert!(%User{name: "Eli Frank", email: "elifrank1818@gmail.com"})

#Repo.insert!(%Happening{user_id: eli.id, name: "event1", date: "1/1/21", desc: "cool desc"})
