local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Otter);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local v5 = require(script.Parent.DropDownButton);
local v6 = {
    dampingRatio = 1, 
    frequency = 4
};
local v7 = {
    dampingRatio = 1, 
    frequency = 4
};
local v8 = v1.PureComponent:extend("DropDownAnimator");
v8.validateProps = v2.strictInterface({
    text = v2.string, 
    icon = v2.union(v2.string, v2.table), 
    lastButton = v2.boolean, 
    layoutOrder = v2.integer, 
    onActivated = v2.callback, 
    forceShowOptions = v2.boolean, 
    selectedPlayer = v2.optional(v2.instanceIsA("Player")), 
    onDecline = v2.optional(v2.callback), 
    onDismiss = v2.optional(v2.callback), 
    contentVisible = v2.boolean
});
v8.init = function(v9)
    v9.state = {
        lastButtonProps = nil, 
        onDeclineCalled = nil, 
        onActivatedCalled = nil, 
        overlayPercentage = 0
    };
    local v10, v11 = v1.createBinding(UDim2.new(0, 0, 0, 0));
    v9.currentButtonPosition = v10;
    v9.updateCurrentButtonPosition = v11;
    v10, v11 = v1.createBinding(UDim2.new(0, 0, 0, 0));
    v9.lastButtonPosition = v10;
    v9.updateLastButtonPosition = v11;
    v9.positionMotor = v3.createSingleMotor(0);
    v9.positionMotor:onStep(function(v12)
        v9.updateCurrentButtonPosition(UDim2.new(v12, 0, 0, 0));
        if not v9.animatingRight then
            v9.updateLastButtonPosition(UDim2.new(v12 - 1, 0, 0, 0));
            return ;
        else
            v9.updateLastButtonPosition(UDim2.new(v12 + 1, 0, 0, 0));
            return ;
        end;
    end);
    v9.positionMotor:onComplete(function(v13)
        if v13 == 0 then
            v9:setState({
                lastButtonProps = v1.None, 
                onDeclineCalled = v1.None, 
                onActivatedCalled = v1.None
            });
        end;
    end);
    v9.overlayMotor = v3.createSingleMotor(0);
    v9.overlayMotor:onStep(function(v14)
        v9:setState({
            overlayPercentage = v14
        });
    end);
    v9.overlayMotor:onComplete(function(v15)
        if v15 == 1 then
            v9.positionMotor:setGoal(v3.spring(0, v6));
        end;
    end);
end;
v8.getButtonProps = function(v16, v17, v18)
    local v19 = {
        text = v17.text, 
        icon = v17.icon, 
        lastButton = v17.lastButton, 
        forceShowOptions = v17.forceShowOptions, 
        onDismiss = v17.onDismiss
    };
    if not (v16.state.lastButtonProps ~= nil) then
        if not v17.onActivated or not v17.onDecline and not v16.props.forceShowOptions then
            if v17.onActivated then
                v19.onActivated = v17.onActivated;
            end;
        else
            v19.onActivated = function()
                v16:setState({
                    onActivatedCalled = true, 
                    onDeclineCalled = false
                });
                v17.onActivated();
            end;
        end;
        if v17.onDecline then
            v19.onDecline = function()
                v16:setState({
                    onActivatedCalled = false, 
                    onDeclineCalled = true
                });
                v17.onDecline();
            end;
        end;
    elseif v18 then
        v19.animatingAccept = v16.state.onActivatedCalled;
        v19.animatingDecline = v16.state.onDeclineCalled;
        v19.animatingPercentage = v16.state.overlayPercentage;
        return v19;
    end;
    return v19;
end;
v8.render = function(v20)
    return l_WithLayoutValues_0(function(v21)
        local v22 = {
            CurrentButtonContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v20.currentButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v1.createElement(v5, v20:getButtonProps(v20.props))
            })
        };
        if v20.state.lastButtonProps then
            v22.LastButtonContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = v20.lastButtonPosition, 
                BackgroundTransparency = 1
            }, {
                DropDownButton = v1.createElement(v5, v20:getButtonProps(v20.state.lastButtonProps, true))
            });
        end;
        return v1.createElement("Frame", {
            Visible = v20.props.contentVisible, 
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 0, v21.DropDownButtonSizeY), 
            BackgroundTransparency = 1, 
            LayoutOrder = v20.props.layoutOrder
        }, v22);
    end);
end;
v8.didUpdate = function(v23, v24, _)
    local v26 = v23.props.text ~= v24.text;
    local v27 = true;
    if v24.onDecline == nil then
        v27 = v23.props.forceShowOptions;
    end;
    local v28 = v23.state.onDeclineCalled or v23.state.onActivatedCalled;
    if not ((not v26 or not v27) or not v28) then
        if not v23.state.onActivatedCalled or v23.props.forceShowOptions then
            v23.animatingRight = false;
            v23.positionMotor:setGoal(v3.instant(1));
        else
            v23.animatingRight = true;
            v23.positionMotor:setGoal(v3.instant(-1));
        end;
        v23.overlayMotor:setGoal(v3.instant(0));
        v23.positionMotor:step(0);
        v23.overlayMotor:step(0);
        v23:setState({
            lastButtonProps = v24
        });
        v23.overlayMotor:setGoal(v3.spring(1, v7));
    end;
    if v23.props.selectedPlayer ~= v24.selectedPlayer then
        v23.positionMotor:setGoal(v3.instant(0));
        v23.overlayMotor:setGoal(v3.instant(0));
        v23.positionMotor:step(0);
        v23.overlayMotor:step(0);
        v23:setState({
            lastButtonProps = v1.None
        });
    end;
end;
v8.willUnmount = function(v29)
    v29.positionMotor:destroy();
    v29.positionMotor = nil;
    v29.overlayMotor:destroy();
    v29.overlayMotor = nil;
end;
return v8;
