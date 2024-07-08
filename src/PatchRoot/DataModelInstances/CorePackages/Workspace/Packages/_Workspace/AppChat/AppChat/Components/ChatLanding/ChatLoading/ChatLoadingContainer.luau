local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(script.Parent.ChatLoadingIndicator);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewAppChatLoadingIndicator);
local v6 = v2.PureComponent:extend("ChatLoadingContainer");
v6.defaultProps = {
    topBarHeight = 0, 
    cellHeight = not v5() and 72 or 64, 
    cellWidth = 375
};
v6.render = function(v7)
    return l_withStyle_0(function(v8)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v8.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v8.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            ChatLoadingFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -v7.props.topBarHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ChatLoadingIndicator = v2.createElement(v4, {
                    cellHeight = v7.props.cellHeight, 
                    cellWidth = v7.props.cellWidth
                })
            })
        });
    end);
end;
return v6;
