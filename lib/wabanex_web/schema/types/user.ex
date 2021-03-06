defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "username"
    field :email, non_null(:string), description: "e-mail"
    field :password, non_null(:string), description: "password"
  end
end
