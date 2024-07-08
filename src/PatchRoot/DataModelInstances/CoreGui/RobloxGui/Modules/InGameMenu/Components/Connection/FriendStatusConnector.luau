local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetFriendStatus);
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = l_Roact_0.PureComponent:extend("FriendStatusConnector");
v8.init = function(v9)
    v9.state = {
        localPlayer = l_Players_0.LocalPlayer
    };
end;
v8.render = function(v10)
    local v13 = {
        PlayerAdded = l_Roact_0.createElement(v7, {
            event = l_Players_0.PlayerAdded, 
            callback = function(v11)
                if v11 == l_Players_0.LocalPlayer then
                    v10:setState({
                        localPlayer = v11
                    });
                    return ;
                else
                    v10.props.setFriendStatus(v11.UserId, Enum.FriendStatus.Unknown);
                    return ;
                end;
            end
        }), 
        PlayerRemoving = l_Roact_0.createElement(v7, {
            event = l_Players_0.PlayerRemoving, 
            callback = function(v12)
                v10.props.setFriendStatus(v12.UserId, nil);
            end
        })
    };
    if v10.state.localPlayer then
        v13.FriendStatusChanged = l_Roact_0.createElement(v7, {
            event = l_Players_0.LocalPlayer.FriendStatusChanged, 
            callback = function(v14, v15)
                v10.props.setFriendStatus(v14.UserId, v15);
            end
        });
    end;
    return l_Roact_0.createFragment(v13);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16)
    return {
        setFriendStatus = function(v17, v18)
            return v16(v6(v17, v18));
        end
    };
end)(v8);
