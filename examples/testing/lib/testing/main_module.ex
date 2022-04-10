defmodule ServiceBehaviour do
   @callback call() :: :string
end

defmodule WorldService do
  @behaviour ServiceBehaviour
  def call() do
    IO.puts "WorldService.call called"
    "world"
  end 
end

defmodule MainModule do
  def hello do
    IO.puts "MainModule.hello called"
    "Hello #{service().call}"
  end

  defp service() do
    Application.get_env(:testing, :service)
  end
end