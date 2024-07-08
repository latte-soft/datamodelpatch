local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v9 = require(l_RobloxGui_0.Modules.Settings.BackButtonController);
local v10 = v2.PureComponent:extend("MenuBackButton");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v12 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFStringTeleportBackButtonSettingsHubIXPCustomFieldName);
v10.validateProps = v4.strictInterface({
    HubBar = v4.instanceOf("ImageLabel"), 
    backEnabled = v4.boolean, 
    BackBarRef = v4.optional(v4.table)
});
v10.init = function(v14)
    v14:setState({
        text = v9.getMenuText()
    });
    local v15, v16 = v2.createBinding(nil);
    v14.sizeBinding = v15;
    v14.updateSizeBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.sizeConstraintBinding = v15;
    v14.updateSizeConstraintBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.visibleBinding = v15;
    v14.updateVisibleBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.buttonHeightBinding = v15;
    v14.updateButtonHeightBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.textSizeBinding = v15;
    v14.updateTextSizeBinding = v16;
    v15, v16 = v2.createBinding(nil);
    v14.textSizeConstraintBinding = v15;
    v14.updateTextSizeConstraintBinding = v16;
    v14.textLabelRef = v2.createRef();
end;
v10.didMount = function(v17)
    v17.updateSizeBinding(v17.props.HubBar.Size);
    v17.updateVisibleBinding(v17.props.HubBar.Visible);
    v17:updateViewport();
end;
v10.didUpdate = function(v18, v19)
    if v18.props.HubBar ~= v19.HubBar then
        v18.updateSizeBinding(v18.props.HubBar.Size);
        v18.updateVisibleBinding(v18.props.HubBar.Visible);
    end;
end;
v10.updateViewport = function(v20)
    local v21 = v12.textSize(24);
    if not v8:IsSmallTouchScreen() then
        if v11 then
            v21 = v12.textSize(36);
        end;
    else
        v21 = v12.textSize(18);
    end;
    v20.updateTextSizeConstraintBinding(v21);
    local v22 = v8:IsPortrait();
    local v23 = if not v11 then v12.LargeButtonHeight else 120;
    if not (not v22 and not v8:IsSmallTouchScreen()) then
        if not v12.UIBloxThemeEnabled then
            v21 = not not v22 and v12.textSize(18) or v12.textSize(24);
            v23 = not v22 and 62 or 50;
        else
            v23 = v12.ButtonHeight;
            v21 = not not v22 and v12.textSize(16) or v12.textSize(24);
        end;
    end;
    v20.updateTextSizeBinding(v21);
    v20.updateButtonHeightBinding(v23);
    if not (not v20.textLabelRef:getValue() or not v20.props.BackBarRef:getValue()) then
        v20.updateSizeConstraintBinding(Vector2.new(v20.props.BackBarRef:getValue().AbsoluteSize.X - (v20.textLabelRef:getValue().AbsolutePosition.X - v20.props.BackBarRef:getValue().AbsolutePosition.X), math.huge));
    end;
end;
v10.render = function(v24)
    return v2.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0.5, 0), 
        LayoutOrder = -1, 
        Visible = v2.joinBindings({
            v24.state.text, 
            v24.visibleBinding
        }):map(function(v25)
            local l_backEnabled_0 = v24.props.backEnabled;
            if l_backEnabled_0 then
                l_backEnabled_0 = false;
                if v25[1] ~= nil then
                    l_backEnabled_0 = v25[2];
                end;
            end;
            return l_backEnabled_0;
        end), 
        Size = v2.joinBindings({
            v24.sizeBinding, 
            v24.buttonHeightBinding
        }):map(function(v27)
            local v28 = v27[1];
            local v29 = v27[2];
            if not v28 or not v29 then
                return UDim2.new();
            else
                return UDim2.new(v28.X, UDim.new(0, v29 + 6));
            end;
        end), 
        [v2.Ref] = v24.props.BackBarRef
    }, {
        SizeConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v24.props.HubBar:GetPropertyChangedSignal("Size"), 
            callback = function()
                v24.updateSizeBinding(v24.props.HubBar.Size);
            end
        }), 
        VisibleConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = v24.props.HubBar:GetPropertyChangedSignal("Visible"), 
            callback = function()
                v24.updateVisibleBinding(v24.props.HubBar.Visible);
            end
        }), 
        ViewportSizeChangedConnection = v2.createElement(l_ExternalEventConnection_0, {
            event = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), 
            callback = function()
                v24:updateViewport();
            end
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 6), 
            PaddingTop = if not v12.UIBloxThemeEnabled then UDim.new(0, 0) else UDim.new(0, 10)
        }), 
        ImageButton = v2.createElement("ImageButton", {
            Image = not v12.UIBloxThemeEnabled and "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png" or "", 
            BorderSizePixel = 0, 
            BackgroundColor3 = v12.color("DefaultButton"), 
            BackgroundTransparency = v12.transparency("DefaultButton", 1), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v24.buttonHeightBinding:map(function(v30)
                if not v30 then
                    return UDim2.new();
                else
                    return UDim2.new(0, 0, 0, v30);
                end;
            end), 
            AutomaticSize = Enum.AutomaticSize.X, 
            ScaleType = if not v12.UIBloxThemeEnabled then Enum.ScaleType.Slice else Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            [v2.Event.MouseEnter] = function(v31)
                if not v12.UIBloxThemeEnabled then
                    v31.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
                    return ;
                else
                    v31.BackgroundColor3 = v12.color("DefaultButtonHover");
                    v31.BackgroundTransparency = v12.transparency("DefaultButtonHover");
                    return ;
                end;
            end, 
            [v2.Event.MouseLeave] = function(v32)
                if not v12.UIBloxThemeEnabled then
                    v32.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
                    return ;
                else
                    v32.BackgroundColor3 = v12.color("DefaultButton");
                    v32.BackgroundTransparency = v12.transparency("DefaultButton");
                    return ;
                end;
            end, 
            [v2.Event.Activated] = function(_)
                v9.initiateBackButtonTeleport(Enum.AdTeleportMethod.InGameMenuBackButton);
            end
        }, {
            UICorner = not not v12.UIBloxThemeEnabled and v2.createElement("UICorner", {
                CornerRadius = v12.DefaultCornerRadius
            }) or nil, 
            UIStroke = not not v12.UIBloxThemeEnabled and v2.createElement("UIStroke", {
                Color = v12.color("DefaultButtonStroke"), 
                Transparency = v12.transparency("DefaultButtonStroke"), 
                Thickness = v12.DefaultStokeThickness
            }) or nil, 
            Frame = v2.createElement("Frame", {
                Size = if not v12.UIBloxThemeEnabled then UDim2.new(1, 0, 1, -8) else UDim2.new(1, 0, 1, 0), 
                Position = if not v12.UIBloxThemeEnabled then UDim2.new(0, 4, 0, 2) else UDim2.new(0, 4, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Container = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ImageLabel = v2.createElement(l_ImageSetLabel_0, {
                    Image = l_Images_0["icons/actions/cycleLeft"], 
                    Size = UDim2.new(1, 0, 0.75, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {})
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    Text = v24.state.text, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v12.font(Enum.Font.SourceSansBold, "Bold"), 
                    TextSize = v24.textSizeBinding, 
                    TextScaled = true, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    [v2.Ref] = v24.textLabelRef
                }, {
                    UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                        MaxTextSize = v24.textSizeConstraintBinding
                    }), 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MaxSize = v24.sizeConstraintBinding
                    })
                })
            })
        })
    });
end;
return (v9.connectExperimentUserLayer(v10, "backEnabled", v13()));
