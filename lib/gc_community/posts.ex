defmodule GcCommunity.Posts do

  alias GcCommunity.Repo
  alias GcCommunity.Posts.Post

  def save(post_params) do
    %Post{}
    |> Post.changeset(post_params)
    |> Repo.insert()
  end

end
