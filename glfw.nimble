#[ Package ]#

version     = "3.3.4.0"
author      = "Erik Johansson Andersson"
description = "GLFW 3 wrapper for Nim"
license     = "MIT"

skipDirs = @["examples"]

requires "nim >= 1.6.0"

let examples = @[
  "boing",
  "events",
  "gears",
  "minimal",
  "splitview",
  "triangle",
  "wave"
]

task examplesDebug, "Compiles the examples with dynamic linking and debug mode":
  for example in examples:
    exec "nim c examples/" & example

task examplesStaticDebug, "Compiles the examples with static linking and debug mode":
  for example in examples:
    exec "nim c -d:glfwStaticLib examples/" & example

task examples, "Compiles the examples with dynamic linking":
  for example in examples:
    exec "nim c -d:release examples/" & example

task examplesStatic, "Compiles the examples with static linking":
  for example in examples:
    exec "nim c -d:release -d:glfwStaticLib examples/" & example
