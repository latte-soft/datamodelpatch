local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_BadgeStates_0 = v4.App.Indicator.Enum.BadgeStates;
local l_Badge_0 = v4.App.Indicator.Badge;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v13 = require(l_Modules_0.LuaApp.Util.SystemBarLabelTextSizeBinding);
local v14 = l_getIconSize_0(l_IconSize_0.Medium);
local v15 = ((v14 + 8) - v14) / 2;
return function(v16)
    local v17 = l_useStyle_0();
    local l_selected_0 = v16.selected;
    local l_pressed_0 = v16.pressed;
    local l_icon_0 = v16.icon;
    local v21 = v13.default:getBinding();
    local v22 = not not l_selected_0 and l_icon_0.on or l_icon_0.off;
    local v23 = l_useLocalization_0({
        label = v16.label
    }).label or "";
    v3.useEffect(function()
        v13.default:getMinTextSize(v23, v17.Font.Header2.Font, Vector2.new(62, 12));
    end, {
        v23, 
        v21, 
        v17
    });
    local l_badgeValue_0 = v16.badgeValue;
    local v25 = nil;
    if not v16.badgeValue then
        v25 = false;
    elseif v16.badgeValue == l_BadgeStates_0.isEmpty then
        v25 = true;
    else
        local v26 = tonumber(l_badgeValue_0) or 0;
        local v27 = true;
        if type(l_badgeValue_0) ~= "string" then
            v27 = v26 > 0;
        end;
        v25 = v27;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        Icon = v3.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            Position = UDim2.fromOffset(math.floor(v15 + 0.5), 12), 
            Size = UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            Image = l_Images_0[string.gsub(v22, "^LuaApp/", "")], 
            ImageColor3 = v17.Theme.IconDefault.Color, 
            ImageTransparency = not l_pressed_0 and 0 or 0.5
        }, {
            Badge = not not v25 and v3.createElement(l_Badge_0, {
                position = if l_badgeValue_0 == l_BadgeStates_0.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2), 
                value = l_badgeValue_0
            }) or nil
        }), 
        IconText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 12), 
            Text = v23, 
            BackgroundTransparency = 1, 
            TextColor3 = not not l_selected_0 and v17.Theme.TextEmphasis.Color or v17.Theme.TextDefault.Color, 
            Font = v17.Font.Header2.Font, 
            TextSize = v21, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextTransparency = v17.Theme.TextDefault.Transparency, 
            BorderSizePixel = 0
        })
    });
end;
