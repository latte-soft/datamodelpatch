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
local v12 = v1.PureComponent:extend("DropDownButton");
v12.validateProps = v3.strictInterface({
    contentVisible = v3.boolean, 
    buttonTransparency = v3.any, 
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
v12.init = function(v13)
    v13.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v12.getColorBackgroundAnimation = function(v14, v15)
    if v14.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v16 = v14.state.sizeX - v15.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v15.DropDownRightOptionSize;
        if v14.props.animatingDecline then
            v16 = v16 - v15.DropDownRightOptionSize;
        end;
        local v18 = v14.state.sizeX - v15.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v18 * v14.props.animatingPercentage;
        v16 = v16 - (v18 * v14.props.animatingPercentage) * 0.5;
        if v14.state.sizeX < v16 + l_DropDownRightOptionSize_0 then
            v16 = v16 - ((v16 + l_DropDownRightOptionSize_0) - v14.state.sizeX);
        end;
        return v16, l_DropDownRightOptionSize_0;
    end;
end;
v12.render = function(v19)
    return l_WithLayoutValues_0(function(v20)
        return l_withStyle_0(function(v21)
            local v22 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if not v19.state.isPressed then
                if v19.state.isHovered then
                    v22 = v21.Theme.BackgroundOnHover;
                end;
            else
                v22 = v21.Theme.BackgroundOnPress;
            end;
            local v23 = "";
            if v19.props.lastButton then
                v23 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v24 = true;
            if v19.props.onActivated == nil then
                v24 = v19.props.animatingAccept;
            end;
            local v25 = true;
            if v19.props.onDecline == nil then
                v25 = v19.props.animatingDecline;
            end;
            local v26 = true;
            if v19.props.onDecline == nil then
                v26 = true;
                if v19.props.animatingPercentage == nil then
                    v26 = v19.props.forceShowOptions;
                end;
            end;
            local v27, v28 = v19:getColorBackgroundAnimation(v20);
            local l_Green_0 = l_Colors_0.Green;
            if not v19.props.animatingDecline then
                if v19.props.forceShowOptions then
                    l_Green_0 = l_Colors_0.White;
                end;
            else
                l_Green_0 = l_Colors_0.Red;
            end;
            local v30 = v20.DropDownPadding * 2 + v20.DropDownIconSize;
            local v31 = v20.DropDownRightOptionSize * 2;
            if v26 then
                v30 = v30 + v31;
            end;
            local function v32()
                if not v26 then
                    v19:setState({
                        isPressed = true
                    });
                end;
            end;
            local function v33()
                v19:setState({
                    isPressed = false
                });
            end;
            local l_createElement_0 = v1.createElement;
            local v35 = "ImageButton";
            local v38 = {
                LayoutOrder = v19.props.layoutOrder, 
                Image = v23, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = not not v19.props.lastButton and v19.props.buttonTransparency or 1, 
                ImageColor3 = Color3.fromRGB(0, 0, 0), 
                Size = UDim2.new(1, 0, 0, v20.DropDownButtonSizeY), 
                BackgroundTransparency = if not v19.props.lastButton then v19.props.buttonTransparency else 1, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = not v26 and v19.props.onActivated or nil, 
                [v1.Event.MouseEnter] = function()
                    if not v26 then
                        v19:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v1.Event.MouseLeave] = function()
                    v19:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v1.Change.AbsoluteSize] = function(v36)
                    v19:setState({
                        sizeX = v36.AbsoluteSize.X
                    });
                end, 
                [v1.Change.AbsolutePosition] = function(v37)
                    v19:setState({
                        absolutePosX = v37.AbsolutePosition.X, 
                        absolutePosY = v37.AbsolutePosition.Y
                    });
                end, 
                [v1.Event.MouseButton1Down] = v32, 
                [v1.Event.MouseButton1Up] = v33
            };
            local v39 = {};
            local l_createElement_1 = v1.createElement;
            local v41 = "ImageLabel";
            local v42 = {};
            local v43 = false;
            if v19.props.animatingPercentage ~= nil then
                v43 = v19.props.contentVisible;
            end;
            v42.Visible = v43;
            v42.ZIndex = 1;
            v42.Size = UDim2.new(0, v28, 1, 0);
            v42.Position = UDim2.fromOffset(v27, 0);
            v42.Image = v23;
            v42.ScaleType = Enum.ScaleType.Slice;
            v42.SliceCenter = Rect.new(8, 8, 24, 16);
            v42.SliceScale = 0.5;
            v42.ImageTransparency = not not v19.props.lastButton and v20.IconButtonBackgroundTransparency or 1;
            v42.ImageColor3 = l_Green_0;
            v42.BackgroundTransparency = if not v19.props.lastButton then v20.IconButtonBackgroundTransparency else 1;
            v42.BackgroundColor3 = l_Green_0;
            v42.BorderSizePixel = 0;
            v39.ColorBackground = l_createElement_1(v41, v42);
            v39.HoverBackground = v1.createElement("ImageLabel", {
                ZIndex = 2, 
                Size = UDim2.fromScale(1, 1), 
                Visible = v19.props.contentVisible, 
                Image = v23, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = not not v19.props.lastButton and v22.Transparency or 1, 
                ImageColor3 = v22.Color, 
                BackgroundTransparency = if not v19.props.lastButton then v22.Transparency else 1, 
                BackgroundColor3 = v22.Color, 
                BorderSizePixel = 0
            }, {
                InitalPadding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v20.DropDownPadding)
                }), 
                ListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v20.DropDownPadding)
                }), 
                Icon = v1.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(v20.DropDownIconSize, v20.DropDownIconSize), 
                    ImageColor3 = v21.Theme.IconEmphasis.Color, 
                    Image = v19.props.icon, 
                    BackgroundTransparency = 1
                }), 
                Text = v1.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -v30, 1, 0), 
                    Text = v19.props.text, 
                    Font = v21.Font.Header2.Font, 
                    TextSize = v21.Font.BaseSize * v21.Font.Header2.RelativeSize, 
                    TextColor3 = v21.Theme.TextEmphasis.Color, 
                    TextTransparency = v21.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1
                }), 
                ButtonContainer = v1.createElement("Frame", {
                    LayoutOrder = 3, 
                    Visible = v26, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v31, 1, 0)
                }, {
                    ConfirmButton = not not v24 and v1.createElement(v8, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.fromScale(0.5, 0), 
                        backgroundColor = not not v19.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                        icon = l_Images_0["icons/actions/accept"], 
                        showBackground = v19.props.animatingPercentage == nil, 
                        onActivated = v19.props.onActivated
                    }) or nil, 
                    DeclineButton = not not v25 and v1.createElement(v8, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.new(0, 0, 0, 0), 
                        backgroundColor = l_Colors_0.Red, 
                        icon = l_Images_0["icons/actions/reject"], 
                        showBackground = v19.props.animatingPercentage == nil, 
                        onActivated = v19.props.onDecline
                    }) or nil
                })
            });
            l_createElement_1 = v1.createElement;
            v41 = "ImageButton";
            v42 = {
                Image = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v19.props.screenSizeX, v19.props.screenSizeY), 
                Position = UDim2.fromOffset(-v19.state.absolutePosX, -v19.state.absolutePosY)
            };
            v43 = false;
            if v19.props.onDismiss ~= nil then
                v43 = v19.props.contentVisible;
            end;
            v42.Visible = v43;
            v42[v1.Event.Activated] = v19.props.onDismiss;
            v39.DismissInputHandler = l_createElement_1(v41, v42);
            v39.Divider = not v19.props.lastButton and v1.createElement("Frame", {
                Visible = v19.props.contentVisible, 
                ZIndex = 3, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v21.Theme.Divider.Transparency, 
                BackgroundColor3 = v21.Theme.Divider.Color, 
                BorderSizePixel = 0
            });
            return l_createElement_0(v35, v38, v39);
        end);
    end);
end;
return v2.connect(function(v44)
    return {
        screenSizeX = v44.screenSize.X, 
        screenSizeY = v44.screenSize.Y
    };
end, nil)(v12);
