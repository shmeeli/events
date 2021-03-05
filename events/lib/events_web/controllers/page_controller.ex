defmodule EventsWeb.PageController do
  use EventsWeb, :controller

  alias Events.Happenings

  def index(conn, _params) do
    events = Happenings.list_happening()
    render(conn, "index.html", events: events)
  end
end
