local l_Parent_0 = script:FindFirstAncestor("Analytics").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
local v3 = nil;
v3 = not l_GetFFlagShareGetPlatformTargetImpl_0() and function()
    local v4 = "unknownLua";
    local l_None_0 = Enum.Platform.None;
    pcall(function()
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    local v6 = true;
    if l_None_0 ~= Enum.Platform.Windows then
        v6 = l_None_0 == Enum.Platform.OSX;
    end;
    local v7 = true;
    if l_None_0 ~= Enum.Platform.IOS then
        v7 = l_None_0 == Enum.Platform.Android;
    end;
    v7 = v7 or l_None_0 == Enum.Platform.UWP;
    local v8 = true;
    if l_None_0 ~= Enum.Platform.XBox360 then
        v8 = l_None_0 == Enum.Platform.XBoxOne;
    end;
    local l_v8_0 = v8;
    if not l_v8_0 then
        l_v8_0 = true;
        if l_None_0 ~= Enum.Platform.PS3 then
            l_v8_0 = true;
            if l_None_0 ~= Enum.Platform.PS4 then
                l_v8_0 = game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5;
            end;
        end;
    end;
    return if not v6 then v7 and "mobile" or ((l_v8_0 or l_None_0 == Enum.Platform.WiiU) and "console" or v4 .. tostring(l_None_0)) else "client";
end or require(script.Parent.Parent.getPlatformTarget);
local v10 = {};
v10.__index = v10;
v10.new = function(v11)
    local v12 = type(v11);
    local v13 = true;
    if v12 ~= "table" then
        v13 = v12 == "userdata";
    end;
    assert(v13, "Unexpected value for reportingService");
    local v14 = {
        _reporter = v11, 
        _isEnabled = true
    };
    setmetatable(v14, v10);
    return v14;
end;
v10.setEnabled = function(v15, v16)
    assert(type(v16) == "boolean", "Expected isEnabled to be a boolean");
    v15._isEnabled = v16;
end;
v10.setRBXEvent = function(v17, v18, v19, v20)
    local v21 = v3();
    v20 = v20 or {};
    assert(type(v18) == "string", "Expected eventContext to be a string");
    assert(type(v19) == "string", "Expected eventName to be a string");
    assert(type(v20) == "table", "Expected additionalArgs to be a table");
    assert(v17._isEnabled, "This reporting service is disabled");
    v17._reporter:SetRBXEvent(v21, v18, v19, v20);
end;
v10.setRBXEventStream = function(v22, v23, v24, v25)
    local v26 = v3();
    v25 = v25 or {};
    assert(type(v23) == "string", "Expected eventContext to be a string");
    assert(type(v24) == "string", "Expected eventName to be a string");
    assert(type(v25) == "table", "Expected additionalArgs to be a table");
    assert(v22._isEnabled, "This reporting service is disabled");
    v22._reporter:SetRBXEventStream(v26, v23, v24, v25);
end;
v10.releaseRBXEventStream = function(v27)
    assert(v27._isEnabled, "This reporting service is disabled");
    v27._reporter:ReleaseRBXEventStream(v3());
end;
v10.sendEventDeferred = function(v28, v29, v30, v31)
    local v32 = v3();
    v31 = v31 or {};
    assert(type(v29) == "string", "Expected eventContext to be a string");
    assert(type(v30) == "string", "Expected eventName to be a string");
    assert(type(v31) == "table", "Expected additionalArgs to be a table");
    assert(v28._isEnabled, "This reporting service is disabled");
    v28._reporter:SendEventDeferred(v32, v29, v30, v31);
end;
v10.sendEventImmediately = function(v33, v34, v35, v36)
    local v37 = v3();
    v36 = v36 or {};
    assert(type(v34) == "string", "Expected eventContext to be a string");
    assert(type(v35) == "string", "Expected eventName to be a string");
    assert(type(v36) == "table", "Expected additionalArgs to be a table");
    assert(v33._isEnabled, "This reporting service is disabled");
    v33._reporter:SendEventImmediately(v37, v34, v35, v36);
end;
v10.updateHeartbeatObject = function(v38, v39)
    v39 = v39 or {};
    assert(type(v39) == "table", "Expected additionalArgs to be a table");
    assert(v38._isEnabled, "This reporting service is disabled");
    v38._reporter:UpdateHeartbeatObject(v39);
end;
return v10;
