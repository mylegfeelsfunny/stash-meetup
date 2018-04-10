package stash.yeezus

import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Directives._
import akka.http.scaladsl.server.Route
import akka.stream.ActorMaterializer
import com.typesafe.config.{Config, ConfigFactory}
import slack.api.{BlockingSlackApiClient, SlackApiClient}
import stash.yeezus.controllers.HelloController

import scala.concurrent.ExecutionContextExecutor

//import akka.stream.ActorMaterializer
import scala.concurrent.ExecutionContext
import scala.concurrent.duration._
import scala.concurrent.Await

object Server {

  def main(args: Array[String]): Unit = {
    implicit val system: ActorSystem = ActorSystem("stash-yeezus-system")

    val client = new BlockingSlackApiClient(token)

    val users = client.listUsers()
    val userOption = users.find(_.name == "silvino.barreiros")

    for {
      vino <- userOption
    } {
      val vinoInfo = client.getUserInfo(vino.id)

      println(client.getUserProfile(vinoInfo.id))
    }

//    implicit val materializer: ActorMaterializer = ActorMaterializer()
//    implicit val executionContext: ExecutionContextExecutor = system.dispatcher
//
//    // load config and create environment
//    val configuration = ConfigFactory.load()
//    val environment = new Environment(configuration, system)
//
//    // get list of controllers from our environment
//    val controllers = environment.controllers
//
//    val routes = controllers.tail.foldLeft(controllers.head.routes) { (acc, next) =>
//      // ~ is just a method call we can rewrite it to this acc.~(next.routes)
//      acc ~ next.routes
//    }
//
//    val port = if (configuration.hasPath("server.port")) configuration.getInt("server.port") else 9000
//    val bindingFuture = Http().bindAndHandle(routes, "0.0.0.0", port)
//
//    println(s"-- Server online at http://localhost:$port/ --")
//
//    // apply shutdown hook. _ is a variable we don't are about.
//    // using it here gets rid of compiler warnings
//    val _ = sys.addShutdownHook {
//      println("Stopping service")
//
//      bindingFuture
//        .flatMap(_.unbind()) // trigger unbinding from the port
//        .onComplete { _ =>
//        println("Service stopped")
//        system.terminate()
//      } // and shutdown when done
//    }
  }
}

trait Controller {
  def routes: Route
}

trait BaseEnvironment {
  def controllers: Seq[Controller]
}

/**
  * load dependencies and inject. missing configuration fails fast
  *
  * @param configuration - configuration file
  * @param actorSystem
  */
class Environment(configuration: Config, implicit val actorSystem: ActorSystem)
  extends BaseEnvironment with HelloController.Dependencies { env =>

  lazy implicit val executionContext: ExecutionContext = actorSystem.dispatcher

  lazy val helloController = new HelloController(env)

  val controllers = Seq(helloController)
}
