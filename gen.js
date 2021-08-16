const path = require("path");
const lockFile = require("./esy.lock/index.json");

function normalisePackageNames(n) {
  return n
    .replace(/@/g, "__AT__")
    .replace(/\//g, "__s__")
    .replace(/\./g, "__DOT__")
    .replace(/:/g, "__COLON__");
}

let root = lockFile.root;
let queue = new Set();
let cur = root;
let visited = {};
let sources = {};
let sourcesDir = "sources";

function compileMakefile(sources) {
  console.log(`mk-src-dir:
${"\t"}mkdir -p ${sourcesDir};
`);
  for (key in sources) {
    let normalisedPackageName = normalisePackageNames(key);
    let [urlStrWithType, checksumCRC] = sources[key].split("#");
    let [algo, checksum] = checksumCRC.split(":");
    let parts = urlStrWithType.split(":");
    let sourceType = parts[0];
    let urlStr = parts.slice(1).join(":");
    console.log(`${normalisedPackageName}: mk-src-dir
${"\t"}curl --silent -o ${path.join(
      sourcesDir,
      normalisedPackageName
    )}.tar ${urlStr}
${"\t"}echo "${checksum} *${path.join(
      sourcesDir,
      normalisedPackageName
    )}.tar" | shasum -a ${algo.replace("sha", "")} -c
${"\t"}mkdir -p sources/${normalisedPackageName}
${"\t"}tar --strip-components=1 -xf ${path.join(
      sourcesDir,
      normalisedPackageName
    )}.tar -C sources/${normalisedPackageName}
`);
  }
  console.log(`fetch-sources: ${Object.keys(sources)
    .map(normalisePackageNames)
    .join(" ")}
${"\t"} echo "Fetched"`);
}

function visit(cur) {
  if (lockFile.node[cur].source.type === "install") {
    let source = lockFile.node[cur].source.source[0];
    if (source !== "no-source:" && !!source) {
      sources[cur] = source;
    }
  }
}

do {
  if (!visited[cur]) {
    visit(cur);
    visited[cur] = true;
  }
  lockFile.node[cur].dependencies.forEach((x) => queue.add(x));
  lockFile.node[cur].devDependencies.forEach((x) => queue.add(x));
  let queueAsArray = Array.from(queue.values());
  cur = queueAsArray.shift();
  queue = new Set(queueAsArray);
} while (cur);

compileMakefile(sources);
