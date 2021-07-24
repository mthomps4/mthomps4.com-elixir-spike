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

tags = [
  "Woodworking",
  "Leadership",
  "Team & Growth",
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

Enum.map(tags, fn name ->
  Mthomps4.Blog.create_tag(%{name: name})
end)

Mthomps4.Blog.create_post(%{
  title: "Woodworkers Intro",
  published_on: DateTime.utc_now(),
  file_path:
    "priv/static/posts/software_development_a_woodworkers_perspective/part1-planning_and_preparation.md"
})
