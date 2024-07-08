local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_withStyle_0 = require(game:GetService("CorePackages").UIBlox).Style.withStyle;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v8 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v9 = {
    Image = "LuaApp/buttons/buttonStroke", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v10 = v3.PureComponent:extend("RetryButton");
v10.init = function(v11)
    v11.state = {
        isRetrying = false, 
        isInCooldown = false
    };
    v11._isMounted = false;
    v11.cooldownTimer = 0;
    v11.safeSetState = function(v12)
        if v11._isMounted then
            v11:setState(v12);
        end;
    end;
    v11.onActivated = function()
        local l_onRetry_0 = v11.props.onRetry;
        if not ((v11.state.isRetrying or v11.state.isInCooldown) or not l_onRetry_0) then
            v11.cooldownTimer = 0;
            v11.safeSetState({
                isRetrying = true, 
                isInCooldown = true
            });
            l_onRetry_0():andThen(function()
                v11.safeSetState({
                    isRetrying = false
                });
            end, function()
                v11.safeSetState({
                    isRetrying = false
                });
            end);
        end;
    end;
    v11.renderSteppedCallback = function(v14)
        if v11.state.isInCooldown then
            v11.cooldownTimer = v11.cooldownTimer + v14;
            if v11.cooldownTimer >= 1.5 then
                v11.safeSetState({
                    isInCooldown = false
                });
            end;
        end;
    end;
end;
v10.didMount = function(v15)
    v15._isMounted = true;
end;
v10.willUnmount = function(v16)
    v16._isMounted = false;
end;
v10.isDisabled = function(v17)
    return v17.state.isRetrying or v17.state.isInCooldown;
end;
local function _(v18, v19)
    return 1 - (1 - v18) * (1 - v19);
end;
v10.render = function(v21)
    local l_Position_0 = v21.props.Position;
    local l_AnchorPoint_0 = v21.props.AnchorPoint;
    local l_LayoutOrder_0 = v21.props.LayoutOrder;
    local v25 = v21:isDisabled();
    return l_withStyle_0(function(v26)
        return v3.createElement(v5, {
            Size = UDim2.new(0, 44, 0, 44), 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = v8.Image, 
            ImageColor3 = v26.Theme.UIEmphasis.Color, 
            ImageTransparency = 1 - (1 - v26.Theme.UIEmphasis.Transparency) * (1 - (not v25 and 0 or 0.5)), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v8.SliceCenter, 
            [v3.Event.Activated] = v21.onActivated
        }, {
            Border = v3.createElement(v6, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v9.Image, 
                ImageColor3 = v26.Theme.SecondaryDefault.Color, 
                ImageTransparency = 1 - (1 - v26.Theme.SecondaryDefault.Transparency) * (1 - (not v25 and 0 or 0.5)), 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v9.SliceCenter
            }), 
            Spinner = v3.createElement(v6, {
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundTransparency = 1, 
                Image = "LuaApp/icons/common_refresh", 
                ImageColor3 = v26.Theme.IconEmphasis.Color, 
                ImageTransparency = 1 - (1 - v26.Theme.IconEmphasis.Transparency) * (1 - (not v25 and 0 or 0.5))
            }), 
            Shimmer = v25 and v3.createElement(v7, {
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.new(0, 1, 0, 1)
            }), 
            renderStepped = v3.createElement(v4, {
                event = l_RunService_0.renderStepped, 
                callback = v21.renderSteppedCallback
            })
        });
    end);
end;
return v10;
