import
  os,
  strformat,
  strutils,
  times

proc crap*(path: var string) =
  var trashHome: string
  let fullPath = expandTilde(path)
  path = extractFilename(fullPath)

  if existsEnv("XDG_DATA_HOME"):
    trashHome = joinPath(getEnv("XDG_DATA_HOME"), "Trash")
  else:
    trashHome = joinPath(getHomeDir(), ".local/share/Trash")

  moveFile(fullPath, joinPath(trashHome, "files", path))

  let 
    t = getTime()
    formattedTime = t.format("yyyy-MM-dd") & "T" & t.format("HH:MM:ss")
    trashInfo = fmt"""[Trash Info]
Path={fullPath}
DeletionDate={formattedTime}"""

  writeFile(joinPath(trashHome, "info", fmt"{path}.info"), trashInfo)

when isMainModule:
  var del: string
  try:
    for f in countUp(1, paramCount()):
      del = paramStr(f)
      crap(del)
  except IndexError:
    echo("error: no path specified")
    quit(0)
  except OSError:
    echo("error: no such file or directory")
    quit(0)
