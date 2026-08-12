import std/os, std/strutils

proc handle_interruption*() {.noconv.} =
  quit(0)

var str = join(commandLineParams(), " ")
if str.len == 0:
  str = "y\n"
else:
  str.add("\n")

let repeated = (if str.len >= 16384: str else: str.repeat(16384 div str.len))

setControlCHook(handle_interruption)
while true:
  stdout.write(repeated)
  stdout.flushFile()
