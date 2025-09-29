import fs from "fs";
import path from "path";

const data = path.resolve("src/data");
const files = fs.readdirSync(data).filter(f => f.endsWith(".json"));

let redirects = [];

for (const file of files) {
  const releaseData = JSON.parse(fs.readFileSync(path.join(data, file), "utf-8"));

  if (!releaseData.lowercasename || !releaseData.assets) continue;

  for (const asset of releaseData.assets) {
    redirects.push(
      `/${releaseData.lowercasename}/${asset.name} ${asset.browser_download_url} 302`
    );
  }
}

fs.writeFileSync("public/_redirects", redirects.join("\n") + "\n");