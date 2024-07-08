local v0 = require(game:GetService("CorePackages").Roact);
local v1 = Rect.new(8, 6, 46, 44);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Settings.Theme);
local v4 = require(l_Modules_0.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v5 = {
    Left = 4, 
    Right = 4, 
    Top = 2, 
    Bottom = 6
};
local v6 = v0.PureComponent:extend("RectangleButton");
v6.defaultProps = {
    visible = true
};
v6.init = function(v7)
    v7.state = {
        isHovering = false
    };
end;
v6.render = function(v8)
    local l_size_0 = v8.props.size;
    local l_position_0 = v8.props.position;
    local l_anchorPoint_0 = v8.props.anchorPoint;
    local l_layoutOrder_0 = v8.props.layoutOrder;
    local l_zIndex_0 = v8.props.zIndex;
    local l_onClick_0 = v8.props.onClick;
    local l_visible_0 = v8.props.visible;
    local v16 = v8.props[v0.Children] or {};
    local v17 = not v8.state.isHovering and "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png" or "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
    if not (v4() and v3.UIBloxThemeEnabled) then
        v16.UIPadding = v0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v5.Left), 
            PaddingRight = UDim.new(0, v5.Right), 
            PaddingTop = UDim.new(0, v5.Top), 
            PaddingBottom = UDim.new(0, v5.Bottom)
        });
    end;
    if v3.UIBloxThemeEnabled then
        v16.Border = v0.createElement("UIStroke", {
            Color = v3.color("DefaultButtonStroke"), 
            Transparency = v3.transparency("DefaultButtonStroke"), 
            Thickness = v3.DefaultStokeThickness
        });
        v16.UICorner = v0.createElement("UICorner", {
            CornerRadius = v3.DefaultCornerRadius
        });
    end;
    return v0.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = "", 
        Selectable = false, 
        Size = l_size_0, 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        Visible = l_visible_0, 
        [v0.Event.InputBegan] = function()
            v8:setState({
                isHovering = true
            });
        end, 
        [v0.Event.InputEnded] = function()
            v8:setState({
                isHovering = false
            });
        end, 
        [v0.Event.Activated] = function()
            if l_onClick_0 then
                v8:setState({
                    isHovering = false
                });
                l_onClick_0();
            end;
        end
    }, {
        ButtonBackground = not v3.UIBloxThemeEnabled and v0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, -v5.Left, 0, -v5.Top), 
            Size = UDim2.new(1, v5.Left + v5.Right, 1, v5.Top + v5.Bottom), 
            Image = v17, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v1, 
            ZIndex = l_zIndex_0
        }, v16), 
        ButtonBackgroundUIBlox = v3.UIBloxThemeEnabled and v0.createElement("ImageLabel", {
            BackgroundColor3 = v3.color(not v8.state.isHovering and "DefaultButton" or "DefaultButtonHover"), 
            BackgroundTransparency = v3.transparency(not v8.state.isHovering and "DefaultButton" or "DefaultButtonHover"), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = l_zIndex_0
        }, v16)
    });
end;
return v6;
