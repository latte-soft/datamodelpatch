local v0 = require(script:FindFirstAncestor("FriendsLanding").AddFriends.dependencies);
local l_Dash_0 = v0.Dash;
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v7 = l_Roact_0.PureComponent:extend("HideableTooltip");
v7.validateProps = l_t_0.strictInterface({
    onClick = l_Dash_0.isCallable, 
    showTooltip = l_t_0.boolean, 
    bodyText = l_t_0.string, 
    headerText = l_t_0.string
});
v7.render = function(v8)
    local l_props_0 = v8.props;
    if l_props_0.showTooltip then
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 250, 0, 140), 
            Position = UDim2.new(0, 0, 0, 36), 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }, {
            Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                position = UDim2.new(0, 0, 0, 0), 
                triggerPosition = Vector2.new(0, 0), 
                triggerSize = Vector2.new(70, 0), 
                bodyText = l_props_0.bodyText, 
                headerText = l_props_0.headerText, 
                orientation = l_TooltipOrientation_0.Bottom, 
                forceClickTriggerPoint = true, 
                isDirectChild = true
            }), 
            DismissMask = l_Roact_0.createElement("TextButton", {
                Text = "", 
                Size = UDim2.new(0, 250, 0, 140), 
                BackgroundTransparency = 1, 
                [l_Roact_0.Event.Activated] = l_props_0.onClick, 
                ZIndex = 10
            })
        });
    else
        return nil;
    end;
end;
return v7;
