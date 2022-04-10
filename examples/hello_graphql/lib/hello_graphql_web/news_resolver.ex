defmodule CommunityWeb.NewsResolver do
  alias Community.News

  def all_links(_root, _args, _info) do
    news =
      %{id: 1, url: "http://", description: "text"}
    #  %{id: 2, url: "http://", description: "text"}

    {:ok, news}
  end

  def create_link(_root, _args, _info) do
    link = %{id: 1, url: "http://", description: "text"}
    {:ok, link}
  end

  def simple(_root, _args, _info) do
    {:ok, %{status: :ok}}
  end

end
