Thumbor S3
==========

Simple Thumbor Docker image that serves image files from an AWS S3 bucket,
using the ImageMagick engine. To run, supply the following environment
variables for `docker run`:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_S3_BUCKET`
- `THUMBOR_KEY`

How
---

The `ENTRYPOINT` script

- Takes the `thumbor.conf.tpl` template and produces
`/etc/thumbor.conf` with environment variables using 'envtpl'.
- Runs `thumbor`

