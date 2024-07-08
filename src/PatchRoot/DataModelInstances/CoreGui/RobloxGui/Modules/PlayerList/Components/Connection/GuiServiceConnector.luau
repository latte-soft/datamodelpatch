local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(script.Parent.Parent.Parent.Actions.SetInspectMenuEnabled);
local v5 = require(script.Parent.EventConnection);
local v6 = v2.PureComponent:extend("GuiServiceConnector");
v6.render = function(v7)
    return v2.createFragment({
        InspectMenuEnabledConnection = v2.createElement(v5, {
            event = l_GuiService_0.InspectMenuEnabledChangedSignal, 
            callback = function(v8)
                v7.props.setInspectMenuEnabled(v8);
            end
        })
    });
end;
return v3.connect(nil, function(v9)
    return {
        setInspectMenuEnabled = function(v10)
            return v9(v4(v10));
        end
    };
end)(v6);
