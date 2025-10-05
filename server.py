from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import os, json

PORT = 4322
DIRECTORY = os.getcwd()

class SPAHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        path = self.path.lstrip("/")

        # if someone is directly accessing a .bin file, redirect them to the appropriate URL (e.g: /aurora/grunt-aurora.bin -> github.com/AerialiteLabs/aurora/releases/latest/download/grunt-aurora.bin)
        if path.endswith(".bin"):
            bin_name = os.path.basename(path)
            base = bin_name.rsplit("-", 1)[-1].replace(".bin","") if "-" in bin_name else bin_name.replace(".bin","")
            json_path = os.path.join(DIRECTORY, "data", base + ".json")

            if os.path.exists(json_path):
                try:
                    with open(json_path, "r", encoding="utf-8") as f:
                        data = json.load(f)
                    for asset in data.get("assets", []):
                        if asset.get("name") == bin_name and "browser_download_url" in asset:
                            self.send_response(302)
                            self.send_header("Location", asset["browser_download_url"])
                            self.end_headers()
                            return
                except Exception as e:
                    print("json parse error:", e)

            self.send_error(404, "bin not found")
            return

        full_path = os.path.join(DIRECTORY, path)
        if os.path.exists(full_path) and not os.path.isdir(full_path):
            return super().do_GET()
        self.path = "/index.html"
        return super().do_GET()

os.chdir(DIRECTORY)
httpd = ThreadingHTTPServer(("0.0.0.0", PORT), SPAHandler)
print(f"serving at http://localhost:{PORT}")
httpd.serve_forever()