defmodule Mthomps4Web.PostController do
  use Mthomps4Web, :controller
  alias Mthomps4.Blog
  # alias Mthomps4Web.Router.Helpers, as: Routes

  # post =
  #   "priv/static/posts/test.md"
  #   |> File.read!()

  # markdown =
  #   Earmark.as_html!(post, %Earmark.Options{
  #     code_class_prefix: "lang- language-"
  #     # smartypants: false
  #   })

  def index(conn, _params) do
    posts = Blog.list_posts()
    tags = Blog.list_tags()

    render(conn, posts: posts, tags: tags)
  end

  def show(conn, %{"id" => post_id}) do
    post = Blog.get_post!(post_id)

    # "priv/static/posts/test.md"
    content = get_file(post.file_path)

    render(conn, content: content)
  end

  defp get_file(file_path) do
    File.read(file_path)
    |> parse_file()
  end

  defp parse_file({:ok, markdown}) do
    Earmark.as_html!(markdown, %Earmark.Options{
      code_class_prefix: "lang- language-"
      # smartypants: false
    })
  end

  defp parse_file(_error), do: nil
end
