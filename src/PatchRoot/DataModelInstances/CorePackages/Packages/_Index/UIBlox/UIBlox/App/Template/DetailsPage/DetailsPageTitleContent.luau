local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_1.Core.Style.withStyle);
local v4 = require(l_Parent_0.Text.StyledTextLabel);
local v5 = require(l_Parent_1.Core.Text.GetTextSize);
local v6 = require(l_Parent_2.Roact);
local v7 = require(l_Parent_2.t);
local v8 = v6.PureComponent:extend("DetailsPageTitleContent");
v8.validateProps = v7.strictInterface({
    titleText = v7.optional(v7.string), 
    subTitleText = v7.optional(v7.string), 
    renderInfoContent = v7.optional(v7.callback), 
    layoutOrder = v7.optional(v7.number), 
    verticalAlignment = v7.optional(v7.enum(Enum.VerticalAlignment))
});
v8.init = function(v9)
    v9.state = {
        containerWidth = nil
    };
    v9.onContainerSizeChange = function(v10)
        v9:setState(function(_, _)
            return {
                containerWidth = v10.AbsoluteSize.X
            };
        end);
    end;
    v9.getTextSize = function(v13, v14, v15)
        return v5(v13, v14.RelativeSize * v15.Font.BaseSize, v14.Font, (Vector2.new(10000, 10000)));
    end;
end;
v8.render = function(v16)
    return v3(function(v17)
        local l_Theme_0 = v17.Theme;
        local l_Font_0 = v17.Font;
        local v20 = UDim2.new(0, 0, 1, 0);
        if v16.props.titleText then
            local v21 = v16.getTextSize(v16.props.titleText, l_Font_0.Title, v17);
            local v22 = v21.Y * 1;
            v20 = if v16.state.containerWidth ~= nil and v16.state.containerWidth <= v21.X then UDim2.new(0, 0, 0, v22 * 2) else UDim2.new(0, 0, 0, v22);
        end;
        return v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v16.onContainerSizeChange, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v16.props.layoutOrder
        }, {
            ListLayout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = v16.props.verticalAlignment
            }), 
            Title = not not v16.props.titleText and v6.createElement(v4, {
                text = v16.props.titleText, 
                size = v20, 
                automaticSize = Enum.AutomaticSize.X, 
                fontStyle = l_Font_0.Title, 
                colorStyle = l_Theme_0.TextEmphasis, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                lineHeight = 1, 
                fluidSizing = false, 
                layoutOrder = 1, 
                richText = false
            }) or nil, 
            SubTitle = not not v16.props.subTitleText and v6.createElement(v4, {
                text = v16.props.subTitleText, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextMuted, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2, 
                richText = false
            }) or nil, 
            CustomContentComponentFrame = not not v16.props.renderInfoContent and v6.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                CustomContent = v16.props.renderInfoContent()
            }) or nil
        });
    end);
end;
return v8;
