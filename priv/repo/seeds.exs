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
      "priv/static/posts/software_development_a_woodworkers_perspective/software_development_a_woodworkers_perspective.md"
  },
  %{
    title: "A Woodworkers Perspective Part 1: Planning and Preparation",
    published_on: Date.from_iso8601!("2019-01-14"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/software_development_a_woodworkers_perspective/part1-planning_and_preparation.md"
  },
  %{
    title: "A Woodworkers Perspective Part 2: Use Your Resources",
    published_on: Date.from_iso8601!("2019-02-15"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/software_development_a_woodworkers_perspective/part2-use_your_resources.md"
  },
  %{
    title: "A Woodworkers Perspective Part 3: Every Cut Counts",
    published_on: Date.from_iso8601!("2019-03-01"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/software_development_a_woodworkers_perspective/part3-every-cut-counts.md"
  },
  %{
    title: "A Woodworkers Perspective Part 4: Don't Be A Hero",
    published_on: Date.from_iso8601!("2019-03-15"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/software_development_a_woodworkers_perspective/part4-don't_be_a_hero.md"
  },
  %{
    title: "A Woodworkers Perspective Part 5: Make It A Habit",
    published_on: Date.from_iso8601!("2019-04-01"),
    tags: Blog.tags_by_list_of_name(["Woodworking", "Growth", "Reflection"]),
    file_path:
      "priv/static/posts/software_development_a_woodworkers_perspective/part5-make_it_a_habit.md"
  },
  %{
    title: "GraphQL the Dev Edition",
    published_on: Date.from_iso8601!("2019-09-26"),
    tags: Blog.tags_by_list_of_name(["GraphQL"]),
    file_path: "priv/static/posts/graphql_the_dev_edition/graphql_the_dev_edition.md"
  },
  %{
    title: "Rolling Your Team RPG Style",
    published_on: Date.from_iso8601!("2019-10-21"),
    tags: Blog.tags_by_list_of_name(["Leadership", "Growth"]),
    file_path: "priv/static/posts/rolling_your_team_rpg_style/rolling_your_team_rpg_style.md"
  },
  %{
    title: "Up and Running: Zeit and Now",
    published_on: Date.from_iso8601!("2019-12-01"),
    tags: Blog.tags_by_list_of_name(["Up and Running", "Deployment"]),
    file_path: "priv/static/posts/up_and_running/zeit_and_now.md"
  },
  %{
    title: "Up and Running: Next and TypeORM",
    published_on: Date.from_iso8601!("2019-12-15"),
    tags: Blog.tags_by_list_of_name(["Up and Running", "NextJS", "Databases"]),
    file_path: "priv/static/posts/up_and_running/next_and_typeorm.md"
  },
  %{
    title: "Remote Workers: Help Your Neighbor",
    tags: Blog.tags_by_list_of_name(["Growth", "Reflection"]),
    published_on: Date.from_iso8601!("2020-03-17"),
    file_path: "priv/static/posts/remote_workers/help_your_neighbor.md"
  },
  %{
    title: "Hyper Focused -> Hyper Productive",
    tags: Blog.tags_by_list_of_name(["Growth", "Leadership", "Reflection"]),
    published_on: Date.from_iso8601!("2020-04-28"),
    file_path: "priv/static/posts/hyper_focused-hyper_productive/hyper_focues-hyper_productive.md"
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
