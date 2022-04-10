defmodule HelloGraphqlWeb.SchemaTest do
  use HelloGraphqlWeb.ConnCase

  @query """
  {
    allLinks(inputs: {arg1: "hello", arg2: "world"}) {
      id,
      description
    }
  }
  """
  test "Simple test" do
    IO.puts "============"

    response = get(build_conn(), "/graphiql", query: @query)
    result = %{
      "data" => %{"allLinks" => [%{"description" => "text", "id" => "1"}]}
    }

    assert result == json_response(response, 200)

  end
end