"""Render the Flask portfolio into a static site that S3 + CloudFront can serve.

Usage: python scripts/build_static.py [output_dir]   (default: dist)
"""
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

from app import app  # noqa: E402


def build(out_dir: Path) -> None:
    if out_dir.exists():
        shutil.rmtree(out_dir)
    out_dir.mkdir(parents=True)

    response = app.test_client().get("/")
    if response.status_code != 200:
        raise SystemExit(f"GET / returned {response.status_code}")
    (out_dir / "index.html").write_bytes(response.data)

    shutil.copytree(ROOT / "static", out_dir / "static")
    print(f"Static site written to {out_dir}")


if __name__ == "__main__":
    build(ROOT / (sys.argv[1] if len(sys.argv) > 1 else "dist"))
