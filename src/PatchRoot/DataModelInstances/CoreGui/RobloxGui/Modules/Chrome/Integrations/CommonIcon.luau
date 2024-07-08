local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v2.App.ImageSet.Images;
local v6 = require(script.Parent.Parent.Unibar.Constants);
local _ = require(script.Parent.Parent.Service.ChromeUtils);
local v8 = require(script.Parent.Parent.Hooks.useMappedSignal);
local v9 = UDim2.new(0, v6.ICON_SIZE, 0, v6.ICON_SIZE);
CommonIconComponent = function(v10)
    local v11 = not not v10.activeSignalValue and (v8(v10.activeSignalValue) or false);
    local l_icon_0 = v10.icon;
    if not (not v11 or not v10.iconOn) then
        l_icon_0 = v10.iconOn;
    end;
    if typeof(l_icon_0) == "string" and l_icon_0:sub(1, 11) ~= "rbxasset://" then
        l_icon_0 = l_Images_0[l_icon_0];
    end;
    local v13 = l_useStyle_0();
    return v1.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = l_icon_0, 
        Size = v9, 
        ImageColor3 = v13.Theme.IconEmphasis.Color, 
        ImageTransparency = v13.Theme.IconEmphasis.Transparency
    });
end;
CommonIcon = function(v14, v15, v16)
    return v1.createElement(CommonIconComponent, {
        icon = v14, 
        iconOn = v15, 
        activeSignalValue = v16
    });
end;
return CommonIcon;
