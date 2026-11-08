# Théodore MAYI MOLA — Cloud Engineer Portfolio

Personal portfolio of **Théodore MAYI MOLA**, Cloud Engineer and **AWS Certified Cloud Practitioner**.
It is a small Flask application rendered to a static site and deployed automatically to S3 + CloudFront by GitHub Actions.

## Projects

| Project | Stack | Links |
|---|---|---|
| Static website on AWS | S3 (private), CloudFront, OAC, ACM, Cloudflare DNS, Terraform | [Live](https://www.theodoremayi.com) · [Documentation](projects/aws-s3-cloudfront-static-website/README.md) |
| Highly available multi-tier infrastructure | Terraform, VPC multi-AZ, ALB, Auto Scaling, RDS, EFS, S3, Route 53, SNS | [Repository](https://github.com/moladevops/AWS-PROJECT-Build-application-Infrastructure-on-AWS) |
| This portfolio: hosting and CI/CD | Terraform, S3, CloudFront, Cloudflare DNS, GitHub Actions with OIDC, Docker | [Infrastructure](infra/) · [Workflow](.github/workflows/ci.yml) |

## How this portfolio is hosted

The page is written as a small Flask app, then rendered to **static files** and served from a **private S3 bucket through CloudFront**, with HTTPS (ACM) and a CNAME on **Cloudflare DNS**. No server to maintain.

```
git push (main) ──► GitHub Actions
                      ├─ build: Docker image pushed to Docker Hub
                      └─ static-site:
                           ├─ render the Flask page to dist/ (scripts/build_static.py)
                           ├─ assume an AWS IAM role through OIDC (no stored AWS keys)
                           ├─ aws s3 sync dist → private S3 bucket
                           └─ CloudFront cache invalidation
```

| Path | Role |
|---|---|
| `app.py`, `templates/`, `static/` | Flask app: the page and the PDF resume |
| `scripts/build_static.py` | Renders the app into a static site in `dist/` |
| `infra/` | Terraform: S3, CloudFront, OAC, Cloudflare CNAME, GitHub OIDC deploy role |
| `.github/workflows/ci.yml` | Docker image build, static build and deployment |
| `Dockerfile` | Container image, to run the app anywhere |

## Set up the hosting (once)

Prerequisites: AWS credentials, a Cloudflare API token (*Zone → DNS → Edit*) for the domain, and an issued ACM certificate in us-east-1 covering the subdomain.

```bash
cd infra
cp terraform.tfvars.example terraform.tfvars
export CLOUDFLARE_API_TOKEN="<your-token>"   # PowerShell: $env:CLOUDFLARE_API_TOKEN="<your-token>"
terraform init
terraform apply
```

Then copy the outputs into GitHub → *Settings → Secrets and variables → Actions*:

| Terraform output | GitHub setting |
|---|---|
| `github_variable_S3_BUCKET` | **Variable** `S3_BUCKET` |
| `github_variable_CLOUDFRONT_DISTRIBUTION_ID` | **Variable** `CLOUDFRONT_DISTRIBUTION_ID` |
| `github_secret_AWS_DEPLOY_ROLE_ARN` | **Secret** `AWS_DEPLOY_ROLE_ARN` |

The next push to `main` deploys the site. Until these values exist, the workflow only builds it.

If the AWS account already has the GitHub OIDC provider, set `create_github_oidc_provider = false` in `terraform.tfvars`.

## Run locally

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
flask --app app run --port 5001
```

Or with Docker:

```bash
docker build -t portfolio .
docker run -d -p 5001:5001 portfolio
```

Then open http://localhost:5001.

## Contact

moladevops@gmail.com · [LinkedIn](https://www.linkedin.com/in/mola-mayi-a34438158/) · [AWS badge (Credly)](https://www.credly.com/badges/a0e12d06-cac2-4965-a12f-971044d0e08e/public_url)
