package stash.sample.controllers

import stash.sample.Controller

class HelloController() extends Controller {
  import akka.http.scaladsl.server.Route
  import akka.http.scaladsl.server.Directives._

  def routes: Route = path("stash") {
    get {
      complete("hello, from stash")
    }
  }
}
