local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.AddPlayer);
local v6 = require(l_Parent_0.Actions.RemovePlayer);
local v7 = require(l_Parent_0.Thunks.MakePlayerInfoRequests);
local v8 = require(script.Parent.EventConnection);
local v9 = v2.PureComponent:extend("PlayerServiceConnector");
v9.didMount = function(v10)
    for _, v12 in ipairs((l_Players_0:GetPlayers())) do
        v10.props.addPlayer(v12);
        v10.props.makePlayerInfoRequests(v12);
    end;
end;
v9.render = function(v13)
    return v2.createFragment({
        PlayerAddedConnection = v2.createElement(v8, {
            event = l_Players_0.PlayerAdded, 
            callback = function(v14)
                v13.props.addPlayer(v14);
                v13.props.makePlayerInfoRequests(v14);
            end
        }), 
        PlayerRemovingConnection = v2.createElement(v8, {
            event = l_Players_0.PlayerRemoving, 
            callback = function(v15)
                v13.props.removePlayer(v15);
            end
        })
    });
end;
v9.willUnmount = function(v16)
    for _, v18 in ipairs((l_Players_0:GetPlayers())) do
        v16.props.removePlayer(v18);
    end;
end;
return v3.connect(nil, function(v19)
    return {
        addPlayer = function(v20)
            return v19(v5(v20));
        end, 
        makePlayerInfoRequests = function(v21)
            return v19(v7(v21));
        end, 
        removePlayer = function(v22)
            return v19(v6(v22));
        end
    };
end)(v9);
