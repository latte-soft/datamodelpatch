local l_CorePackages_0 = game:GetService("CorePackages");
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = v3.PureComponent:extend("EntryFrame");
v5.validateProps = v4.strictInterface(l_validatePropsWithForwardRef_0({
    sizeX = v4.integer, 
    sizeY = v4.integer, 
    isTeamFrame = v4.boolean, 
    onActivated = v4.optional(v4.callback), 
    onSelectionGained = v4.optional(v4.callback), 
    onSelectionLost = v4.optional(v4.callback), 
    onMouseEnter = v4.optional(v4.callback), 
    onMouseLeave = v4.optional(v4.callback), 
    onMouseDown = v4.optional(v4.callback), 
    onInputEnded = v4.optional(v4.callback), 
    backgroundStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number
    }), 
    overlayStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number
    }), 
    doubleOverlay = v4.optional(v4.boolean), 
    [v3.Ref] = v4.optional(v4.table), 
    [v3.Children] = v4.optional(v4.table)
}));
v5.render = function(v6)
    return v3.createElement("TextButton", {
        Size = UDim2.new(0, v6.props.sizeX, 0, v6.props.sizeY), 
        BackgroundTransparency = v6.props.backgroundStyle.Transparency, 
        BackgroundColor3 = v6.props.backgroundStyle.Color, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        Text = "", 
        AutoLocalize = false, 
        Selectable = not v6.props.isTeamFrame, 
        Active = not v6.props.isTeamFrame, 
        [v3.Event.Activated] = v6.props.onActivated, 
        [v3.Event.SelectionGained] = v6.props.onSelectionGained, 
        [v3.Event.SelectionLost] = v6.props.onSelectionLost, 
        [v3.Event.MouseEnter] = v6.props.onMouseEnter, 
        [v3.Event.MouseLeave] = v6.props.onMouseLeave, 
        [v3.Event.MouseButton1Down] = v6.props.onMouseDown, 
        [v3.Event.MouseButton1Up] = v6.props.onInputEnded, 
        [v3.Event.InputEnded] = function(_, v8)
            if v8.UserInputType == Enum.UserInputType.Touch then
                if v6.props.onMouseLeave then
                    v6.props.onMouseLeave();
                end;
                if v6.props.onInputEnded then
                    v6.props.onInputEnded();
                end;
            end;
        end or nil, 
        [v3.Ref] = v6.props.forwardRef
    }, {
        DoubleOverLay = v3.createElement("Frame", {
            ZIndex = 1, 
            Visible = v6.props.doubleOverlay, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v6.props.overlayStyle.Transparency, 
            BackgroundColor3 = v6.props.overlayStyle.Color, 
            BorderSizePixel = 0
        }), 
        OverlayFrame = v3.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v6.props.overlayStyle.Transparency, 
            BackgroundColor3 = v6.props.overlayStyle.Color, 
            BorderSizePixel = 0
        }, v6.props[v3.Children])
    });
end;
return v3.forwardRef(function(v9, v10)
    return v3.createElement(v5, v2.Dictionary.join(v9, {
        forwardRef = v10
    }));
end);
