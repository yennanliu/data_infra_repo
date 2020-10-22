lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.yen_myservice",
      version := "0.1.0",
      scalaVersion := "2.12.2",
      assemblyJarName in assembly := "myservice.jar"
)),
    name := "myservice",
    libraryDependencies ++= List(
      "org.scalatest" %% "scalatest" % "3.0.5",
      "com.typesafe.scala-logging" %% "scala-logging" % "3.9.0",
      "org.apache.spark" %% "spark-sql" % "2.4.0"
    )
)
assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs@_*) => MergeStrategy.discard
  case x => MergeStrategy.first
}