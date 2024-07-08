local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = game:GetService("UserInputService");
local _ = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v7 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent;
local v9 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v11 = {};
v11.__index = v11;
v11.new = function()
    local v12 = setmetatable({
        _target = "client", 
        _context = "topbar", 
        _defaultProps = {
            universeid = tostring(game.GameId), 
            placeid = tostring(game.PlaceId), 
            sessionid = l_RbxAnalyticsService_0:GetSessionId()
        }
    }, v11);
    if l_game_EngineFeature_0 then
        v12._defaultProps.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    v12._sendEvent = function(v13, v14)
        l_RbxAnalyticsService_0:SendEventDeferred(v12._target, v12._context, v13, (v7.Dictionary.join(v12._defaultProps, v14 or {})));
        return nil;
    end;
    v12._onButtonActivated = function(v15, v16)
        return v12._sendEvent(v9.Analytics.EventNameTopBarButtonActivated, {
            button = v15, 
            status = if not v16 then v9.Analytics.StatusInactive else v9.Analytics.StatusActive
        });
    end;
    return v12;
end;
v11.onChatButtonActivated = function(v17, v18)
    return v17._onButtonActivated(v9.Analytics.ChatButtonName, v18);
end;
v11.onMoreMenuActivated = function(v19)
    return v19._onButtonActivated(v9.Analytics.MoreMenuButtonName, true);
end;
v11.onInventoryActivated = function(v20, v21)
    return v20._onButtonActivated(v9.Analytics.InventoryButtonName, v21);
end;
v11.onLeaderboardActivated = function(v22, v23)
    return v22._onButtonActivated(v9.Analytics.LeaderboardButtonName, v23);
end;
v11.onEmotesActivated = function(v24, v25)
    return v24._onButtonActivated(v9.Analytics.EmotesButtonName, v25);
end;
v11.default = v11.new();
return v11;
