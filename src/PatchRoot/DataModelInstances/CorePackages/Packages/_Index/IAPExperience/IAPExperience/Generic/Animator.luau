local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Locale.LocaleProvider);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.Otter);
local v6 = v4.Component:extend(script.Name);
local v7 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v6.init = function(v8)
    v8.state = {
        shouldRenderChildren = v8.props.shouldShow
    };
    local v9, v10 = v4.createBinding(1);
    v8.motor = v5.createSingleMotor(1);
    v8.motor:start();
    v8.motor:onStep(v10);
    v8.animationProgress = v9;
    v8.motor:onComplete(function()
        local l_props_0 = v8.props;
        if not l_props_0.shouldShow then
            v8:setState({
                shouldRenderChildren = false
            });
            if l_props_0.onHidden ~= nil then
                l_props_0.onHidden();
            end;
        elseif l_props_0.onShown ~= nil then
            l_props_0.onShown();
            return ;
        end;
    end);
    v8.motor:setGoal(v5.spring(not v8.props.shouldShow and 1 or 0, v7));
end;
v6.didUpdate = function(v12, v13, _)
    local l_props_1 = v12.props;
    if v13.shouldShow ~= l_props_1.shouldShow then
        if l_props_1.shouldShow then
            v12:setState({
                shouldRenderChildren = l_props_1.shouldShow
            });
        end;
        v12.motor:setGoal(v5.spring(not l_props_1.shouldShow and 1 or 0, v7));
    end;
end;
v6.willUnmount = function(v16)
    v16.motor:destroy();
end;
v6.renderWithoutLocale = function(v17)
    local l_props_2 = v17.props;
    if not l_props_2.shouldAnimate then
        if not l_props_2.shouldShow then
            return nil;
        else
            return l_props_2.renderChildren();
        end;
    else
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Position = v17.animationProgress:map(function(v19)
                if not l_props_2.animateDown then
                    return UDim2.new(0, 0, 1 * v19, 0);
                else
                    return UDim2.new(0, 0, -1 * v19, 0);
                end;
            end), 
            ZIndex = l_props_2.ZIndex
        }, not not v17.state.shouldRenderChildren and l_props_2.renderChildren() or nil);
    end;
end;
v6.render = function(v20)
    return v4.createElement(v3, {
        locale = l_LocalizationService_0 and l_LocalizationService_0.RobloxLocaleId
    }, {
        v20:renderWithoutLocale()
    });
end;
return v6;
