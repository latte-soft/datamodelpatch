local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(script.Parent.BaseMenu);
local v7 = require(script.Parent.validateButtonProps);
local v8 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v9 = require(l_Parent_0.UIBloxConfig);
local v10 = v3.PureComponent:extend("DropdownMenuList");
v10.validateProps = v4.strictInterface({
    buttonProps = v7, 
    zIndex = v4.optional(v4.integer), 
    open = v4.boolean, 
    showDropShadow = v4.boolean, 
    fixedListHeight = v4.optional(v4.number), 
    openPositionY = v4.UDim, 
    closeBackgroundVisible = v4.optional(v4.boolean), 
    screenSize = v4.Vector2, 
    onDismiss = v4.optional(v4.callback), 
    buttonSize = v4.UDim2, 
    menuListBackground = v4.optional(v8), 
    enableTokenOverride = v4.optional(v4.boolean), 
    selectionOrder = v4.optional(v4.number)
});
v10.defaultProps = {
    zIndex = 2, 
    closeBackgroundVisible = false, 
    showDropShadow = false, 
    fixedListHeight = nil, 
    menuListBackground = nil, 
    enableTokenOverride = false
};
v10.init = function(v11)
    v11:setState({
        absolutePosition = Vector2.new(0, 0), 
        visible = false
    });
    v11.setAbsolutePosition = function(v12)
        v11:setState({
            absolutePosition = v12.AbsolutePosition
        });
    end;
    v11.dismissMenu = function()
        if v11.state.visible then
            v11:setState({
                visible = false
            });
            v11.props.onDismiss();
        end;
    end;
end;
v10.render = function(v13)
    return v5(function(v14)
        local l_l_GuiService_0_GuiInset_0, v16 = l_GuiService_0:GetGuiInset();
        local v17 = v13.state.absolutePosition + l_l_GuiService_0_GuiInset_0;
        local v18 = 0;
        local v19 = 1;
        local l_Y_0 = v13.props.buttonSize.Y;
        local l_X_0 = v13.props.buttonSize.X;
        if v13.props.screenSize.Y / 2 < v13.state.absolutePosition.Y then
            v18 = 1;
            v19 = -1;
            l_Y_0 = UDim.new(0, 0);
        end;
        local v22 = nil;
        v22 = if v19 == 1 then l_Y_0 + v13.props.openPositionY else l_Y_0 - v13.props.openPositionY;
        local v23 = UDim2.new(0, 0, v22.Scale, v22.Offset);
        if v13.props.screenSize.X < 640 then
            v18 = 1;
            v23 = UDim2.new(-v13.props.buttonSize.X.Scale / 2, (-v17.X + v13.props.screenSize.X / 2) - v13.props.buttonSize.X.Offset / 2, 0, ((v13.props.screenSize.Y - v17.Y) - v16.Y) - 24);
        end;
        local l_Transparency_0 = v14.Theme.Overlay.Transparency;
        if not v13.props.closeBackgroundVisible then
            l_Transparency_0 = 1;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Visible = v13.state.visible, 
            ZIndex = v13.props.zIndex, 
            [v3.Change.AbsolutePosition] = v13.setAbsolutePosition
        }, {
            Background = v3.createElement("TextButton", {
                ZIndex = 1, 
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundColor3 = v14.Theme.Overlay.Color, 
                BackgroundTransparency = l_Transparency_0, 
                AutoButtonColor = false, 
                Selectable = if not v9.enableNewMenuLayout then nil else false, 
                Position = UDim2.fromOffset(-v17.X, -v17.Y), 
                Size = UDim2.fromOffset(v13.props.screenSize.X, v13.props.screenSize.Y), 
                [v3.Event.Activated] = v13.dismissMenu
            }), 
            PositionFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Position = v23, 
                ZIndex = 2
            }, {
                BaseMenu = v3.createElement(v6, {
                    buttonProps = v13.props.buttonProps, 
                    showDropShadow = v13.props.showDropShadow, 
                    fixedListHeight = v13.props.fixedListHeight, 
                    width = l_X_0, 
                    position = UDim2.fromScale(0, 0), 
                    anchorPoint = Vector2.new(0, v18), 
                    background = v13.props.menuListBackground, 
                    enableTokenOverride = v13.props.enableTokenOverride, 
                    selectionOrder = v13.props.selectionOrder
                })
            })
        });
    end);
end;
v10.didMount = function(v25)
    if v25.props.open then
        v25:setState({
            visible = true
        });
    end;
end;
v10.didUpdate = function(v26, v27, _)
    if v26.props.open ~= v27.open then
        if not v26.props.open then
            v26:setState({
                visible = false
            });
        else
            v26:setState({
                visible = true
            });
            return ;
        end;
    end;
end;
return v10;
