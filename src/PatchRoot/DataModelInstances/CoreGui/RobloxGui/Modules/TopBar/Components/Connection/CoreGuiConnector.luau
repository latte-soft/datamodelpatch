local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.UpdateCoreGuiEnabled);
local v7 = require(l_Parent_0.Parent.Common.EventConnection);
local v8 = v2.PureComponent:extend("CoreGuiConnector");
v8.validateProps = v4.strictInterface({
    updateCoreGuiEnabled = v4.callback
});
v8.didMount = function(v9)
    for _, v11 in ipairs((Enum.CoreGuiType:GetEnumItems())) do
        if v11 ~= Enum.CoreGuiType.All then
            v9.props.updateCoreGuiEnabled(v11, l_StarterGui_0:GetCoreGuiEnabled(v11));
        end;
    end;
end;
v8.render = function(v12)
    return v2.createFragment({
        CoreGuiChangedConnection = v2.createElement(v7, {
            event = l_StarterGui_0.CoreGuiChangedSignal, 
            callback = function(v13, v14)
                v12.props.updateCoreGuiEnabled(v13, v14);
            end
        })
    });
end;
return v3.UNSTABLE_connect2(nil, function(v15)
    return {
        updateCoreGuiEnabled = function(v16, v17)
            return v15(v6(v16, v17));
        end
    };
end)(v8);
