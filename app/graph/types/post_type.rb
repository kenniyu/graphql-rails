# app/graph/types/post_type.rb
PostType = GraphQL::ObjectType.define do
  # interfaces [ActiveRecordInterface]
  name "Post"
  description "A post"

  field :id, types.Int
  field :title, types.String
  field :content, types.String
end
