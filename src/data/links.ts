import fs from "fs";
import path from "path";

type Link = {
  href: string;
  label: string;
  heading?: boolean;
};

const dataDir = path.resolve("./src/data");

export function getLinks(): Link[] {
  const files = fs.readdirSync(dataDir).filter(f => f.endsWith(".json"));

  const projectLinks = files.map(file => {
    const jsonPath = path.join(dataDir, file);
    const releaseData = JSON.parse(fs.readFileSync(jsonPath, "utf-8"));

    const releasename = releaseData.name.replace(/v.*$/, "").trim();
    const project = path.basename(file, ".json");

    return {
      href: `/${project}`,
      label: releasename,
    };
  });

  return [
    { href: "/", label: "Mr. Workshop's Download Server", heading: true },
    ...projectLinks,
  ];
}
