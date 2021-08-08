const { mkdir, writeFile } = require("fs/promises");
const { titleize, slugify } = require("underscore.string");
const dayjs = require("dayjs");
var utc = require("dayjs/plugin/utc");

const args = require("minimist")(process.argv.slice(2));
dayjs.extend(utc);

const { postName } = args;

console.log({ postName });

if (!postName) {
  return console.error(
    "A postName is required verify you are passing '--postName='My Article'"
  );
}

const dateString = dayjs().format("YYYY-MM-DD");

const slugName = slugify(postName);
const foldername = `${dateString}-${slugName}`;
const filename = `${slugName}.md`;
const folderPath = `${__dirname}/static/posts/${foldername}`;
const imagePath = `${folderPath}/images`;
const filePath = `${folderPath}/${filename}`;
const metaFilePath = `${folderPath}/meta.json`;

const title = titleize(postName);

try {
  mkdir(folderPath, { recursive: true });
  mkdir(imagePath, { recursive: true });
  writeFile(filePath, `# ${title}`);
  writeFile(
    metaFilePath,
    `
      {
        "title": "${title}",
        "excert": "",
        "date": "${dateString}",
        "tags": [""],
        "slug": "",
        "author": "Matthew Thompson",
        "ogImage": "",
        "coverImage": ""
      }
  `
  );
} catch (e) {
  console.log("Fail...");
  console.error(e);
}
