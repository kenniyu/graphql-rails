class Post < ApplicationRecord
  belongs_to :user

  def self.resolve_create(inputs, ctx)
    user = ctx[:current_user]
    return { errors: 'User not found' } if user.nil?

    posts = user.posts
    new_post = posts.build(user_id: inputs[:userId], title: inputs[:title], content: inputs[:content])
    if new_post.save
      { post: new_post }
    else
      { errors: new_post.errors.to_a }
    end
  end

  def self.resolve_update(inputs, ctx)
    user = ctx[:current_user]
    return { errors: 'User not found' } if user.nil?

    post = Post.find_by(id: inputs[:id])
    return { errors: 'Post not found' } if post.nil?

    return { errors: 'You are not the owner of this post' } if post.user != ctx[:current_user]

    valid_inputs = ActiveSupport::HashWithIndifferentAccess.new(inputs.instance_variable_get(:@original_values).select { |k, _|
      post.respond_to? "#{k}=".underscore
    }).except(:id)

    if post.update_attributes(valid_inputs)
      { post: post }
    else
      { errors: post.errors.to_a }
    end
  end
end
