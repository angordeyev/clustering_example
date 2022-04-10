defmodule TestingWeb.MockService do
  use ExUnit.CaseTemplate

  setup do
    IO.puts "hhhhh"
    Mox.stub_with(MockService, WorldService)

    :ok
  end
end