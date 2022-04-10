Application.put_env(:testing, :service, MockService)

Mox.defmock(MockService, for: ServiceBehaviour)
Mox.stub_with(MockService, WorldService)

ExUnit.start()


