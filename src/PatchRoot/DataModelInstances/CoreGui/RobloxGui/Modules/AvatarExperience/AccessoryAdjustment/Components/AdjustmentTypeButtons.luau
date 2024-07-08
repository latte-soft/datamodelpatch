local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButton);
local v8 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentTypeEnum);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = v2.PureComponent:extend("AdjustmentTypeButtons");
v10.validateProps = v4.strictInterface({
    LayoutOrder = v4.number, 
    adjustmentTypeSelected = v4.userdata
});
v10.render = function(v11)
    return l_withStyle_0(function(v12)
        return v11:renderWithProviders(v12);
    end);
end;
v10.renderWithProviders = function(v13, v14)
    local l_Theme_0 = v14.Theme;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        LayoutOrder = v13.props.LayoutOrder
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        MoveButton = v2.createElement(v7, {
            LayoutOrder = 1, 
            isSelected = v13.props.adjustmentTypeSelected == v8.Position, 
            adjustmentType = v8.Position
        }), 
        Divider1 = v2.createElement("Frame", {
            Size = UDim2.new(0, 1, 1, 0), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            LayoutOrder = 2, 
            Visible = v13.props.adjustmentTypeSelected == v8.Scale
        }), 
        RotateButton = v2.createElement(v7, {
            LayoutOrder = 3, 
            isSelected = v13.props.adjustmentTypeSelected == v8.Rotation, 
            adjustmentType = v8.Rotation
        }), 
        Divider2 = v2.createElement("Frame", {
            Size = UDim2.new(0, 1, 1, 0), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            LayoutOrder = 4, 
            Visible = v13.props.adjustmentTypeSelected == v8.Position
        }), 
        ScaleButton = v2.createElement(v7, {
            LayoutOrder = 5, 
            isSelected = v13.props.adjustmentTypeSelected == v8.Scale, 
            adjustmentType = v8.Scale
        })
    });
end;
return (v3.connect(function(v16, _)
    return {
        adjustmentTypeSelected = v16.AvatarExperience.AccessoryAdjustment.AdjustmentTypeSelected
    };
end, nil)(v10));
