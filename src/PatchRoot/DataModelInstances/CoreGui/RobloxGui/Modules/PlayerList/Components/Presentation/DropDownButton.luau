local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v8 = require(l_Parent_0.PresentationCommon.IconButton);
local l_Colors_0 = require(l_CorePackages_0.Workspace.Packages.Style).Colors;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local v12 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Chrome.Enabled);
local v13 = v1.PureComponent:extend("DropDownButton");
v13.validateProps = v3.strictInterface({
    text = v3.string, 
    layoutOrder = v3.optional(v3.integer), 
    icon = v3.union(v3.string, v3.table), 
    lastButton = v3.boolean, 
    forceShowOptions = v3.boolean, 
    screenSizeX = v3.integer, 
    screenSizeY = v3.integer, 
    onActivated = v3.optional(v3.callback), 
    onDecline = v3.optional(v3.callback), 
    onDismiss = v3.optional(v3.callback), 
    animatingAccept = v3.optional(v3.boolean), 
    animatingDecline = v3.optional(v3.boolean), 
    animatingPercentage = v3.optional(v3.number)
});
v13.init = function(v14)
    v14.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v13.getColorBackgroundAnimation = function(v15, v16)
    if v15.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v17 = v15.state.sizeX - v16.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v16.DropDownRightOptionSize;
        if v15.props.animatingDecline then
            v17 = v17 - v16.DropDownRightOptionSize;
        end;
        local v19 = v15.state.sizeX - v16.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v19 * v15.props.animatingPercentage;
        v17 = v17 - (v19 * v15.props.animatingPercentage) * 0.5;
        if v15.state.sizeX < v17 + l_DropDownRightOptionSize_0 then
            v17 = v17 - ((v17 + l_DropDownRightOptionSize_0) - v15.state.sizeX);
        end;
        return v17, l_DropDownRightOptionSize_0;
    end;
end;
v13.render = function(v20)
    return l_WithLayoutValues_0(function(v21)
        return l_withStyle_0(function(v22)
            local v23 = {
                Color = if not v12() then v22.Theme.BackgroundContrast.Color else v22.Theme.BackgroundUIContrast.Color, 
                Transparency = v21.OverrideBackgroundTransparency * v22.Settings.PreferredTransparency
            };
            local v24 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if not v20.state.isPressed then
                if v20.state.isHovered then
                    v24 = v22.Theme.BackgroundOnHover;
                end;
            else
                v24 = v22.Theme.BackgroundOnPress;
            end;
            local v25 = "";
            if v20.props.lastButton then
                v25 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v26 = true;
            if v20.props.onActivated == nil then
                v26 = v20.props.animatingAccept;
            end;
            local v27 = true;
            if v20.props.onDecline == nil then
                v27 = v20.props.animatingDecline;
            end;
            local v28 = true;
            if v20.props.onDecline == nil then
                v28 = true;
                if v20.props.animatingPercentage == nil then
                    v28 = v20.props.forceShowOptions;
                end;
            end;
            local v29, v30 = v20:getColorBackgroundAnimation(v21);
            local l_Green_0 = l_Colors_0.Green;
            if not v20.props.animatingDecline then
                if v20.props.forceShowOptions then
                    l_Green_0 = l_Colors_0.White;
                end;
            else
                l_Green_0 = l_Colors_0.Red;
            end;
            local v32 = v21.DropDownPadding * 2 + v21.DropDownIconSize;
            local v33 = v21.DropDownRightOptionSize * 2;
            if v28 then
                v32 = v32 + v33;
            end;
            return v1.createElement("ImageButton", {
                LayoutOrder = v20.props.layoutOrder, 
                Image = v25, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = not not v20.props.lastButton and v23.Transparency or 1, 
                ImageColor3 = v23.Color, 
                Size = UDim2.new(1, 0, 0, v21.DropDownButtonSizeY), 
                BackgroundTransparency = if not v20.props.lastButton then v23.Transparency else 1, 
                BackgroundColor3 = v23.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = not v28 and v20.props.onActivated or nil, 
                [v1.Event.MouseEnter] = function()
                    if not v28 then
                        v20:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v1.Event.MouseLeave] = function()
                    v20:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v1.Change.AbsoluteSize] = function(v34)
                    v20:setState({
                        sizeX = v34.AbsoluteSize.X
                    });
                end, 
                [v1.Change.AbsolutePosition] = function(v35)
                    v20:setState({
                        absolutePosX = v35.AbsolutePosition.X, 
                        absolutePosY = v35.AbsolutePosition.Y
                    });
                end, 
                [v1.Event.MouseButton1Down] = function()
                    if not v28 then
                        v20:setState({
                            isPressed = true
                        });
                    end;
                end, 
                [v1.Event.MouseButton1Up] = function()
                    v20:setState({
                        isPressed = false
                    });
                end
            }, {
                ColorBackground = v1.createElement("ImageLabel", {
                    Visible = v20.props.animatingPercentage ~= nil, 
                    ZIndex = 1, 
                    Size = UDim2.new(0, v30, 1, 0), 
                    Position = UDim2.new(0, v29, 0, 0), 
                    Image = v25, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = not not v20.props.lastButton and v21.IconButtonBackgroundTransparency or 1, 
                    ImageColor3 = l_Green_0, 
                    BackgroundTransparency = if not v20.props.lastButton then v21.IconButtonBackgroundTransparency else 1, 
                    BackgroundColor3 = l_Green_0, 
                    BorderSizePixel = 0
                }), 
                HoverBackground = v1.createElement("ImageLabel", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Image = v25, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = not not v20.props.lastButton and v24.Transparency or 1, 
                    ImageColor3 = v24.Color, 
                    BackgroundTransparency = if not v20.props.lastButton then v24.Transparency else 1, 
                    BackgroundColor3 = v24.Color, 
                    BorderSizePixel = 0
                }, {
                    InitalPadding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v21.DropDownPadding)
                    }), 
                    ListLayout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v21.DropDownPadding)
                    }), 
                    Icon = v1.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v21.DropDownIconSize, 0, v21.DropDownIconSize), 
                        ImageColor3 = v22.Theme.IconEmphasis.Color, 
                        Image = v20.props.icon, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v1.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -v32, 1, 0), 
                        Text = v20.props.text, 
                        Font = v22.Font.Header2.Font, 
                        TextSize = v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                        TextColor3 = v22.Theme.TextEmphasis.Color, 
                        TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1
                    }), 
                    ButtonContainer = v1.createElement("Frame", {
                        LayoutOrder = 3, 
                        Visible = v28, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v33, 1, 0)
                    }, {
                        ConfirmButton = not not v26 and v1.createElement(v8, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0.5, 0, 0, 0), 
                            backgroundColor = not not v20.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                            icon = l_Images_0["icons/actions/accept"], 
                            showBackground = v20.props.animatingPercentage == nil, 
                            onActivated = v20.props.onActivated
                        }) or nil, 
                        DeclineButton = not not v27 and v1.createElement(v8, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0, 0, 0, 0), 
                            backgroundColor = l_Colors_0.Red, 
                            icon = l_Images_0["icons/actions/reject"], 
                            showBackground = v20.props.animatingPercentage == nil, 
                            onActivated = v20.props.onDecline
                        }) or nil
                    })
                }), 
                DismissInputHandler = v1.createElement("ImageButton", {
                    Image = "", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v20.props.screenSizeX, 0, v20.props.screenSizeY), 
                    Position = UDim2.new(0, -v20.state.absolutePosX, 0, -v20.state.absolutePosY), 
                    Visible = v20.props.onDismiss ~= nil, 
                    [v1.Event.Activated] = v20.props.onDismiss
                }), 
                Divider = not v20.props.lastButton and v1.createElement("Frame", {
                    ZIndex = 3, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v22.Theme.Divider.Transparency, 
                    BackgroundColor3 = v22.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
return v2.UNSTABLE_connect2(function(v36)
    return {
        screenSizeX = v36.screenSize.X, 
        screenSizeY = v36.screenSize.Y
    };
end, nil)(v13);
