defmodule Httpserver.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    # get request to localhost:8000
    conn |> send_resp(200, "Home route")
  end

  get "/:param" do
    conn |> send_resp(200, "Current route: /#{conn.params["param"]}")
  end

  match _ do
    # default response
    conn |> send_resp(404, "Route not found")
  end
end
