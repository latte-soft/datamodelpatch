local l_script_FirstAncestor_0 = script:FindFirstAncestor("Analytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
local v4 = nil;
v4 = not l_GetFFlagShareGetPlatformTargetImpl_0() and function()
    local v5 = "unknownLua";
    local l_None_0 = Enum.Platform.None;
    pcall(function()
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    local v7 = true;
    if l_None_0 ~= Enum.Platform.Windows then
        v7 = l_None_0 == Enum.Platform.OSX;
    end;
    local v8 = true;
    if l_None_0 ~= Enum.Platform.IOS then
        v8 = l_None_0 == Enum.Platform.Android;
    end;
    v8 = v8 or l_None_0 == Enum.Platform.UWP;
    local v9 = true;
    if l_None_0 ~= Enum.Platform.XBox360 then
        v9 = l_None_0 == Enum.Platform.XBoxOne;
    end;
    local l_v9_0 = v9;
    if not l_v9_0 then
        l_v9_0 = true;
        if l_None_0 ~= Enum.Platform.PS3 then
            l_v9_0 = true;
            if l_None_0 ~= Enum.Platform.PS4 then
                l_v9_0 = game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5;
            end;
        end;
    end;
    return if not v7 then v8 and "mobile" or ((l_v9_0 or l_None_0 == Enum.Platform.WiiU) and "console" or v5 .. tostring(l_None_0)) else "client";
end or require(l_script_FirstAncestor_0.getPlatformTarget);
local v11 = {};
v11.__index = v11;
v11.new = function(v12)
    local v13 = type(v12);
    local v14 = true;
    if v13 ~= "table" then
        v14 = v13 == "userdata";
    end;
    assert(v14, "Unexpected value for eventIngestService");
    local v15 = {
        _eventIngest = v12
    };
    setmetatable(v15, v11);
    return v15;
end;
v11.setRBXEvent = function(v16, v17, v18, v19)
    local v20 = v4();
    v19 = v19 or {};
    assert(type(v17) == "string", "Expected eventContext to be a string");
    assert(type(v18) == "string", "Expected eventName to be a string");
    assert(type(v19) == "table", "Expected additionalArgs to be a table");
    v16._eventIngest:SetRBXEvent(v20, v17, v18, v19);
end;
v11.setRBXEventStream = function(v21, v22, v23, v24)
    local v25 = v4();
    v24 = v24 or {};
    assert(type(v22) == "string", "Expected eventContext to be a string");
    assert(type(v23) == "string", "Expected eventName to be a string");
    assert(type(v24) == "table", "Expected additionalArgs to be a table");
    v21._eventIngest:SetRBXEventStream(v25, v22, v23, v24);
end;
v11.sendEventDeferred = function(v26, v27, v28, v29)
    local v30 = v4();
    v29 = v29 or {};
    assert(type(v27) == "string", "Expected eventContext to be a string");
    assert(type(v28) == "string", "Expected eventName to be a string");
    assert(type(v29) == "table", "Expected additionalArgs to be a table");
    v26._eventIngest:SendEventDeferred(v30, v27, v28, v29);
end;
v11.sendEventImmediately = function(v31, v32, v33, v34)
    local v35 = v4();
    v34 = v34 or {};
    assert(type(v32) == "string", "Expected eventContext to be a string");
    assert(type(v33) == "string", "Expected eventName to be a string");
    assert(type(v34) == "table", "Expected additionalArgs to be a table");
    v31._eventIngest:SendEventImmediately(v35, v32, v33, v34);
end;
return v11;
