local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.LuaApp.Constants);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v7 = v2.PureComponent:extend("UserThumbnail");
v7.render = function(v8)
    local l_Size_0 = v8.props.Size;
    local l_Position_0 = v8.props.Position;
    local l_AnchorPoint_0 = v8.props.AnchorPoint;
    local l_SizeConstraint_0 = v8.props.SizeConstraint;
    local l_MaskColor_0 = v8.props.MaskColor;
    local v14 = v8.props.Url ~= "" and v8.props.Url or "LuaApp/graphic/ph-avatar-portrait";
    return v2.createElement("Frame", {
        BackgroundColor3 = v4.Color.GRAY_AVATAR_BACKGROUND, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        SizeConstraint = l_SizeConstraint_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = not l_MaskColor_0 and 1 or 0
    }, {
        Thumbnail = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SizeConstraint = l_SizeConstraint_0, 
            Image = l_GetImageData_0(v14) or v14, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }), 
        Mask = not not l_MaskColor_0 and v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_GetImageData_0("rbxasset://textures/ui/LuaApp/graphic/profilemask.png") or "rbxasset://textures/ui/LuaApp/graphic/profilemask.png", 
            ImageColor3 = l_MaskColor_0, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }) or nil
    });
end;
return v7;
