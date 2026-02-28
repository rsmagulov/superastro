from __future__ import annotations

import json
import threading
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path

from tools.http.post_json import main


class _Handler(BaseHTTPRequestHandler):
    def do_POST(self):  # noqa: N802
        length = int(self.headers.get("Content-Length", "0"))
        body = self.rfile.read(length)
        data = json.loads(body.decode("utf-8"))
        out = {"ok": True, "echo": data}
        raw = json.dumps(out, ensure_ascii=False).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(raw)))
        self.end_headers()
        self.wfile.write(raw)

    def log_message(self, *_args, **_kwargs):
        return


def test_post_json_writes_utf8_response(tmp_path: Path):
    server = HTTPServer(("127.0.0.1", 0), _Handler)
    host, port = server.server_address

    t = threading.Thread(target=server.serve_forever, daemon=True)
    t.start()
    try:
        in_path = tmp_path / "payload.json"
        out_path = tmp_path / "out.json"
        in_path.write_text(json.dumps({"x": 1, "s": "тест"}, ensure_ascii=False), encoding="utf-8")

        rc = main(["--url", f"http://{host}:{port}/", "--in", str(in_path), "--out", str(out_path)])
        assert rc == 0
        data = json.loads(out_path.read_text(encoding="utf-8"))
        assert data["ok"] is True
        assert data["echo"]["s"] == "тест"
    finally:
        server.shutdown()
