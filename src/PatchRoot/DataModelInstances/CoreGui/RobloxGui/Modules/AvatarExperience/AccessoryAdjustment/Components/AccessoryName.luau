local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v4.Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v12 = v2.PureComponent:extend("AccessoryName");
v12.validateProps = v5.strictInterface({
    LayoutOrder = v5.number, 
    name = v5.string
});
v12.render = function(v13)
    return l_withStyle_0(function(v14)
        return v13:renderWithProviders(v14);
    end);
end;
v12.renderWithProviders = function(v15, v16)
    local l_Theme_0 = v16.Theme;
    local l_Font_0 = v16.Font;
    return v2.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_0.Header1.Font, 
        LayoutOrder = v15.props.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v15.props.name, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
        TextColor3 = l_Theme_0.TextEmphasis.Color, 
        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
end;
return (v3.connect(function(v19, _)
    local l_SelectedAccessory_0 = v19.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
    if not v11 then
        local v22 = v9(v19.AvatarExperience.Common, l_SelectedAccessory_0, v8.ItemType.Asset);
        return {
            name = not not v22 and v22.name or ""
        };
    else
        local v23 = "";
        if l_SelectedAccessory_0 then
            local v24 = v19.AvatarExperience.Common.AssetInfos[l_SelectedAccessory_0];
            if not (not v24 or not v24.name) then
                v23 = v24.name;
            end;
        end;
        return {
            name = v23
        };
    end;
end, nil)(v12));
