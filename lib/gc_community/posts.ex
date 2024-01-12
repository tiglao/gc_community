defmodule GcCommunity.Posts do
  import Ecto.Query, warn: false

  alias GcCommunity.Repo
  alias GcCommunity.Posts.Post

  def list_posts do
    query =
      from p in Post,
      select: p,
      order_by: [desc: :inserted_at],
      preload: [:user]

    Repo.all(query)
  end

  def save(post_params) do
    %Post{}
    |> Post.changeset(post_params)
    |> Repo.insert()
  end

  def delete_first_post do
    first_post = Repo.one(from p in Post, order_by: :inserted_at, limit: 1)

    case first_post do
      nil -> {:error, :no_posts_found}
      post -> Repo.delete(post)
    end
  end

end
