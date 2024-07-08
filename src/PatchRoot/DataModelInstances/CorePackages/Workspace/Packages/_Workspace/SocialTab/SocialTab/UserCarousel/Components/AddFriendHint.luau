local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local l_withLocalization_0 = v1.withLocalization;
local v8 = require(l_script_FirstAncestor_0.Enums.LocalizedKeys);
local v9 = l_Roact_0.PureComponent:extend("AddFriendHint");
v9.defaultProps = {
    layoutOrder = 0, 
    maxHintHeight = 100
};
v9.validateProps = l_t_0.interface({
    layoutOrder = l_t_0.optional(l_t_0.number), 
    maxHintHeight = l_t_0.number
});
v9.render = function(v10)
    return l_withLocalization_0({
        addFriendsHintText = v8.AddFriendsHintText.rawValue(), 
        addFriendsHintTitle = v8.AddFriendsHintTitle.rawValue()
    })(function(v11)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 0, 1, 0), 
            LayoutOrder = v10.props.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            HintFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.props.maxHintHeight), 
                BackgroundTransparency = 1
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = Vector2.new(0, v10.props.maxHintHeight), 
                    triggerSize = Vector2.new(-12, v10.props.maxHintHeight), 
                    bodyText = v11.addFriendsHintText, 
                    headerText = v11.addFriendsHintTitle, 
                    orientation = l_TooltipOrientation_0.Right, 
                    forceClickTriggerPoint = true, 
                    isDirectChild = true
                })
            })
        });
    end);
end;
return v9;
