# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mthomps4.Repo.insert!(%Mthomps4.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mthomps4.Blog
require Logger

tagNames = [
  "Woodworking",
  "Leadership",
  "Growth",
  "Reflection",
  "Databases",
  "AWS",
  "GraphQL",
  "Elixir/Phoenix",
  "JavaScript",
  "Typescript",
  "React",
  "NextJS",
  "Deployments",
  "Up and Running"
]

Enum.each(tagNames, fn name ->
  with {:ok, _tag} <- Blog.create_tag(%{name: name}) do
    :ok
  else
    e ->
      Logger.error("unable to create Tag", error: IO.inspect(e))
      raise "Unable to create Tag"
  end
end)

posts = [
  %{
    title: "Software Development a Woodworkers Perspective",
    published_on: Date.from_iso8601!("2019-01-01"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-01-01-software-development-a-woodworkers-perspective/2019-01-01-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 1: Planning and Preparation",
    published_on: Date.from_iso8601!("2019-01-14"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-01-14-software-development-a-woodworkers-perspective/2019-01-14-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 2: Use Your Resources",
    published_on: Date.from_iso8601!("2019-02-15"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-02-15-software-development-a-woodworkers-perspective/2019-02-15-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 3: Every Cut Counts",
    published_on: Date.from_iso8601!("2019-03-01"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-03-01-software-development-a-woodworkers-perspective/2019-03-01-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 4: Don't Be A Hero",
    published_on: Date.from_iso8601!("2019-03-15"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-03-15-software-development-a-woodworkers-perspective/2019-03-15-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 5: Make It A Habit",
    published_on: Date.from_iso8601!("2019-04-01"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/2019-04-01-software-development-a-woodworkers-perspective/2019-04-01-software-development-a-woodworkers-perspective.md"
  },
  %{
    title: "GraphQL the Dev Edition",
    published_on: Date.from_iso8601!("2019-09-26"),
    tags: Blog.tags_by_list_of_name(["GraphQL"]),
    file_path:
      "priv/static/posts/2019-09-26-graphql-the-dev-edition/2019-09-26-graphql-the-dev-edition.md"
  },
  %{
    title: "Rolling Your Team RPG Style",
    published_on: Date.from_iso8601!("2019-10-21"),
    tags: Blog.tags_by_list_of_name(["Leadership", "Growth"]),
    file_path:
      "priv/static/posts/2019-10-21-rolling-your-team-rpg-style/2019-10-21-rolling-your-team-rpg-style.md"
  },
  %{
    title: "Up and Running: Zeit and Now",
    published_on: Date.from_iso8601!("2019-12-01"),
    tags: Blog.tags_by_list_of_name(["Up and Running", "Deployment"]),
    file_path:
      "priv/static/posts/2019-12-01-up-and-running-zeit-and-now/2019-12-01-up-and-running-zeit-and-now.md"
  },
  %{
    title: "Up and Running: Next and TypeORM",
    published_on: Date.from_iso8601!("2019-12-15"),
    tags: Blog.tags_by_list_of_name(["Up and Running", "NextJS", "Databases"]),
    file_path:
      "priv/static/posts/2019-12-15-up-and-running-next-and-typeorm/2019-12-15-up-and-running-next-and-typeorm.md"
  },
  %{
    title: "Remote Workers: Help Your Neighbor",
    tags: Blog.tags_by_list_of_name(["Growth", "Reflection"]),
    published_on: Date.from_iso8601!("2020-03-17"),
    file_path:
      "priv/static/posts/2020-03-17-remote-workers-help-your-neighbor/2020-03-17-remote-workers-help-your-neighbor.md"
  },
  %{
    title: "Hyper Focused -> Hyper Productive",
    tags: Blog.tags_by_list_of_name(["Growth", "Leadership", "Reflection"]),
    published_on: Date.from_iso8601!("2020-04-28"),
    file_path:
      "priv/static/posts/2020-04-28-hyper-focused-hyper-productive/2020-04-28-hyper-focues-hyper-productive.md"
  }
]

Enum.each(posts, fn post ->
  with {:ok, post} <- Blog.create_post(post) do
    :ok
  else
    e ->
      Logger.error("unable to create Post", error: IO.inspect(e))
      raise "Unable to create Post"
  end
end)
