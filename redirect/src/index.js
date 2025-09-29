let cache = {};

export default {
  async fetch(request) {
    const url = new URL(request.url);
    const [project, filename] = url.pathname.split("/").filter(Boolean);

    if (project && filename) {
      if (!cache[project]) {
        try {
          const res = await fetch(`https://dl.mrwork.shop/data/${project}.json`);
          if (res.ok) {
            cache[project] = await res.json();
          }
        } catch (err) {
          console.error("Error fetching JSON:", err);
        }
      }

      const releaseData = cache[project];
      if (releaseData?.assets) {
        const asset = releaseData.assets.find(a => a.name === filename);
        if (asset) {
          return Response.redirect(asset.browser_download_url, 302);
        }
      }
    }

    return fetch(request);
  }
};
