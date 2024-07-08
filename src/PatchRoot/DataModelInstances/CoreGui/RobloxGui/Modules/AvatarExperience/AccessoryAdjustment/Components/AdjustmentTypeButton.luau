local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v5.Style.withStyle;
local l_IconSize_0 = v5.App.Constant.IconSize;
local v10 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAdjustmentType);
local v11 = l_Images_0["icons/placeholder/placeholderOn"];
local v12 = v2.PureComponent:extend("AdjustmentTypeButton");
v12.validateProps = v4.strictInterface({
    LayoutOrder = v4.number, 
    adjustmentType = v4.userdata, 
    isSelected = v4.optional(v4.boolean), 
    setAdjustmentType = v4.callback
});
v12.defaultProps = {
    isSelected = false
};
v12.init = function(v13)
    v13.setAdjustmentType = function()
        v13.props.setAdjustmentType(v13.props.adjustmentType);
    end;
end;
v12.render = function(v14)
    return l_withStyle_0(function(v15)
        return v14:renderWithProviders(v15);
    end);
end;
v12.renderWithProviders = function(v16, v17)
    local l_Theme_0 = v17.Theme;
    local l_Color_0 = l_Theme_0.BackgroundUIDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundUIDefault.Transparency;
    if v16.props.isSelected then
        l_Color_0 = l_Theme_0.UIDefault.Color;
        l_Transparency_0 = l_Theme_0.UIDefault.Transparency;
    end;
    return v2.createElement("ImageButton", {
        Size = UDim2.fromScale(0.3333333333333333, 1), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        LayoutOrder = v16.props.LayoutOrder, 
        [v2.Event.Activated] = v16.setAdjustmentType
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Image = v2.createElement(l_ImageSetButton_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            BackgroundTransparency = 1, 
            Image = v11, 
            ImageColor3 = l_Theme_0.IconDefault.Color, 
            ImageTransparency = l_Theme_0.IconDefault.Transparency
        })
    });
end;
return (v3.connect(nil, function(v21)
    return {
        setAdjustmentType = function(v22)
            v21(v10(v22));
        end
    };
end)(v12));
