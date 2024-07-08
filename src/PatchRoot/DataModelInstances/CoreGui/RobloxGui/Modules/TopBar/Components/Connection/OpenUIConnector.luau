local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetBackpackOpen);
local v7 = require(l_Parent_0.Actions.SetEmotesOpen);
local v8 = require(l_Parent_0.Actions.SetLeaderboardOpen);
local v9 = require(l_Parent_0.Actions.SetEmotesEnabled);
local v10 = require(l_Parent_0.Parent.Common.EventConnection);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_0.Modules.BackpackScript);
local v13 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v14 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v15 = v2.PureComponent:extend("OpenUIConnector");
v15.validateProps = v4.strictInterface({
    setBackpackOpen = v4.callback, 
    setEmotesOpen = v4.callback, 
    setLeaderboardOpen = v4.callback, 
    setEmotesEnabled = v4.callback
});
v15.didMount = function(v16)
    v16.props.setLeaderboardOpen(v14:GetSetVisible());
    v16.props.setBackpackOpen(v12.IsOpen);
    v16.props.setEmotesOpen(v13:isOpen());
    v16.props.setEmotesEnabled(v13.MenuIsVisible);
end;
v15.render = function(v17)
    return v2.createFragment({
        LeaderboardOpenChangedConnection = v2.createElement(v10, {
            event = v14:GetSetVisibleChangedEvent().Event, 
            callback = function(v18)
                v17.props.setLeaderboardOpen(v18);
            end
        }), 
        BackpackOpenChangedConnection = v2.createElement(v10, {
            event = v12.StateChanged.Event, 
            callback = function(v19)
                v17.props.setBackpackOpen(v19);
            end
        }), 
        EmotesOpenChangedConnection = v2.createElement(v10, {
            event = v13.EmotesMenuToggled.Event, 
            callback = function(v20)
                v17.props.setEmotesOpen(v20);
            end
        }), 
        EmotesEnabledChangedConnection = v2.createElement(v10, {
            event = v13.MenuVisibilityChanged.Event, 
            callback = function(v21)
                v17.props.setEmotesEnabled(v21);
            end
        })
    });
end;
return v3.UNSTABLE_connect2(nil, function(v22)
    return {
        setBackpackOpen = function(v23)
            return v22(v6(v23));
        end, 
        setEmotesOpen = function(v24)
            return v22(v7(v24));
        end, 
        setLeaderboardOpen = function(v25)
            return v22(v8(v25));
        end, 
        setEmotesEnabled = function(v26)
            return v22(v9(v26));
        end
    };
end)(v15);
