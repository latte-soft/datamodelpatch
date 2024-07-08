local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_BlockedStatusChangedEvent_0 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.BlockingUtility):GetBlockedStatusChangedEvent();
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.SetPerformanceStatsVisible);
local v9 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v10 = require(script.Parent.EventConnection);
local v11 = v3.PureComponent:extend("CoreGuiConnector");
v11.didMount = function(v12)
    v12.props.setPerformanceStatsVisible(l_UserGameSettings_0.PerformanceStatsVisible);
end;
v11.render = function(v13)
    return v3.createFragment({
        PerformanceStatsChangedConnection = v3.createElement(v10, {
            event = l_UserGameSettings_0.PerformanceStatsVisibleChanged, 
            callback = function(v14)
                v13.props.setPerformanceStatsVisible(v14);
            end
        }), 
        BlockedStatusChangedConnection = v3.createElement(v10, {
            event = l_BlockedStatusChangedEvent_0, 
            callback = function(v15, v16)
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v15);
                if l_l_Players_0_PlayerByUserId_0 then
                    v13.props.setPlayerIsBlocked(l_l_Players_0_PlayerByUserId_0, v16);
                end;
            end
        })
    });
end;
return v4.connect(nil, function(v18)
    return {
        setPerformanceStatsVisible = function(v19)
            return v18(v8(v19));
        end, 
        setPlayerIsBlocked = function(v20, v21)
            return v18(v9(v20, v21));
        end
    };
end)(v11);
