local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(l_Parent_0.UIBlox);
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local v8 = v2.PureComponent:extend("LoadingAvatar");
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewAppChatLoadingIndicator);
v8.defaultProps = {
    avatarImage = if not v9() then l_Images_0["component_assets/user_60_mask"] else l_Images_0["component_assets/circle_49_mask"], 
    cellHeight = 64, 
    avatarSize = 36, 
    LayoutOrder = 0
};
v8.render = function(v10)
    local v11 = v10.props.cellHeight / 2 - v10.props.avatarSize / 2;
    return l_withStyle_0(function(v12)
        return v2.createElement("Frame", {
            Size = if not v9() then UDim2.new(0, 68, 0, 68) else UDim2.new(0, v10.props.cellHeight, 0, v10.props.cellHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = v10.props.LayoutOrder, 
            BorderSizePixel = 0
        }, {
            avatarShimmer = v2.createElement(l_ShimmerPanel_0, {
                Size = if not v9() then UDim2.new(1, -2, 1, -2) else UDim2.fromOffset(v10.props.avatarSize, v10.props.avatarSize), 
                Position = if not v9() then UDim2.new(0, 1, 0, 1) else UDim2.fromOffset(v11, v11), 
                cornerRadius = if not v9() then nil else UDim.new(0, v10.props.cellHeight)
            }), 
            avatarMask = v2.createElement(l_ImageSetLabel_0, {
                Size = if not v9() then UDim2.new(1, 0, 1, 0) else UDim2.fromOffset(v10.props.avatarSize, v10.props.avatarSize), 
                Position = if not v9() then nil else UDim2.fromOffset(v11, v11), 
                Image = v10.props.avatarImage, 
                BackgroundTransparency = 1, 
                ImageColor3 = v12.Theme.BackgroundDefault.Color
            })
        });
    end);
end;
return v8;
