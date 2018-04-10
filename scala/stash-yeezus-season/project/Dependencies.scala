import sbt._

object Dependencies {
  lazy val akkaVersion = "10.1.0"

  lazy val dependencies = Seq(
    "com.typesafe.akka"       %% "akka-actor"                 % "2.5.11",
    "com.typesafe.akka"       %% "akka-stream"                 % "2.5.11",
    "com.typesafe.akka"       %% "akka-http-core"             % akkaVersion,
    "com.typesafe.akka"       %% "akka-http-spray-json"       % akkaVersion,
    "joda-time"                % "joda-time"                  % "2.9.9",
    "ch.qos.logback"           % "logback-classic"            % "1.1.3",

    "org.scala-lang.modules"  %% "scala-async"                % "0.9.7",
    "com.typesafe.play"       %% "play-json"                  % "2.6.9",
    
    "org.mockito"              % "mockito-core"               % "2.8.47"            % "test",
    "org.scalatest"           %% "scalatest"                  % "3.0.4"             % "test",
    "com.typesafe.akka"       %% "akka-http-testkit"          % akkaVersion            % "test"
  )
}
