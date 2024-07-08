debugPrint = function(_)
end;
debugPrint("Self View Analytics 10-19-2022__1");
local v1 = game:DefineFastFlag("AvatarChatIncludeSelfViewOnTelemetry", false);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v5 = {};
v5.__index = v5;
v5.INFO = "info";
v5.WARNING = "warning";
v5.ERROR = "error";
local v6 = "SelfView";
v5.new = function(v7)
    if not v7 then
        v7 = l_RbxAnalyticsService_0;
    end;
    assert(v7, "Analytics impl must not be nil.");
    return (setmetatable({
        _impl = v7
    }, v5));
end;
local function v8()
end;
v5.stubService = function()
    return {
        SetRBXEvent = v8, 
        SetRBXEventStream = v8, 
        SendEventDeferred = v8, 
        ReportCounter = v8, 
        ReportStats = v8, 
        ReportInfluxSeries = v8, 
        GetSessionId = v8
    };
end;
v5.setImpl = function(v9, v10)
    v9._impl = v10;
end;
v5._report = function(v11, v12, v13, _, v15)
    local v16 = "client";
    if l_RunService_0:IsStudio() then
        v16 = "studio";
    end;
    v11._impl:SendEventDeferred(v16, v12, v13, v15);
end;
v5.reportMicState = function(v17, v18)
    debugPrint("Self View: Analytics:reportMicState, newState: " .. tostring(v18) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(l_Players_0.LocalPlayer.UserId) .. ",sessionid: " .. tostring(v17._impl:GetSessionId()));
    v17:_report(v6, "inExperienceMicState", tostring(v18), {
        state = v18, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        sessionid = tostring(v17._impl:GetPlaySessionId())
    });
end;
v5.reportCamState = function(v19, v20)
    debugPrint("Self View: Analytics:reporCamState, newState: " .. tostring(v20) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(l_Players_0.LocalPlayer.UserId) .. ",sessionid: " .. tostring(v19._impl:GetSessionId()));
    v19:_report(v6, "inExperienceCamState", tostring(v20), {
        state = v20, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        sessionid = tostring(v19._impl:GetPlaySessionId())
    });
end;
v5.reportSelfViewEnabledInCoreGuiState = function(v21, v22)
    debugPrint("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. tostring(v22) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v21._impl:GetSessionId()));
    v21:_report("SelfView", "enabledinCoreGuiState", tostring(v22), {
        state = v22, 
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v21._impl:GetPlaySessionId())
    });
end;
v5.reportSelfViewSessionStarted = function(v23, v24, v25, v26, v27, v28, v29, v30, v31)
    debugPrint("Self View: Analytics:reportSelfViewSessionStarted,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v23._impl:GetSessionId()) .. ",x: " .. tostring(v24) .. ",y: " .. tostring(v25) .. ",width: " .. tostring(v26) .. ",height: " .. tostring(v27) .. ",x_relative: " .. tostring(v28) .. ",y_relative: " .. tostring(v29) .. ",width_relative: " .. tostring(v30) .. ",height_relative: " .. tostring(v31));
    v23:_report("SelfView", "sessionStarted", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v23._impl:GetPlaySessionId()), 
        x = tostring(v24), 
        y = tostring(v25), 
        width = tostring(v26), 
        height = tostring(v27), 
        x_relative = tostring(v28), 
        y_relative = tostring(v29), 
        width_relative = tostring(v30), 
        height_relative = tostring(v31)
    });
    if v1 then
        l_RbxAnalyticsService_0:AddGlobalPointsField("feature/avatarChat/selfViewOn", 1);
    end;
end;
v5.reportSelfViewSessionStopped = function(v32)
    debugPrint("Self View: Analytics:reportSelfViewSessionStopped,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v32._impl:GetSessionId()));
    v32:_report("SelfView", "sessionStopped", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v32._impl:GetPlaySessionId())
    });
    if v1 then
        l_RbxAnalyticsService_0:AddGlobalPointsField("feature/avatarChat/selfViewOn", 0);
    end;
end;
v5.reportUserAccountSettings = function(v33, v34, v35)
    debugPrint("Self View: Analytics:reportUserAccountSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v33._impl:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(v34) .. ",userAccount_audioEnabled: " .. tostring(v35));
    v33:_report("SelfView", "userAccountSettings", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v33._impl:GetPlaySessionId()), 
        videoenabled = tostring(v34), 
        audioenabled = tostring(v35)
    });
end;
v5.reportExperienceSettings = function(v36, v37, v38, v39)
    debugPrint("Self View: Analytics:reportExperienceSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(v36._impl:GetSessionId()) .. ",experienceSettings_placeEnabled: " .. tostring(v37) .. ",experienceSettings_videoEnabled: " .. tostring(v38) .. ",experienceSettings_audioEnabled: " .. tostring(v39));
    v36:_report("SelfView", "experienceSettings", "true", {
        universeid = tostring(game.GameId), 
        pid = tostring(game.PlaceId), 
        sessionid = tostring(v36._impl:GetPlaySessionId()), 
        placeenabled = tostring(v37), 
        videoenabled = tostring(v38), 
        audioenabled = tostring(v39)
    });
end;
v5.setLastCtx = function(_, v41)
    v6 = v41;
end;
return v5;
