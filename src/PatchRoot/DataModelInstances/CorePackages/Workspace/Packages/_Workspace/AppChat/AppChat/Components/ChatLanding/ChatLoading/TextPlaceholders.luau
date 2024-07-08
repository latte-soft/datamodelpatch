local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_ShimmerPanel_0 = require(l_Parent_0.UIBlox).App.Loading.ShimmerPanel;
local v5 = v2.PureComponent:extend("TextPlaceholders");
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewAppChatLoadingIndicator);
v5.defaultProps = {
    LayoutOrder = 0, 
    avatarSize = 60, 
    avatarCellWidth = 60
};
v5.render = function(v7)
    return l_withStyle_0(function(_)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, if not v6() then -v7.props.avatarSize else -v7.props.avatarCellWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v7.props.LayoutOrder
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, not v6() and 9 or 0)
            }), 
            UIList = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            topRectangle = v2.createElement(l_ShimmerPanel_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(0, 94, 0, 12)
            }), 
            spacer = v2.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 7), 
                BackgroundTransparency = 1
            }), 
            bottomRectangle = v2.createElement(l_ShimmerPanel_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(0, 169, 0, 12)
            })
        });
    end);
end;
return v5;
