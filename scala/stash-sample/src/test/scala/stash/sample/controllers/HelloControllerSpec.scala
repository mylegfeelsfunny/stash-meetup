package stash.sample.controllers

import org.scalatest._
import org.scalatest.concurrent.ScalaFutures

import akka.http.scaladsl.testkit.ScalatestRouteTest
import akka.http.scaladsl.model.StatusCodes._

class HelloControllerSpec
  extends FlatSpec with Matchers with ScalaFutures with ScalatestRouteTest {

  trait Fixture {
    val controller = new HelloController
  }

  "The HelloController" should "tell me hello from stash" in new Fixture {

    Get(s"/stash") ~> controller.routes ~> check {
      status shouldBe OK

      val response = responseAs[String]
      response shouldBe "hello, from stash"
    }
  }
}
