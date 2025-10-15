export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url)
    const path = url.pathname

    // handle .bin requests
    if (path.endsWith(".bin")) {
      const binName = path.split("/").pop()

      // look through every json file in /data
      // we have to hardcode this because workers don't have fs access (i think?)
      const candidates = [
        "sh1mmer.json",
        "picoshim.json",
        "shimboot.json",
        "nanoshims.json",
        "sh67mmer.json",
        "kvs.json",
        "aurora.json",
        "beta-aurora.json",
        "br0ker.json"
      ]

      for (const file of candidates) {
        try {
          const res = await env.ASSETS.fetch(new URL("/data/" + file, request.url))
          if (!res.ok) continue
          const data = await res.json()
          const match = data.assets?.find(a => a.name === binName && a.browser_download_url)
          if (match) {
            return Response.redirect(match.browser_download_url, 302)
          }
        } catch (e) {
          console.error("error reading", file, e)
        }
      }

      return new Response("bin not found", { status: 404 })
    }

    // otherwise try to serve the static asset
    let res = await env.ASSETS.fetch(request)
    if (res.status === 404) {
      // fallback to index.html for SPA
      res = await env.ASSETS.fetch(new URL("/index.html", request.url))
    }
    return res
  }
}

