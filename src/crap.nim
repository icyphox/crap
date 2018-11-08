import
  os,
  strformat,
  strutils,
  times

proc crap*(path: string) =
  let fullPath = expandFilename(path)
  let fname = extractFilename(fullPath)

  let trashHome = if existsEnv("XDG_DATA_HOME"):
    getEnv("XDG_DATA_HOME") / "Trash"
  else:
    getHomeDir() / ".local/share/Trash"

  moveFile(fullPath, trashHome / "files" / fname)

  let 
    t = getTime()
    formattedTime = t.format("yyyy-MM-dd'T'HH:MM:ss")
    trashInfo = fmt"""[Trash Info]
Path={fullPath}
DeletionDate={formattedTime}"""

  writeFile(trashHome / "info" / fmt"{fname}.trashinfo", trashInfo)

when isMainModule:
  var del = ""
  if paramCount() == 0:
    echo("error: specify at least one file")
    quit(1)
  try:
    for f in countUp(1, paramCount()):
      del = paramStr(f).strip()
      crap(del)
  except OSError:
    echo("error: no such file or directory: " & del)
    quit(1)