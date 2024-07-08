local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Luobu.Models.TencentAuthInfoModel);
local v4 = require(l_Modules_0.Luobu.Actions.SetTencentAuthInfo);
local _ = require(l_Modules_0.Luobu.Enum.TencentAuthType);
local v6 = v1.Component:extend("TencentAuthInfoEventReceiver");
v6.init = function(v7)
    v7.connections = {
        v7.props.RobloxEventReceiver:observeEvent("SyncTencentAuthInfo", function(v8, _)
            v7.props.setTencentAuthInfo((v3.fromJsonData(v8)));
        end)
    };
end;
v6.render = function(_)
end;
v6.willUnmount = function(v11)
    for _, v13 in pairs(v11.connections) do
        v13:disconnect();
    end;
end;
return (v2.connect(nil, function(v14)
    return {
        setTencentAuthInfo = function(v15)
            return v14(v4(v15));
        end
    };
end)(v6));
