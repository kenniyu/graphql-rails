MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # Add the mutation's derived field to the mutation type
  field :createPost, field: PostMutations::Create.field
  field :updatePost, field: PostMutations::Update.field
end
