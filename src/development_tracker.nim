import jester, htmlgen, os, strutils

var settings = newSettings()

const
  portEnv = "PORT"
  defaultPort = $8080

settings.port = Port(parseInt(getEnv(portEnv, defaultPort)))

routes:
  get "/":
    resp h1("Development Tracker")

runForever()
