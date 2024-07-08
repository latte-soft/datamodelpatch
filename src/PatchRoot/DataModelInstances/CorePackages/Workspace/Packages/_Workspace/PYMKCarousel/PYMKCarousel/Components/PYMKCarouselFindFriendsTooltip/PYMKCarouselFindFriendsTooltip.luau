local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_TooltipCallout_0 = l_UIBlox_0.App.Dialog.TooltipCallout;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v7 = require(l_Parent_0.Common.TextKeys);
return function()
    local v8, v9 = l_React_0.useState(0);
    local v10 = l_UIBlox_0.Core.Style.useStyle();
    local v11 = l_useLocalization_0({
        findFriendsTitle = v7.FindFriendsTooltipTitle, 
        findFriendsBody = v7.FindFriendsTooltipBody
    });
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [l_React_0.Change.AbsoluteSize] = function(v12)
            v9((math.max(0, v12.AbsoluteSize.Y - 100)));
        end, 
        Position = UDim2.new(0, 0, 0, v8)
    }, {
        Tooltip = l_React_0.createElement(l_TooltipCallout_0, {
            headerText = v11.findFriendsTitle, 
            bodyText = v11.findFriendsBody, 
            orientation = l_TooltipOrientation_0.Right, 
            distanceOffset = -12, 
            triggerPointCenter = Vector2.new(0, 50), 
            canvasBackground = v10.Theme.BackgroundDefault, 
            contentOffsetVector = Vector2.zero, 
            triggerPointRadius = Vector2.zero
        })
    });
end;
