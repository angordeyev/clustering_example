defmodule HelloGraphqlWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver


  object :link do
    @desc "identity"
    field :id, non_null(:id)

    @desc "English name of the language"
    field :url, non_null(:string)

    @desc "English name of the language"
    field :description, non_null(:string)
  end

  object :status do
    field :status, :string
  end

  input_object :some_args do
    field :arg1, non_null(:string)
    field :arg2, non_null(:nested_args)
  end

  input_object :nested_args do
    field :n_arg, non_null(:string)
  end

  query do
    @desc "Get all links"
    field :all_links, list_of(:link) do
      arg :inputs, non_null(:some_args)
      resolve(&NewsResolver.all_links/3)
    end

  @desc "Simple"
    field :simple, :status do
      resolve(&NewsResolver.simple/3)
    end
  end

  mutation do
    @desc "Create a new link"
    field :create_link, :link do
      arg :arg1, non_null(:string)
      arg :arg2, non_null(:string)
      resolve &NewsResolver.create_link/3
    end

    @desc "Get all links"
    field :all_links1, list_of(:link) do
      arg :inputs, non_null(:some_args)
      resolve(&NewsResolver.all_links/3)
    end

  end


end
