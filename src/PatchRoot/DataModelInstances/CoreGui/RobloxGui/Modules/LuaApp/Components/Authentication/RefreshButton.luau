local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ControlState_0 = v3.Core.Control.Enum.ControlState;
local l_Interactable_0 = v3.Core.Control.Interactable;
local v11 = v5.PureComponent:extend("RefreshButton");
v11.init = function(v12)
    v12.state = {
        isRefreshing = false, 
        isInCooldown = false, 
        controlState = l_ControlState_0.Initialize
    };
    v12.loadSuggestions = v12.props.loadSuggestions;
    v12.finishSuggestions = v12.props.finishSuggestions;
    v12._isMounted = false;
    v12.cooldownTimer = 0;
    v12.safeSetState = function(v13)
        if v12._isMounted then
            v12:setState(v13);
        end;
    end;
    v12.onStateChanged = function(_, v15)
        if v15 == l_ControlState_0.Pressed then
            local l_onRefresh_0 = v12.props.onRefresh;
            if not ((v12.state.isRefreshing or v12.state.isInCooldown) or not l_onRefresh_0) then
                v12.loadSuggestions();
                v12.cooldownTimer = 0;
                v12.safeSetState({
                    isRefreshing = true, 
                    isInCooldown = true
                });
                l_onRefresh_0();
                v12.safeSetState({
                    isRefreshing = false
                });
            end;
        end;
        if v15 == l_ControlState_0.Default then
            v12.safeSetState({
                isRefreshing = false
            });
        end;
    end;
    v12.renderSteppedCallback = function(v17)
        if v12.state.isInCooldown then
            v12.cooldownTimer = v12.cooldownTimer + v17;
            if v12.cooldownTimer >= 1.5 then
                v12.safeSetState({
                    isInCooldown = false
                });
                v12.finishSuggestions();
            end;
        end;
    end;
end;
v11.didMount = function(v18)
    v18._isMounted = true;
end;
v11.willUnmount = function(v19)
    v19._isMounted = false;
end;
v11.isDisabled = function(v20)
    return v20.state.isRefreshing or v20.state.isInCooldown;
end;
local function _(v21, v22)
    return 1 - (1 - v21) * (1 - v22);
end;
v11.render = function(v24)
    local l_Position_0 = v24.props.Position;
    local l_LayoutOrder_0 = v24.props.LayoutOrder;
    local v27 = v24:isDisabled();
    return l_withStyle_0(function(v28)
        return v5.createElement(l_Interactable_0, {
            Size = UDim2.new(0, 30, 0, 30), 
            Position = l_Position_0, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            onStateChanged = v24.onStateChanged, 
            [v5.Event.Activated] = function()
            end
        }, {
            RefreshFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 30, 0, 30)
            }, {
                UIListLayout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Spinner = v5.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 25, 0, 25), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    Image = l_GetImageData_0("LuaApp/icons/common_refresh") or "LuaApp/icons/common_refresh", 
                    ImageColor3 = v28.Theme.IconEmphasis.Color, 
                    ImageTransparency = 1 - (1 - v28.Theme.IconEmphasis.Transparency) * (1 - (not v27 and 0 or 0.5))
                }), 
                renderStepped = v5.createElement(v6, {
                    event = l_RunService_0.renderStepped, 
                    callback = v24.renderSteppedCallback
                })
            })
        });
    end);
end;
return v11;
