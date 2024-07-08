local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingSpinner_0 = v2.App.Loading.LoadingSpinner;
local l_useStyle_0 = v2.Core.Style.useStyle;
return function()
    local v5 = l_useStyle_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v5.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v5.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0
    }, {
        LoadingSpinner = v1.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    });
end;
