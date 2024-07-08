local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_Tooltip_0 = l_UIBlox_0.App.Dialog.Tooltip;
local l_Dash_0 = v1.Dash;
local l_useState_0 = l_React_0.useState;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
local v13 = {
    layoutOrder = 0, 
    friendRequestCount = 0, 
    onActivated = l_Dash_0.noop, 
    showTooltip = false
};
return function(v14)
    local v15 = l_Dash_0.join(v13, v14);
    local v16, v17 = l_useState_0(240);
    local function v19(v18)
        if not (not v18 or not v18:FindFirstChild("CallToActionTooltip", true)) then
            v17(l_getDeepValue_0(v18, "CallToActionTooltip.TooltipContainer.AbsoluteSize.X") or 240);
        end;
    end;
    local v20 = l_useLocalization_0({
        tooltipMessage = v4.NO_FRIENDS_TOOLTIP
    });
    local l_createElement_0 = l_React_0.createElement;
    local l_l_IconButton_0_0 = l_IconButton_0;
    local v23 = {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/actions/friends/friendAdd"], 
        position = v15.position, 
        anchorPoint = Vector2.new(1, 0.5), 
        layoutOrder = v15.layoutOrder, 
        onActivated = v15.onActivated
    };
    local v24 = {};
    local l_createElement_1 = l_React_0.createElement;
    local v26 = "Frame";
    local v27 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [l_React_0.Change.AbsoluteSize] = v19
    };
    local v28 = {};
    local v29 = false;
    if v15.friendRequestCount > 0 then
        v29 = l_React_0.createElement(l_Badge_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 1), 
            value = v15.friendRequestCount
        });
    end;
    v28.FriendRequestsBadge = v29;
    v28.CallToActionTooltip = v15.showTooltip and l_React_0.createElement(l_Tooltip_0, {
        position = UDim2.new(0, 42.5 - v16, 0, 36), 
        triggerPosition = Vector2.new(0, 0), 
        triggerSize = Vector2.new(36, 0), 
        bodyText = v20.tooltipMessage, 
        forceClickTriggerPoint = true, 
        isDirectChild = true
    });
    v24.ImagesContainer = l_createElement_1(v26, v27, v28);
    return l_createElement_0(l_l_IconButton_0_0, v23, v24);
end;
