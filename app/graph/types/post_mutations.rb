module PostMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreatePost"

    # Define input parameters
    input_field :title, !types.String
    input_field :content, !types.String

    # Define return parameters
    return_field :post, PostType
    return_field :errors, types.String

    resolve -> (object, inputs, ctx) {
      Post.resolve_create(inputs, ctx)
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdatePost"

    # Define input parameters
    input_field :id, !types.ID
    input_field :title, types.String

    # Define return parameters
    return_field :post, PostType
    return_field :errors, types.String

    resolve -> (object, inputs, ctx) {
      Post.resolve_update(inputs, ctx)
    }
  end
end
