const { mkdir, writeFile } = require("fs/promises");
const { titleize, slugify } = require("underscore.string");

posts = [
  {
    title: "Software Development a Woodworkers Perspective",
    date: "2019-01-01",
  },
  {
    title: "A Woodworkers Perspective Part 1: Planning and Preparation",
    date: "2019-01-14",
  },
  {
    title: "A Woodworkers Perspective Part 2: Use Your Resources",
    date: "2019-02-15",
  },
  {
    title: "A Woodworkers Perspective Part 3: Every Cut Counts",
    date: "2019-03-01",
  },
  {
    title: "A Woodworkers Perspective Part 4: Don't Be A Hero",
    date: "2019-03-15",
  },
  {
    title: "A Woodworkers Perspective Part 5: Make It A Habit",
    date: "2019-04-01",
  },
  {
    title: "GraphQL the Dev Edition",
    date: "2019-09-26",
  },
  {
    title: "Rolling Your Team RPG Style",
    date: "2019-10-21",
  },
  {
    title: "Up and Running: Zeit and Now",
    date: "2019-12-01",
  },
  {
    title: "Up and Running: Next and TypeORM",
    date: "2019-12-15",
  },
  {
    title: "Remote Workers: Help Your Neighbor",
    date: "2020-03-17",
  },
  {
    title: "Hyper Focused -> Hyper Productive",
    date: "2020-04-28",
  },
];

posts.map((post) => {
  const slugName = slugify(post.title);
  const foldername = `${post.date}-${slugName}`;
  const filename = `${post.date}-${slugName}.md`;
  const folderPath = `${__dirname}/static/posts/${foldername}`;
  const imagePath = `${folderPath}/images`;
  const filePath = `${folderPath}/${filename}`;

  const title = titleize(post.name);

  try {
    mkdir(folderPath, { recursive: true });
    mkdir(imagePath, { recursive: true });
    writeFile(filePath, `# ${title}`);
  } catch (e) {
    console.log("Fail...");
    console.error(e);
  }
});
