const { mkdir, writeFile } = require("fs/promises");
const { titleize, slugify } = require("underscore.string");

const args = require("minimist")(process.argv.slice(2));

const { postName } = args;

console.log({ postName });

if (!postName) {
  return console.error(
    "A postName is required verify you are passing '--postName='My Article'"
  );
}

const timestamp = Date.now();
const date_ob = new Date(timestamp);
const day = date_ob.getDate();
const month = date_ob.getMonth() + 1;
const year = date_ob.getFullYear();
const dateString = `${year}-${month}-${day}`;

const slugName = slugify(postName);
const foldername = `${dateString}-${slugName}`;
const filename = `${dateString}-${slugName}.md`;
const folderPath = `${__dirname}/static/posts/${foldername}`;
const imagePath = `${folderPath}/images`;
const filePath = `${folderPath}/${filename}`;

const title = titleize(postName);

try {
  mkdir(folderPath, { recursive: true });
  mkdir(imagePath, { recursive: true });
  writeFile(filePath, `# ${title}`);
} catch (e) {
  console.log("Fail...");
  console.error(e);
}
