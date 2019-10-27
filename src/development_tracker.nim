import jester, htmlgen, os, strutils

var settings = newSettings()

const portEnv = "PORT"

if existsEnv(portEnv):
  settings.port = Port(parseInt(getEnv(portEnv)))

routes:
  get "/":
    resp h1("Development Tracker")

runForever()
