local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Core_0.Control.Enum.ControlState);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Core_0.Control.Interactable);
local v10 = require(l_Core_0.Button.HoverButtonBackground);
local v11 = require(l_Parent_0.ImageSet.getIconSize);
local v12 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.ImageSet.Images);
local v14 = require(l_Parent_0.Button.Button);
local v15 = require(l_Parent_0.Button.Enum.ButtonType);
local v16 = require(l_Parent_0.Loading.LoadableImage);
local v17 = v11(v12.Large);
local v18 = UDim2.fromScale(0.4, 0.512);
local v19 = UDim2.fromOffset(64, 48);
local v20 = UDim2.fromScale(0.25, 0.33);
local v21 = v4.Component:extend("ThumbnailButton");
v21.validateProps = v5.strictInterface({
    layoutOrder = v5.optional(v5.number), 
    size = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    itemKey = v5.any, 
    imageId = v5.optional(v5.string), 
    isVideo = v5.optional(v5.boolean), 
    useScaledPlayButton = v5.optional(v5.boolean), 
    isSelected = v5.optional(v5.boolean), 
    userInteractionEnabled = v5.optional(v5.boolean), 
    onActivated = v5.optional(v5.callback), 
    onPlayActivated = v5.optional(v5.callback)
});
v21.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    imageId = "", 
    isVideo = false, 
    isSelected = false, 
    userInteractionEnabled = true
};
v21.init = function(v22)
    v22:setState({
        controlState = v6.Initialize
    });
    v22.onStateChanged = function(_, v24)
        v22:setState({
            controlState = v24
        });
    end;
    v22.onActivated = function()
        if v22.props.onActivated then
            v22.props.onActivated(v22.props.itemKey);
        end;
    end;
    v22.onPlayActivated = function()
        if v22.props.onPlayActivated then
            v22.props.onPlayActivated(v22.props.itemKey);
        end;
    end;
end;
v21.renderButton = function(v25)
    local l_useScaledPlayButton_0 = v25.props.useScaledPlayButton;
    local v27 = nil;
    v27 = if not l_useScaledPlayButton_0 then v19 else v18;
    return v7(function(v28)
        local l_layoutOrder_0 = v25.props.layoutOrder;
        local l_anchorPoint_0 = v25.props.anchorPoint;
        local l_position_0 = v25.props.position;
        local l_size_0 = v25.props.size;
        local l_isSelected_0 = v25.props.isSelected;
        local l_imageId_0 = v25.props.imageId;
        local l_isVideo_0 = v25.props.isVideo;
        local l_userInteractionEnabled_0 = v25.props.userInteractionEnabled;
        local v37 = v25.state.controlState == v6.Hover;
        local v38 = not not l_isSelected_0 and v28.Theme.BackgroundDefault or v28.Theme.BackgroundUIDefault;
        return v4.createElement(v9, {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            AutoButtonColor = false, 
            BackgroundColor3 = v38.Color, 
            BackgroundTransparency = v38.Transparency, 
            onStateChanged = v25.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            [v4.Event.Activated] = v25.onActivated
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Tile = v4.createElement(v16, {
                Size = UDim2.fromScale(1, 1), 
                cornerRadius = UDim.new(0, 8), 
                Image = l_imageId_0, 
                useShimmerAnimationWhileLoading = true, 
                ZIndex = -1
            }), 
            PlayButton = if not l_isVideo_0 then nil else v4.createElement(v14, {
                buttonType = v15.PrimaryContextual, 
                size = v27, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                icon = if not l_useScaledPlayButton_0 then v13["icons/common/play"] else nil, 
                onActivated = v25.onPlayActivated
            }), 
            PlayIcon = if not not l_isVideo_0 and l_useScaledPlayButton_0 then v4.createElement(v8.Label, {
                Size = v20, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v13["icons/common/play"], 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }) else nil, 
            HoverBackground = not not v37 and v4.createElement(v10) or nil
        });
    end);
end;
v21.renderEmptyState = function(v39)
    return v7(function(v40)
        return v4.createElement("Frame", {
            LayoutOrder = v39.props.layoutOrder, 
            Size = v39.props.size, 
            AnchorPoint = v39.props.anchorPoint, 
            Position = v39.props.position, 
            BackgroundColor3 = v40.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v40.Theme.BackgroundUIDefault.Transparency
        }, {
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Icon = v4.createElement(v8.Label, {
                Size = UDim2.fromOffset(v17, v17), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = v13["icons/imageUnavailable"], 
                ImageColor3 = v40.Theme.UIDefault.Color, 
                ImageTransparency = v40.Theme.UIDefault.Transparency, 
                BackgroundTransparency = 1
            })
        });
    end);
end;
v21.render = function(v41)
    if v41.props.imageId == "" then
        return v41:renderEmptyState();
    else
        return v41:renderButton();
    end;
end;
return v21;
