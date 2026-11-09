# Online resume — www.theodoremayi.com

Static resume site in French (`index.html`) and English (`en.html`), hosted in a private S3 bucket behind CloudFront (HTTPS with ACM, Origin Access Control) with DNS on Cloudflare.

| Path | Content |
|---|---|
| `index.html`, `en.html` | Resume pages (FR / EN), with SEO metadata and schema.org `Person` data |
| `assets/` | Stylesheet, favicon, profile photo |
| `cv/` | Downloadable PDF resumes (FR / EN), without phone number |
| `robots.txt`, `sitemap.xml` | Search engine indexing |

## Update the site

1. Edit the files.
2. Upload them to the S3 bucket (replace the existing ones).
3. In CloudFront, create an invalidation for `/*` so visitors get the new version.
