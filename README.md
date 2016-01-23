Thumbor S3
==========

Simple Thumbor Docker image that serves image files from an AWS S3 bucket,
using the ImageMagick engine. To run, supply the following environment
variables for `docker run`:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_S3_BUCKET`
- `THUMBOR_KEY`

Running It
----------

- Prepare an environment file such as `thumbor.env` with the following content:
````
AWS_ACCESS_KEY_ID=<your AWS access key ID>
AWS_SECRET_ACCESS_KEY=<your AWS secret access key>
AWS_S3_BUCKET=<your s3 bucket>
THUMBOR_KEY=<your Thumbor key>
````
- `docker run --name thumbor -p "8888:8888" --env-file=thumbor.env 9gel/thumbor-s3`
- Get a URL for a file `yourfile.png`:
  - `docker exec thumbor thumbor-url -k '<your Thumbor key>' -w 400 -e 400 "yourfile.png"`
  - You'll get a URL like: `/<generated signature>/400x400/yourfile.png`
- Access the file:
  - `http://<your docker host>:8888/<generated signature>/400x400/yourfile.png`

Deploying It
------------

Launch a few Thumbor executables per machine, and put Nginx in front.

### With [Docker Compose](https://docs.docker.com/compose/)

Here's an example using Docker Compose with files in this repository:

- Edit thumbor.env to fill in your specifics
- `docker-compose up`
  - You should see the container names. One of those for Thumbor will look like `dockerthumbors3_thumbor1_1`
- Get a URL for a file `yourfile.png`:
  - `docker exec dockerthumbors3_thumbor1_1 thumbor-url -k '<your Thumbor key>' -w 400 -e 400 "yourfile.png"`
  - You'll get a URL like: `/<generated signature>/400x400/yourfile.png`
- Access the file:
  - `http://<your docker host>:8880/<generated signature>/400x400/yourfile.png`

### Amazon Elastic Beanstalk

Easily deploy to [Amazon Elastic Beanstalk](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecs.html) in a Multicontainer Docker Environment and take advantage of their auto-scaling feature. You can also put a CDN in front of your setup with [CloudFront](https://aws.amazon.com/cloudfront/).

- Follow this [Elastic Beanstalk tutorial](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_docker_ecstutorial.html), using the `Dockerrun.aws.json` in this repository.
- Define these Environment Properties in Elastic Beanstalk Configuration -> Software Configuration
````
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_S3_BUCKET
THUMBOR_KEY
````

How It Works
------------

The `ENTRYPOINT` script:

- Takes the `thumbor.conf.tpl` template and produces
`/etc/thumbor.conf` with environment variables using 'envtpl'.
- Runs `thumbor`

