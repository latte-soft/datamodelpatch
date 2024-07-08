local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v8 = require(l_Parent_0.Common.TextKeys);
local v9 = require(l_Parent_0.Flags.FFlagFriendsCarouselUILoadingTime);
local v10 = l_Roact_0.PureComponent:extend("FindFriendsHint");
v10.defaultProps = {
    tileHeight = 100
};
v10.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.number, 
    tileHeight = l_t_0.number, 
    showNewAddFriendsUIVariant = l_t_0.optional(l_t_0.boolean), 
    onDidMount = l_t_0.optional(l_t_0.callback)
});
v10.didMount = function(v11)
    local l_props_0 = v11.props;
    if not (not v9 or not l_props_0.onDidMount) then
        l_props_0.onDidMount();
    end;
end;
v10.render = function(v13)
    local l_props_1 = v13.props;
    return l_withLocalization_0({
        findFriendsTitle = if not l_props_1.showNewAddFriendsUIVariant then v8.FindFriendsTitle else v8.FindFriendsTitleV2, 
        findFriendsBody = if not l_props_1.showNewAddFriendsUIVariant then v8.FindFriendsBody else v8.FindFriendsBodyV2
    })(function(v15)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 250, 1, 0), 
            LayoutOrder = l_props_1.layoutOrder, 
            BackgroundTransparency = 1
        }, {
            HintFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                Tooltip = l_Roact_0.createElement(l_Tooltip_0, {
                    triggerPosition = Vector2.new(0, l_props_1.tileHeight), 
                    triggerSize = Vector2.new(-12, l_props_1.tileHeight), 
                    bodyText = v15.findFriendsBody, 
                    headerText = v15.findFriendsTitle, 
                    orientation = l_TooltipOrientation_0.Right, 
                    forceClickTriggerPoint = true, 
                    isDirectChild = true
                })
            })
        });
    end);
end;
return v10;
