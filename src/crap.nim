import
  os,
  strformat,
  times

proc trash*(file: string) =
  var trashHome: string
  let fullFile = expandFilename(file)

  if existsEnv("XDG_DATA_HOME"):
    trashHome = joinPath(getEnv("XDG_DATA_HOME"), "Trash")
  else:
    trashHome = joinPath(getHomeDir(), ".local/share/Trash")
  moveFile(fullFile, fmt("{trashHome}/files/{file}"))

  let 
    t = getTime()
    formattedTime = t.format("yyyy-MM-dd") & "T" & t.format("HH:MM:ss")

  var trashInfo = fmt"""[Trash Info]
Path={fullFile}
DeletionDate={formattedTime}"""

  writeFile(joinPath(trashHome, "info", fmt"{file}.info"), trashInfo)

when isMainModule:
  var del: string
  try:
    del = paramStr(1)
    trash(del)
  except IndexError:
    echo("error: no path specified")
    quit(0)
