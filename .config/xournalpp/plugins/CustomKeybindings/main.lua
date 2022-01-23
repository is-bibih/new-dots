-- register toolbar actions and initialize ui stuff
function initUi()
  app.registerUi({["menu"] = "toggle pen/highlighter", ["callback"] = "togglePenHighlighter", ["accelerator"] = "<Alt>1"});
  app.registerUi({["menu"] = "toggle stroke recognizer", ["callback"] = "toggleShapeRecognizer", ["accelerator"] = "<Alt>2"});
  app.registerUi({["menu"] = "toggle rectangle", ["callback"] = "toggleRectangle", ["accelerator"] = "<Alt>3"});
  app.registerUi({["menu"] = "toggle coordinate system", ["callback"] = "toggleCoordinateSystem", ["accelerator"] = "<Alt>4"});
  app.registerUi({["menu"] = "toggle pen blue", ["callback"] = "togglePenBlue", ["accelerator"] = "<Shift><Alt>q"});
  app.registerUi({["menu"] = "toggle pen white", ["callback"] = "togglePenWhite", ["accelerator"] = "<Shift><Alt>w"});
  app.registerUi({["menu"] = "cycle color backward", ["callback"] = "cycleColorBackward", ["accelerator"] = "<Alt>q"});
  app.registerUi({["menu"] = "cycle color forward", ["callback"] = "cycleColorForward", ["accelerator"] = "<Alt>w"});
end

-- dict of custom colors
local colorlist = {
  {"lightPink", 0xff7ff6},
  {"lightRed", 0xff7f8c},
  {"lightOrange", 0xffc37f},
  {"lightYellow", 0xffe97f},
  {"lightGreen", 0x7fff8c},
  {"lightBlue", 0x7fc7ff},
  {"lightPurple", 0x997fff}
}

-- "active" color
local currentColor = 1

-- other colors
local blue = 0x3333cc 
local white = 0xffffff 

-- used to restore stroke recognizer state
-- when rectangle or coordinate system are disabled
local isPreviousStrokeRecognizer = false

-- used to toggle between some color and blue/white
local previousColorIndex = 1

function togglePenHighlighter()
  -- selects pen if current tool is not pen
  -- selects highlighter if current tool is pen
  local activeToolInfo = app.getToolInfo("active")
  local activeTool = activeToolInfo["type"]
  if not (activeTool == "pen") then
    app.uiAction({["action"]="ACTION_TOOL_PEN"})
  else
    app.uiAction({["action"]="ACTION_TOOL_HIGHLIGHTER"})
  end
end

function toggleShapeRecognizer()
  local activeToolInfo = app.getToolInfo("active")
  local activeDrawingType = activeToolInfo["drawingType"]
  if activeDrawingType == "strokeRecognizer" then
    app.uiAction({["action"]="ACTION_SHAPE_RECOGNIZER", ["enabled"]=false})
    isPreviousStrokeRecognizer = false 
  else
    app.uiAction({["action"]="ACTION_SHAPE_RECOGNIZER", ["enabled"]=true})
    isPreviousStrokeRecognizer = true
  end
end

function toggleRectangle()
  local activeToolInfo = app.getToolInfo("active")
  local activeDrawingType = activeToolInfo["drawingType"]
  if activeDrawingType == "rectangle" then
    app.uiAction({["action"]="ACTION_TOOL_DRAW_RECT", ["enabled"]=false})
    -- restore stroke recognizer if it was previously enabled
    if isPreviousStrokeRecognizer then
      app.uiAction({["action"]="ACTION_SHAPE_RECOGNIZER", ["enabled"]=true})
    end
  else
    app.uiAction({["action"]="ACTION_TOOL_DRAW_RECT", ["enabled"]=true})
  end
end

function toggleCoordinateSystem()
  local activeToolInfo = app.getToolInfo("active")
  local activeDrawingType = activeToolInfo["drawingType"]
  if activeDrawingType == "drawCoordinateSystem" then
    app.uiAction({["action"]="ACTION_TOOL_DRAW_COORDINATE_SYSTEM", ["enabled"]=false})
    -- restore stroke recognizer if it was previously enabled
    if isPreviousStrokeRecognizer then
      app.uiAction({["action"]="ACTION_SHAPE_RECOGNIZER", ["enabled"]=true})
    end
  else
    app.uiAction({["action"]="ACTION_TOOL_DRAW_COORDINATE_SYSTEM", ["enabled"]=true})
  end
end

function togglePenBlue()
  local activeToolInfo = app.getToolInfo("active")
  local activeColor = activeToolInfo["color"]
  -- restore previous selected color if changing back from blue
  if activeColor == blue then
    app.changeToolColor({["color"] = colorlist[currentColor][2], ["selection"] = true})
  else
    app.changeToolColor({["color"] = blue, ["selection"] = true})
  end
end

function togglePenWhite()
  local activeToolInfo = app.getToolInfo("active")
  local activeColor = activeToolInfo["color"]
  -- restore previous selected color if changing back from white
  if activeColor == white then
    app.changeToolColor({["color"] = colorlist[currentColor][2], ["selection"] = true})
  else
    app.changeToolColor({["color"] = white, ["selection"] = true})
  end
end

function cycleColorBackward()
  currentColor = (currentColor - 2) % #colorlist + 1
  app.changeToolColor({["color"] = colorlist[currentColor][2], ["selection"] = true})
end

function cycleColorForward()
  currentColor = currentColor % #colorlist + 1
  app.changeToolColor({["color"] = colorlist[currentColor][2], ["selection"] = true})
end
