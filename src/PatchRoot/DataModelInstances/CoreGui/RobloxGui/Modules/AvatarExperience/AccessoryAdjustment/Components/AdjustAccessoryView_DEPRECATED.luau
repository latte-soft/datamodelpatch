local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = v4.Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButtons);
local v9 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSliders);
local v10 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentBottomSection);
local _ = require(l_Modules_0.LuaApp.RootState);
local v12 = v2.PureComponent:extend("AdjustAccessoryView");
v12.validateProps = v5.strictInterface({});
v12.render = function(v13)
    return l_withStyle_0(function(v14)
        return v13:renderWithProviders(v14);
    end);
end;
v12.renderWithProviders = function(_, v16)
    local l_Theme_0 = v16.Theme;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        AdjustmentTypeButtons = v2.createElement(v8, {
            LayoutOrder = 2
        }), 
        AdjustmentSliders = v2.createElement(v9, {
            LayoutOrder = 3
        }), 
        AdjustmentBottomSection = v2.createElement(v10, {
            LayoutOrder = 4
        })
    });
end;
return (v3.connect(function(_, _)
    return {};
end, function(_)
    return {};
end)(v12));
