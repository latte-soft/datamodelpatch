local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSlider);
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v9 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentTypeEnum);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v11 = v2.PureComponent:extend("AdjustmentSliders");
v11.validateProps = v4.strictInterface({
    LayoutOrder = v4.number, 
    adjustmentTypeSelected = v4.userdata
});
v11.getSliders = function(v12)
    local v13 = {};
    if v12.props.adjustmentTypeSelected == v9.Position then
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 1, 
            adjustmentSliderType = v8.PositionX
        }));
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 2, 
            adjustmentSliderType = v8.PositionY
        }));
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 3, 
            adjustmentSliderType = v8.PositionZ
        }));
        return v13;
    elseif v12.props.adjustmentTypeSelected == v9.Rotation then
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 1, 
            adjustmentSliderType = v8.RotationX
        }));
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 2, 
            adjustmentSliderType = v8.RotationY
        }));
        table.insert(v13, v2.createElement(v7, {
            LayoutOrder = 3, 
            adjustmentSliderType = v8.RotationZ
        }));
        return v13;
    else
        if v12.props.adjustmentTypeSelected == v9.Scale then
            table.insert(v13, v2.createElement(v7, {
                LayoutOrder = 1, 
                adjustmentSliderType = v8.Scale
            }));
        end;
        return v13;
    end;
end;
v11.render = function(v14)
    return l_withStyle_0(function(v15)
        return v14:renderWithProviders(v15);
    end);
end;
v11.renderWithProviders = function(v16, v17)
    local l_Theme_0 = v17.Theme;
    local v19 = v16:getSliders();
    v19.UIListLayout = v2.createElement("UIListLayout", {
        Padding = UDim.new(0, 24), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    });
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.props.LayoutOrder
    }, v19);
end;
return (v3.connect(function(v20, _)
    return {
        adjustmentTypeSelected = v20.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected
    };
end, nil)(v11));
