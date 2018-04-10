package stash.yeezus.controllers

import stash.yeezus.Controller
import stash.yeezus.controllers.HelloController.Dependencies

import scala.concurrent.ExecutionContext

class HelloController(dependencies: Dependencies) extends Controller {
  import akka.http.scaladsl.server.Route
  import akka.http.scaladsl.server.Directives._
  import dependencies._

  def routes: Route = path("search") {
    get {
      complete("hello, from stash")
    }
  }
}

object HelloController {
  trait Dependencies {
    def executionContext: ExecutionContext
  }
}
