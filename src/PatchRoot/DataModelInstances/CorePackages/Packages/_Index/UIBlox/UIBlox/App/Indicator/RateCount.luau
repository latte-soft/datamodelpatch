local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v7 = require(l_Parent_3.Cryo);
local _ = require(l_Parent_1.Style.StyleTypes);
local v9 = require(l_Parent_2.Core.Style.Validator.validateColorInfo);
local v10 = require(l_Parent_1.ImageSet.Images);
local v11 = require(l_Parent_1.Button.IconButton);
local v12 = require(l_Parent_1.ImageSet.getIconSize);
local v13 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v14 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v15 = require(l_Parent_2.Core.Style.withStyle);
local v16 = require(l_Parent_0.Enum.VoteStates);
local v17 = v10["icons/status/games/rating_large"];
local v18 = v10["icons/actions/vote/voteDownOff"];
local v19 = v10["icons/actions/vote/voteDownOn"];
local v20 = v10["icons/actions/vote/voteUpOff"];
local v21 = v10["icons/actions/vote/voteUpOn"];
local v22 = {
    containerSpacingTop = 12, 
    containerSpacingTrailing = 12, 
    containerSpacingBottom = 12, 
    containerSpacingLeading = 12, 
    containerBorderRadius = 8, 
    containerGap = 12, 
    statWidgetContainerGap = 12, 
    statWidgetIconSize = v12(v13.Large), 
    statWidgetDataGap = 0, 
    buttonGroupGap = 12, 
    buttonSize = 44, 
    buttonIconSizeEnum = v13.Medium
};
local v23 = v4.PureComponent:extend("RateCount");
v23.validateProps = v5.strictInterface({
    position = v5.optional(v5.UDim2), 
    layoutOrder = v5.optional(v5.integer), 
    anchorPoint = v5.optional(v5.Vector2), 
    width = v5.optional(v5.integer), 
    height = v5.optional(v5.integer), 
    rateText = v5.optional(v5.string), 
    rateLabel = v5.optional(v5.string), 
    voteState = v5.optional(v16.isEnumValue), 
    onVoteDownActivated = v5.optional(v5.callback), 
    onVoteUpActivated = v5.optional(v5.callback), 
    styleProps = v5.optional(v5.strictInterface({
        containerSpacingTop = v5.optional(v5.integer), 
        containerSpacingTrailing = v5.optional(v5.integer), 
        containerSpacingBottom = v5.optional(v5.integer), 
        containerSpacingLeading = v5.optional(v5.integer), 
        containerBorderRadius = v5.optional(v5.integer), 
        containerBackgroundColor = v5.optional(v9), 
        containerGap = v5.optional(v5.integer), 
        statWidgetContainerGap = v5.optional(v5.integer), 
        statWidgetIconSize = v5.optional(v5.integer), 
        statWidgetIconContentColor = v5.optional(v9), 
        statWidgetDataGap = v5.optional(v5.integer), 
        statWidgetDataContentColor = v5.optional(v9), 
        statWidgetDataLabelContentColor = v5.optional(v9), 
        buttonGroupGap = v5.optional(v5.integer), 
        buttonSize = v5.optional(v5.integer), 
        buttonIconSizeEnum = v5.optional(v13.isEnumValue)
    }))
});
v23.defaultProps = {
    height = 72, 
    rateText = "", 
    rateLabel = "", 
    voteState = v16.notVoted
};
v23.init = function(v24)
    v24.onVoteDownActivated = function()
        local l_onVoteDownActivated_0 = v24.props.onVoteDownActivated;
        if l_onVoteDownActivated_0 then
            l_onVoteDownActivated_0();
        end;
    end;
    v24.onVoteUpActivated = function()
        local l_onVoteUpActivated_0 = v24.props.onVoteUpActivated;
        if l_onVoteUpActivated_0 then
            l_onVoteUpActivated_0();
        end;
    end;
end;
v23.render = function(v27)
    local l_position_0 = v27.props.position;
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_anchorPoint_0 = v27.props.anchorPoint;
    local l_width_0 = v27.props.width;
    local l_height_0 = v27.props.height;
    local v33 = nil;
    v33 = if not l_width_0 then UDim2.new(1, 0, 0, l_height_0) else UDim2.new(0, l_width_0, 0, l_height_0);
    local l_rateText_0 = v27.props.rateText;
    local l_rateLabel_0 = v27.props.rateLabel;
    local l_voteState_0 = v27.props.voteState;
    local v37 = l_voteState_0 == v16.votedDown;
    local v38 = l_voteState_0 == v16.votedUp;
    return v15(function(v39)
        local v40 = v7.Dictionary.join(v22, v27.props.styleProps or {});
        local l_containerSpacingLeading_0 = v40.containerSpacingLeading;
        local l_containerSpacingTrailing_0 = v40.containerSpacingTrailing;
        local l_containerBorderRadius_0 = v40.containerBorderRadius;
        local v44 = v40.containerBackgroundColor or v39.Theme.BackgroundContrast;
        local l_containerGap_0 = v40.containerGap;
        local l_statWidgetContainerGap_0 = v40.statWidgetContainerGap;
        local l_statWidgetIconSize_0 = v40.statWidgetIconSize;
        local v48 = v40.statWidgetIconContentColor or v39.Theme.IconEmphasis;
        local l_statWidgetDataGap_0 = v40.statWidgetDataGap;
        local v50 = v40.statWidgetDataContentColor or v39.Theme.TextEmphasis;
        local v51 = v40.statWidgetDataLabelContentColor or v39.Theme.TextEmphasis;
        local l_buttonGroupGap_0 = v40.buttonGroupGap;
        local l_buttonSize_0 = v40.buttonSize;
        local l_buttonIconSizeEnum_0 = v40.buttonIconSizeEnum;
        return v4.createElement("Frame", {
            Size = v33, 
            Position = l_position_0, 
            AnchorPoint = l_anchorPoint_0, 
            BackgroundColor3 = v44.Color, 
            BackgroundTransparency = v44.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0
        }, {
            RoundCorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_containerBorderRadius_0)
            }), 
            ListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_containerGap_0)
            }), 
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_containerSpacingLeading_0), 
                PaddingRight = UDim.new(0, l_containerSpacingTrailing_0)
            }), 
            Icon = v4.createElement(l_Label_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(l_statWidgetIconSize_0, l_statWidgetIconSize_0), 
                Image = v17, 
                ImageColor3 = v48.Color, 
                ImageTransparency = v48.Transparency, 
                BackgroundTransparency = 1
            }), 
            TextSection = v4.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, -((((l_statWidgetIconSize_0 + math.max(v12(l_buttonIconSizeEnum_0, v39), l_buttonSize_0) * 2) + l_statWidgetContainerGap_0) + l_containerGap_0) + l_buttonGroupGap_0), 0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, l_statWidgetDataGap_0)
                }), 
                RateText = v4.createElement(v14, {
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = l_rateText_0, 
                    colorStyle = v50, 
                    fontStyle = v39.Font.Title, 
                    BackgroundTransparency = 1
                }), 
                RateLabel = v4.createElement(v14, {
                    LayoutOrder = 2, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = l_rateLabel_0, 
                    colorStyle = v51, 
                    fontStyle = v39.Font.CaptionHeader, 
                    BackgroundTransparency = 1
                })
            }), 
            VoteDown = v4.createElement(v11, {
                layoutOrder = 3, 
                size = UDim2.fromOffset(l_buttonSize_0, l_buttonSize_0), 
                icon = not not v37 and v19 or v18, 
                iconColor3 = v39.Theme.IconEmphasis.Color, 
                iconSize = l_buttonIconSizeEnum_0, 
                onActivated = v27.onVoteDownActivated, 
                showBackground = true
            }), 
            VoteUp = v4.createElement(v11, {
                layoutOrder = 4, 
                size = UDim2.fromOffset(l_buttonSize_0, l_buttonSize_0), 
                icon = not not v38 and v21 or v20, 
                iconColor3 = v39.Theme.IconEmphasis.Color, 
                iconSize = l_buttonIconSizeEnum_0, 
                onActivated = v27.onVoteUpActivated, 
                showBackground = true
            })
        });
    end);
end;
return v23;
