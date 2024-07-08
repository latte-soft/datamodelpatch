local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Shell.Utility);
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = {};
v2.__index = v2;
local function _(v3, v4)
    local v5 = "EnterSection" .. tostring(v4);
    v3._actions.EnterSection[v4] = v5;
    l_ContextActionService_0:BindCoreAction(v5, function(v6, v7, v8)
        return v3:_enterAction(v6, v7, v8);
    end, false, v4);
end;
local function _(v10, v11)
    local v12 = "ExitSection" .. tostring(v11);
    v10._actions.ExitSection[v11] = v12;
    l_ContextActionService_0:BindCoreAction(v12, function(v13, v14, v15)
        return v10:_exitAction(v13, v14, v15);
    end, false, v11);
end;
v2.new = function()
    local v17 = {
        _levels = {}, 
        _guiobjs = {}, 
        _nextPageKey = "", 
        _actions = {}, 
        _seenPressed = {}
    };
    v17._actions.EnterSection = {};
    v17._actions.ExitSection = {};
    local l_ButtonB_0 = Enum.KeyCode.ButtonB;
    local v19 = "ExitSection" .. tostring(l_ButtonB_0);
    v17._actions.ExitSection[l_ButtonB_0] = v19;
    l_ContextActionService_0:BindCoreAction(v19, function(v20, v21, v22)
        return v17:_exitAction(v20, v21, v22);
    end, false, l_ButtonB_0);
    setmetatable(v17, v2);
    return v17;
end;
v2.AddEnterButton = function(v23, v24)
    local v25 = "EnterSection" .. tostring(v24);
    v23._actions.EnterSection[v24] = v25;
    l_ContextActionService_0:BindCoreAction(v25, function(v26, v27, v28)
        return v23:_enterAction(v26, v27, v28);
    end, false, v24);
end;
v2.AddExitButton = function(v29, v30)
    local v31 = "ExitSection" .. tostring(v30);
    v29._actions.ExitSection[v30] = v31;
    l_ContextActionService_0:BindCoreAction(v31, function(v32, v33, v34)
        return v29:_exitAction(v32, v33, v34);
    end, false, v30);
end;
v2.EnterRootSection = function(v35, v36)
    if v35._guiobjs[v36] == nil then
        return false;
    else
        v35._levels = {};
        table.insert(v35._levels, v36);
        v0.SetSelectedCoreObject(v35._guiobjs[v36]);
        return true;
    end;
end;
v2.EnterSection = function(v37)
    local l__nextPageKey_0 = v37._nextPageKey;
    if not (l__nextPageKey_0 ~= nil) or v37._guiobjs[l__nextPageKey_0] == nil then
        return false;
    else
        table.insert(v37._levels, l__nextPageKey_0);
        v0.SetSelectedCoreObject(v37._guiobjs[l__nextPageKey_0]);
        v37._nextPageKey = nil;
        return true;
    end;
end;
v2.ExitSection = function(v39)
    table.remove(v39._levels);
    local v40 = v39._levels[#v39._levels];
    if v39._guiobjs[v40] == nil then
        return false;
    else
        v0.SetSelectedCoreObject(v39._guiobjs[v40]);
        return true;
    end;
end;
v2._enterAction = function(v41, _, v43, v44)
    if v41._nextPageKey == nil then
        return Enum.ContextActionResult.Pass;
    elseif v43 == Enum.UserInputState.Begin then
        v41._seenPressed[v44.KeyCode] = true;
        return Enum.ContextActionResult.Sink;
    elseif not (v43 == Enum.UserInputState.End) or not v41._seenPressed[v44.KeyCode] then
        return ;
    else
        v41._seenPressed[v44.KeyCode] = false;
        v41:EnterSection();
        return Enum.ContextActionResult.Sink;
    end;
end;
v2._exitAction = function(v45, _, v47, v48)
    if #v45._levels <= 1 then
        return Enum.ContextActionResult.Pass;
    else
        if v47 == Enum.UserInputState.Begin then
            v45._seenPressed[v48.KeyCode] = true;
        elseif not (not (v47 == Enum.UserInputState.End) or not v45._seenPressed[v48.KeyCode]) then
            v45._seenPressed[v48.KeyCode] = false;
            v45:ExitSection();
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
v2.Set = function(v49, v50, v51)
    v49._guiobjs[v50] = v51;
end;
v2.SetNextPage = function(v52, v53)
    v52._nextPageKey = v53;
end;
v2.Destruct = function(v54)
    for _, v56 in pairs(v54._actions.EnterSection) do
        l_ContextActionService_0:UnbindCoreAction(v56);
    end;
    for _, v58 in pairs(v54._actions.ExitSection) do
        l_ContextActionService_0:UnbindCoreAction(v58);
    end;
end;
return v2;
