local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_2.UIBlox);
local l_LoadingSpinner_0 = v5.App.Loading.LoadingSpinner;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v8 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v9 = require(l_Parent_0.LoadingOverlayState);
local v10 = v3.Component:extend(script.Name);
local v11 = {
    dampingRatio = 1, 
    frequency = 1
};
v10.init = function(v12)
    local v13, v14 = v3.createBinding(0);
    v12.motor = v4.createSingleMotor(0);
    v12.motor:start();
    v12.motor:onStep(v14);
    v12.animationProgress = v13;
    v12.motor:setGoal(v4.spring(v12.props.loadingState ~= nil and 1 or 0, v11));
end;
v10.getLoadingMessage = function(_, v16, v17)
    if v17 == v9.PurchasingItem then
        return v16.PurchasingItem;
    elseif v17 == v9.PurchasingRobux then
        return v16.PurchasingRobux;
    elseif v17 == v9.WaitingForPurchase then
        return v16.WaitingForPurchase;
    elseif v17 == v9.WaitingForRobux then
        return v16.WaitingForRobux;
    else
        return ;
    end;
end;
v10.didUpdate = function(v18, v19, _)
    local l_props_0 = v18.props;
    if v19.loadingState ~= l_props_0.loadingState then
        v18.motor:setGoal(v4.spring(l_props_0.loadingState ~= nil and 1 or 0, v11));
    end;
end;
v10.willUnmount = function(v22)
    v22.motor:destroy();
end;
v10.render = function(v23)
    return v3.createElement(v8, {
        keys = {
            PurchasingItem = {
                key = ("IAPExperience.Loading.%s"):format("Text.PurchasingItem")
            }, 
            PurchasingRobux = {
                key = ("IAPExperience.Loading.%s"):format("Text.PurchasingRobux")
            }, 
            WaitingForPurchase = {
                key = ("IAPExperience.Loading.%s"):format("Text.WaitingForPurchase")
            }, 
            WaitingForRobux = {
                key = ("IAPExperience.Loading.%s"):format("Text.WaitingForRobux")
            }
        }, 
        render = function(v24)
            return v23:renderAlert(v24);
        end
    });
end;
v10.renderAlert = function(v25, v26)
    local l_props_1 = v25.props;
    local v28 = false;
    if l_props_1.loadingState ~= v9.None then
        v28 = l_props_1.loadingState ~= nil;
    end;
    local v29 = v25:getLoadingMessage(v26, l_props_1.loadingState);
    return l_withStyle_0(function(v30)
        local l_Theme_0 = v30.Theme;
        local l_Font_0 = v30.Font;
        return v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            BackgroundTransparency = v25.animationProgress:map(function(v33)
                if not l_props_1.showOverlay then
                    return 1;
                elseif not l_props_1.shouldAnimate then
                    return l_Theme_0.BackgroundUIContrast.Transparency;
                else
                    return 1 - (1 - l_Theme_0.BackgroundUIContrast.Transparency) * v33;
                end;
            end), 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = l_props_1.showOverlay
        }, {
            StopPropagationOverlay = v3.createElement("TextButton", {
                Active = false, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                ZIndex = 0
            }), 
            MiddleContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 20), 
                    [v3.Change.AbsoluteContentSize] = v25.onListLayoutAbsoluteContentSizeChanged
                }), 
                Spinner = not not v28 and v3.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(48, 48), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    anchorPoint = Vector2.new(0.5, 0.5)
                }) or nil, 
                PreText = not not v29 and v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextWrapped = true, 
                    Font = l_Font_0.Body.Font, 
                    Text = v29, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                }) or nil
            }), 
            Children = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, v25.props[v3.Children])
        });
    end);
end;
return v10;
