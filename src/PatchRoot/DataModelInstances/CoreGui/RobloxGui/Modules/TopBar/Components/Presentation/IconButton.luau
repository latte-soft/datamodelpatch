local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_ControlState_0 = v5.Core.Control.Enum.ControlState;
local l_Images_0 = v5.App.ImageSet.Images;
local v12 = require(l_CorePackages_0.Packages.ReactOtter);
local v13 = require(script.Parent.Parent.Parent.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v14 = require(script.Parent.FlashingDot);
local v15 = require(script.Parent.FlashingDotV2);
local v16 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit);
local _ = require(l_CoreGui_0.RobloxGui.Modules.Chrome.Enabled)();
local v18 = require(l_CoreGui_0.RobloxGui.Modules.isNewTiltIconEnabled);
local v19 = require(script.Parent.Parent.Parent.Constants);
local v20 = require(script.Parent.Parent.Parent.Flags.GetFFlagChangeTopbarHeightCalculation);
local v21 = v2.PureComponent:extend("IconButton");
local v22 = not v18() and 32 or v19.TopBarHeight - 4;
if v20() then
    v22 = v19.TopBarButtonHeight;
end;
local v23 = l_Images_0["component_assets/circle_17"];
v21.validateProps = v4.strictInterface({
    icon = v4.union(v4.string, v4.table), 
    iconSize = v4.integer, 
    enableFlashingDot = v4.optional(v4.boolean), 
    useIconScaleAnimation = v4.optional(v4.boolean), 
    onActivated = v4.callback, 
    onHover = v4.optional(v4.callback), 
    onHoverEnd = v4.optional(v4.callback)
});
AnimatedScaleIcon = function(v24)
    local v25, v26 = v12.useAnimatedBinding(v24.iconSize);
    v3.useEffect(function()
        v26(v12.spring(v24.iconSize, {
            dampingRatio = 1, 
            frequency = 2.857142857142857
        }));
        return function()
        end;
    end, {
        v24.iconSize
    });
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v25:map(function(v27)
            return UDim2.fromOffset(v27, v27);
        end), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v24.icon, 
        ImageColor3 = v24.style.Theme.IconEmphasis.Color, 
        ImageTransparency = v24.style.Theme.IconEmphasis.Transparency, 
        ZIndex = 1
    });
end;
v21.init = function(v28)
    v28:setState({
        controlState = l_ControlState_0.Default
    });
    v28.controlStateUpdated = function(v29, v30)
        if v28.props.onHover and v30 == l_ControlState_0.Hover then
            v28.props.onHover();
        elseif (v28.props.onHoverEnd and v29 == l_ControlState_0.Hover) and v30 ~= l_ControlState_0.Hover then
            v28.props.onHoverEnd();
        end;
        v28:setState({
            controlState = v30
        });
    end;
end;
v21.render = function(v31)
    return l_withStyle_0(function(v32)
        local v33 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v31.state.controlState == l_ControlState_0.Pressed then
            v33 = v32.Theme.BackgroundOnPress;
        elseif v31.state.controlState == l_ControlState_0.Hover then
            v33 = v32.Theme.BackgroundOnHover;
        end;
        return v2.createElement(l_Interactable_0, {
            onStateChanged = v31.controlStateUpdated, 
            ZIndex = 1, 
            BackgroundTransparency = not v18() and 1 or v32.Theme.BackgroundUIContrast.Transparency, 
            Position = UDim2.fromScale(0, not v18() and 1 or 0.5), 
            AnchorPoint = Vector2.new(0, not v18() and 1 or 0.5), 
            Size = UDim2.fromOffset(v22, v22), 
            Image = if v18() then nil else "rbxasset://textures/ui/TopBar/iconBase.png", 
            BackgroundColor3 = v32.Theme.BackgroundUIContrast.Color, 
            [v2.Event.Activated] = v31.props.onActivated, 
            [v2.Ref] = v31.props.forwardRef
        }, {
            UICorner = not not v18() and v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }) or nil, 
            Icon = not v31.props.useIconScaleAnimation and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(v31.props.iconSize, v31.props.iconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v31.props.icon, 
                ImageColor3 = v32.Theme.IconEmphasis.Color, 
                ImageTransparency = v32.Theme.IconEmphasis.Transparency, 
                ZIndex = 1
            }), 
            ScalingIcon = v31.props.useIconScaleAnimation and v2.createElement(AnimatedScaleIcon, {
                icon = v31.props.icon, 
                iconSize = v31.props.iconSize, 
                style = v32
            }), 
            FlashingDot = if not v31.props.enableFlashingDot then nil else v2.createElement(if not v16() then v14 else v15), 
            StateOverlayRound = not not v18() and v2.createElement("Frame", {
                BackgroundTransparency = v33.Transparency, 
                BackgroundColor3 = v33.Color, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, {
                UICorner = not not v18() and v2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }) or nil
            }) or nil, 
            StateOverlay = not v18() and v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v23, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 8, 8), 
                ImageColor3 = v33.Color, 
                ImageTransparency = v33.Transparency, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }) or nil
        });
    end);
end;
if not v13 then
    return v21;
else
    return v2.forwardRef(function(v34, v35)
        return v2.createElement(v21, v6.Dictionary.join(v34, {
            forwardRef = v35
        }));
    end);
end;
