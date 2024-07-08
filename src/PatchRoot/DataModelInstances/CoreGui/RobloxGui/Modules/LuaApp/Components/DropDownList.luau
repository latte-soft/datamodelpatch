local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = l_Modules_0.LuaApp;
local v4 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local v8 = require(l_Modules_0.LuaApp.Components.ContextualMenu);
local v9 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v10 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GRAY1_0 = v6.Color.GRAY1;
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_GRAY1_1 = v6.Color.GRAY1;
local l_SourceSans_1 = Enum.Font.SourceSans;
local v16 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v17 = {
    Image = "LuaApp/buttons/buttonStroke", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v18 = v4.Component:extend("DropDownList");
v18.defaultProps = {
    height = 38, 
    itemHeight = 54, 
    itemTextColor = l_GRAY1_1, 
    itemFont = l_SourceSans_1, 
    itemTextSize = 23, 
    size = UDim2.new(1, 0, 0, 38), 
    textColor = l_GRAY1_0, 
    font = l_SourceSans_0, 
    textSize = 18
};
v18.init = function(v19)
    v19.state = {
        isOpen = false
    };
    v19.onActivated = function(v20)
        local v21 = 0;
        local v22 = 0;
        local l_v20_FirstAncestorOfClass_0 = v20:FindFirstAncestorOfClass("ScreenGui");
        if l_v20_FirstAncestorOfClass_0 ~= nil then
            v21 = l_v20_FirstAncestorOfClass_0.AbsoluteSize.x;
            v22 = l_v20_FirstAncestorOfClass_0.AbsoluteSize.y;
        end;
        v19:setState({
            isOpen = true, 
            screenShape = {
                x = v20.AbsolutePosition.x, 
                y = v20.AbsolutePosition.y, 
                width = v20.AbsoluteSize.x, 
                height = v20.AbsoluteSize.y, 
                parentWidth = if not l_IsVRAppBuild_0() then v21 else l_VRConstants_0.MainScreenResolution.x, 
                parentHeight = if not l_IsVRAppBuild_0() then v22 else l_VRConstants_0.MainScreenResolution.y
            }
        });
    end;
    v19.callbackCancel = function()
        v19:setState({
            isOpen = false
        });
    end;
    v19.callbackSelect = function(v24, v25)
        v19:setState({
            isOpen = false
        });
        if not v19.props.onSelected then
            return ;
        else
            return v19.props.onSelected(v24, v25);
        end;
    end;
end;
v18.render = function(v26)
    local l_position_0 = v26.props.position;
    local l_anchorPoint_0 = v26.props.anchorPoint;
    local l_height_0 = v26.props.height;
    local l_items_0 = v26.props.items;
    local l_itemSelected_0 = v26.props.itemSelected;
    local l_layoutOrder_0 = v26.props.layoutOrder;
    local l_screenShape_0 = v26.state.screenShape;
    local l_size_0 = v26.props.size;
    local v35 = nil;
    if v26.state.isOpen then
        v35 = v4.createElement(v8, {
            menuItems = l_items_0, 
            screenShape = l_screenShape_0, 
            callbackCancel = v26.callbackCancel, 
            callbackSelect = v26.callbackSelect
        });
    end;
    return l_withStyle_0(function(v36)
        return v4.createElement(v10, {
            Size = l_size_0, 
            Position = l_position_0, 
            AnchorPoint = l_anchorPoint_0, 
            LayoutOrder = l_layoutOrder_0, 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Image = v16.Image, 
            ImageColor3 = v36.Theme.BackgroundDefault.Color, 
            ImageTransparency = v36.Theme.BackgroundDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v16.SliceCenter, 
            [v4.Event.Activated] = v26.onActivated
        }, {
            Border = v4.createElement(v9, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v17.Image, 
                ImageColor3 = v36.Theme.SecondaryDefault.Color, 
                ImageTransparency = v36.Theme.SecondaryDefault.Transparency, 
                LayoutOrder = l_layoutOrder_0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v17.SliceCenter
            }), 
            Text = v4.createElement("TextLabel", {
                BackgroundColor3 = v6.Color.WHITE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -47, 0, l_height_0), 
                Text = l_itemSelected_0.displayName, 
                Font = v36.Font.Body.Font, 
                TextSize = v36.Font.BaseSize * v36.Font.Body.RelativeSize, 
                TextColor3 = v36.Theme.TextDefault.Color, 
                TextTransparency = v36.Theme.TextDefault.Transparency, 
                Position = UDim2.new(0, 10, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ClipsDescendants = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            Arrow = v4.createElement(v9, {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "LuaApp/icons/dropdown_arrowDown", 
                ImageColor3 = v36.Theme.IconDefault.Color, 
                ImageTransparency = v36.Theme.IconDefault.Transparency, 
                Position = UDim2.new(1, -7, 0.5, 0), 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            Items = v35
        });
    end);
end;
return v18;
