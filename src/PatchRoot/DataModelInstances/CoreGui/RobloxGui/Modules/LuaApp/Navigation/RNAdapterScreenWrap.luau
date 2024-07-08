local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact);
local v1 = v0.PureComponent:extend("RNAdapterScreenWrap");
v1.render = function(v2)
    local l_component_0 = v2.props.component;
    local l_props_0 = v2.props.props;
    local l_isVisible_0 = v2.props.isVisible;
    local v6 = true;
    if l_isVisible_0 ~= nil then
        v6 = l_isVisible_0;
    end;
    return v0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        BorderSizePixel = 0, 
        Visible = v6
    }, {
        ConstructedScreen = v0.createElement(l_component_0, l_props_0)
    });
end;
return v1;
