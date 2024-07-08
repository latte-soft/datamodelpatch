local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_SystemSlider_0 = v5.App.Slider.SystemSlider;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v5.App.Constant.IconSize;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType);
local v13 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentSliders);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = {
    [v12.PositionX] = l_Images_0["icons/menu/adjust/positionX"], 
    [v12.PositionY] = l_Images_0["icons/menu/adjust/positionY"], 
    [v12.PositionZ] = l_Images_0["icons/menu/adjust/positionZ"], 
    [v12.RotationX] = l_Images_0["icons/menu/adjust/rotationX"], 
    [v12.RotationY] = l_Images_0["icons/menu/adjust/rotationY"], 
    [v12.RotationZ] = l_Images_0["icons/menu/adjust/rotationZ"], 
    [v12.Scale] = l_Images_0["icons/menu/adjust/scale"]
};
local v16 = v2.PureComponent:extend("AdjustmentSlider");
v16.validateProps = v4.strictInterface({
    LayoutOrder = v4.number, 
    adjustmentSliderType = v4.userdata, 
    adjustmentTypeSelected = v4.userdata, 
    sliderInfo = v4.optional(v4.table), 
    selectedAccessory = v4.optional(v4.string), 
    setAdjustmentSliders = v4.callback
});
v16.init = function(v17)
    v17.onValueChanged = function(v18)
        v17.props.setAdjustmentSliders(v17.props.adjustmentSliderType, v17.props.selectedAccessory, v18);
    end;
end;
v16.render = function(v19)
    return l_withStyle_0(function(v20)
        return v19:renderWithProviders(v20);
    end);
end;
v16.renderWithProviders = function(v21, v22)
    local l_Theme_0 = v22.Theme;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = 1, 
        LayoutOrder = v21.props.LayoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 24), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        SliderImage = v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v15[v21.props.adjustmentSliderType], 
            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency
        }), 
        Slider = v2.createElement(l_SystemSlider_0, {
            min = -100, 
            max = 100, 
            stepInterval = 1, 
            value = not not v21.props.sliderInfo and v21.props.sliderInfo[v21.props.adjustmentSliderType] or 0, 
            onValueChanged = v21.onValueChanged, 
            width = UDim.new(0.75, -24), 
            layoutOrder = 2
        })
    });
end;
return (v3.connect(function(v24, _)
    local l_AdjustmentTypeSelected_0 = v24.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected;
    local l_SelectedAccessory_0 = v24.AvatarExperience.AccessoryAdjustment.SelectedAccessory;
    return {
        adjustmentTypeSelected = l_AdjustmentTypeSelected_0, 
        selectedAccessory = l_SelectedAccessory_0, 
        sliderInfo = l_SelectedAccessory_0 and v24.AvatarExperience.AccessoryAdjustment.AdjustmentSliders[l_SelectedAccessory_0]
    };
end, function(v28)
    return {
        setAdjustmentSliders = function(v29, v30, v31)
            v28(v13(v29, v30, v31));
        end
    };
end)(v16));
