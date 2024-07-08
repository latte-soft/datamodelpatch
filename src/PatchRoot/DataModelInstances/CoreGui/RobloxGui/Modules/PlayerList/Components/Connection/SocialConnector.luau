local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(script.Parent.Parent.Parent.Actions.SetPlayerFriendStatus);
local v5 = require(script.Parent.EventConnection);
local v6 = v2.PureComponent:extend("SocialConnector");
v6.didMount = function(v7)
    v7.mounted = true;
end;
v6.render = function(v8)
    return v2.createFragment({
        FriendStatusChangedConnection = v2.createElement(v5, {
            event = l_Players_0.LocalPlayer.FriendStatusChanged, 
            callback = function(v9, v10)
                v8.props.setPlayerFriendStatus(v9, v10);
            end
        })
    });
end;
v6.willUnmount = function(v11)
    v11.mounted = false;
end;
return v3.connect(nil, function(v12)
    return {
        setPlayerFriendStatus = function(v13, v14)
            return v12(v4(v13, v14));
        end
    };
end)(v6);
