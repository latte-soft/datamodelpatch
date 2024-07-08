local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
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
            l_v9_0 = l_None_0 == Enum.Platform.PS4;
        end;
    end;
    return if not v7 then v8 and "mobile" or ((l_v9_0 or l_None_0 == Enum.Platform.WiiU) and "console" or v5 .. tostring(l_None_0)) else "client";
end or require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget;
return function(v11, v12, v13)
    assert(type(v11) == "string", "Expected eventContext to be a string");
    assert(type(v12) == "string", "Expected eventName to be a string");
    assert(type(v13) == "table", "Expected eventTable to be a table");
    local v14 = v4();
    if not v13 then
        v13 = {};
    end;
    v13.universeId = tostring(game.GameId);
    l_EventIngestService_0:sendEventDeferred(v14, v11, v12, v13);
end;
