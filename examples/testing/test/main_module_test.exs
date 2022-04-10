defmodule MainModuleTest do
  use ExUnit.Case, async: true
  import Mox
  #import Mock
  
  test "Hello world" do
    # MockService
    # |> expect(:call, fn() -> "world 1" end)
    #Mox.stub_with(MockService, WorldService)

    assert "Hello world" == MainModule.hello()
  end

  # test "With Mock hello World" do
  #   with_mock WorldService,
  #     [call: fn() -> "world" end] do
      
  #     assert "Hello world" == MainModule.hello()
  #   end
  # end
end