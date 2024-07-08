local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = v2.PureComponent:extend("VngComplianceLoadingPopup");
local l_LoadingSpinner_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadingSpinner;
v4.render = function(v6)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v6.props.screenSize.Y), 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.new(0.5, 0, 0.5, 0)
        })
    });
end;
return (v3.connect(function(v7)
    return {
        screenSize = v7.ScreenSize
    };
end, function(_)
end)(v4));
