local l_AddFriends_0 = script:FindFirstAncestor("FriendsLanding").AddFriends;
local v1 = require(l_AddFriends_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local v4 = require(l_AddFriends_0.Constants);
local v5 = require(script.mapDispatchToProps);
local v6 = require(script.getTencentAuthInfo);
local v7 = l_Roact_0.Component:extend("TencentAuthInfoEventReceiver");
v7.init = function(v8)
    v8.connections = {
        v8.props.RobloxEventReceiver:observeEvent(v4.TENCENT_AUTH_INFO_SYNC_EVENT, function(v9, _)
            v8.props.setTencentAuthInfo((v6(v9)));
        end)
    };
end;
v7.render = function(_)
end;
v7.willUnmount = function(v12)
    for _, v14 in pairs(v12.connections) do
        v14:disconnect();
    end;
end;
return l_RoactRodux_0.connect(nil, v5)(v7);
