import sbt._

object Dependencies {
  lazy val akkaVersion = "10.0.11"

  lazy val dependencies = Seq(
    "com.typesafe.akka"       %% "akka-http"                 % akkaVersion,
    "com.typesafe.akka"       %% "akka-http-spray-json"      % akkaVersion,
    "com.softwaremill.sttp"   %% "core"                      % "1.1.12",

    "joda-time"               % "joda-time"                  % "2.9.9",
    "ch.qos.logback"          % "logback-classic"            % "1.1.3",
    
    "org.mockito"             % "mockito-core"               % "2.8.47"            % "test",
    "org.scalatest"          %% "scalatest"                  % "3.0.4"             % "test",
    "com.typesafe.akka"      %% "akka-http-testkit"          % "10.1.0"            % "test"
  )
}
