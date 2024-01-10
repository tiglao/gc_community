defmodule GcCommunity.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias GcCommunity.Accounts.User

  schema "posts" do
    field :caption, :string
    field :image_path, :string
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:caption, :image_path])
    |> validate_required([:caption, :image_path])
    |> cast_assoc(:user)
  end
end
