defmodule SveltePhoenixWeb.PageController do
  use SveltePhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
