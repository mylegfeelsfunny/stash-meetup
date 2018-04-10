Stash Yeezus-season
==================

Setup
-----
  1. Install Homebrew - https://github.com/Homebrew/install
  2. Install scala - `brew update && brew install scala`
  3. Install sbt - `brew install sbt`


How to Compile
------------

If you want to compile from source you need the latest version of scala and sbt (this assumes you have Java already)

* [Scala](https://www.scala-lang.org/download/install.html)
* [sbt](http://www.scala-sbt.org/1.0/docs/Setup.html)

After installing both you can cd into the base project directory and run `sbt compile` to compile and `sbt test` to run unit tests.


Running
-------

##### Using Docker

To run the dockerized version of ultralight-beam you need the docker [toolkit](https://www.docker.com/docker-mac) (assuming you're on a mac). This should get you `docker` along with `docker-compose`. In the base directory there is a `docker-compose.yml` file. This will start ultralight-beam and in the future any dependent services.

The docker files that docker-compose use are in the `docker` directory.

Steps:

* run `sbt assembly` from the base directory. This will build a fat jar named stash-yeezus-season.jar` and put it in `docker/service`
* run `docker-compose up` from the base directory. This will launch the Yeezus-season service. Configuration defaults are in `docker-compose.yml`
* you can now hit ultralight-beam at `http://localhost:4535/v1/health`
* `docker-compose down` will stop the containers that were started.

##### Using SBT

* run `sbt -Dconfig.file=conf/application.conf  'run-main stash.Yeezus-season.Server'` from the base directory to use the default conf file.


Environment Variables
---------------------

`PORT`
This will set the port used to listen to web requests on


Unit Tests
----------

### Run Tests
```
sbt clean test
```
