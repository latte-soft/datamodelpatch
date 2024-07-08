local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common.PerfUtils);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetMenuOpen);
local v8 = require(l_Parent_0.Actions.SetRespawnBehaviour);
local v9 = require(l_Parent_0.Parent.Common.EventConnection);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v12 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local v13 = v3.PureComponent:extend("MenuConnector");
v13.validateProps = v5.strictInterface({
    setMenuOpen = v5.callback, 
    setRespawnBehaviour = v5.callback
});
v13.didMount = function(v14)
    if not v11() then
        local v15 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v14.props.setMenuOpen(v15:GetVisibility());
        local l_v15_RespawnBehaviour_0, v17 = v15:GetRespawnBehaviour();
        v14.props.setRespawnBehaviour(l_v15_RespawnBehaviour_0, v17);
        return ;
    else
        local v18 = require(l_RobloxGui_0.Modules.InGameMenuInit);
        v14.props.setMenuOpen(v18.getOpen());
        local v19, v20 = v18.getRespawnBehaviour();
        v14.props.setRespawnBehaviour(v19, v20);
        return ;
    end;
end;
v13.render = function(v21)
    if not v11() then
        local v22 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        return v3.createFragment({
            MenuOpenChangedConnection = v3.createElement(v9, {
                event = v22.SettingsShowEvent.Event, 
                callback = function(v23)
                    if not (not v12() or not v23) then
                        v2.menuOpenBegin();
                    end;
                    v21.props.setMenuOpen(v23);
                end
            }), 
            RespawnBehaviourConnection = v3.createElement(v9, {
                event = v22.RespawnBehaviourChangedEvent.Event, 
                callback = function(v24, v25)
                    v21.props.setRespawnBehaviour(v24, v25);
                end
            })
        });
    else
        local v26 = require(l_RobloxGui_0.Modules.InGameMenuInit);
        local v27 = v26.getOpenChangedEvent();
        local _ = nil;
        return v3.createFragment({
            MenuOpenChangedConnection = v3.createElement(v9, {
                event = v27.Event, 
                callback = function(v29)
                    v21.props.setMenuOpen(v29);
                end
            }), 
            RespawnBehaviourConnection = v3.createElement(v9, {
                event = v26.getRespawnBehaviourChangedEvent().Event, 
                callback = function(v30, v31)
                    v21.props.setRespawnBehaviour(v30, v31);
                end
            })
        });
    end;
end;
return v4.UNSTABLE_connect2(nil, function(v32)
    return {
        setMenuOpen = function(v33)
            return v32(v7(v33));
        end, 
        setRespawnBehaviour = function(v34, v35)
            return v32(v8(v34, v35));
        end or nil
    };
end)(v13);
