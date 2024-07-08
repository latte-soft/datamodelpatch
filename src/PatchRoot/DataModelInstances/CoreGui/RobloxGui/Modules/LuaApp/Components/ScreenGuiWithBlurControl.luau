local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = v2.PureComponent:extend("ScreenGuiWithBlurControl");
v4.render = function(v5)
    local l_hasScreenGuiBlur_0 = v5.props.hasScreenGuiBlur;
    local l_blurDisplayOrder_0 = v5.props.blurDisplayOrder;
    local l_DisplayOrder_0 = v5.props.DisplayOrder;
    local v9 = false;
    if l_hasScreenGuiBlur_0 and l_blurDisplayOrder_0 <= l_DisplayOrder_0 then
        v9 = true;
    end;
    return v2.createElement("ScreenGui", (v1.Dictionary.join(v5.props, {
        hasScreenGuiBlur = v1.None, 
        blurDisplayOrder = v1.None, 
        OnTopOfCoreBlur = v9
    })));
end;
return (v3.connect(function(v10, _)
    return {
        hasScreenGuiBlur = v10.ScreenGuiBlur.hasBlur, 
        blurDisplayOrder = v10.ScreenGuiBlur.blurDisplayOrder
    };
end)(v4));
