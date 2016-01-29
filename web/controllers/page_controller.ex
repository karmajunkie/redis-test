defmodule RedisTest.PageController do
  use RedisTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
