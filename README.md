# Théodore MAYI MOLA — Cloud Engineer Portfolio

Personal portfolio of **Théodore MAYI MOLA**, Cloud Engineer and **AWS Certified Cloud Practitioner**.
It is a small Flask application, containerised with Docker and deployed automatically by a GitHub Actions pipeline.

## Projects

| Project | Stack | Links |
|---|---|---|
| Static website on AWS | S3 (private), CloudFront, OAC, ACM, Route 53 | [Live](https://www.theodoremayi.com) · [Documentation](projects/aws-s3-cloudfront-static-website/README.md) |
| Highly available multi-tier infrastructure | Terraform, VPC multi-AZ, ALB, Auto Scaling, RDS, EFS, S3, Route 53, SNS | [Repository](https://github.com/moladevops/AWS-PROJECT-Build-application-Infrastructure-on-AWS) |
| CI/CD pipeline for this portfolio | Docker, Docker Hub, GitHub Actions, SSH deployment | [Workflow](.github/workflows/ci.yml) |

## How this portfolio is built and deployed

```
git push (main) ──► GitHub Actions
                      ├─ build the Docker image
                      ├─ push it to Docker Hub (tagged with the run number and latest)
                      └─ SSH to the server: pull the image and restart the container
```

| File | Role |
|---|---|
| `app.py` | Flask application: serves the page and the PDF resume (`/download-pdf`) |
| `templates/index.html` | Portfolio page |
| `static/` | PDF resume |
| `Dockerfile` | Container image (Python 3.9 slim, port 5001) |
| `.github/workflows/ci.yml` | Build, push and deploy pipeline |

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
