local l_Parent_0 = script:FindFirstAncestor("TenFootUiSharedComponents").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Style);
local l_useDesignTokens_0 = v3.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v3.mapTypographyVariantToFontEnum;
local l_GetTextSize_0 = v3.GetTextSize;
local l_TooltipOrientation_0 = require(l_Parent_0.UIBlox).App.Dialog.Enum.TooltipOrientation;
local l_IconWithTooltip_0 = require(l_Parent_0.AppBlox).IconWithTooltip;
local v9 = require(l_Parent_0.SharedFlags);
local l_GetFFlagTenFootUiSupportSortHeaderTooltip_0 = v9.GetFFlagTenFootUiSupportSortHeaderTooltip;
local l_GetFFlagTenFootUiSupportSortSubtitle_0 = v9.GetFFlagTenFootUiSupportSortSubtitle;
local v12 = Vector2.new(math.huge, math.huge);
return function(v13)
    local v15 = l_useDesignTokens_0(function(v14)
        return {
            textStyles = {
                Font = l_mapTypographyVariantToFontEnum_0(v14.Semantic.Typography.Header), 
                TextSize = v14.Semantic.Typography.Header.FontSize, 
                LineHeight = v14.Semantic.Typography.Header.LineHeight, 
                TextColor3 = v14.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v14.Semantic.Color.Text.Emphasis.Transparency
            }, 
            subtitleTextStyles = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else {
                Font = v14.Semantic.Typography.Body.Font, 
                TextSize = v14.Semantic.Typography.Body.FontSize, 
                LineHeight = v14.Semantic.Typography.Body.LineHeight, 
                TextColor3 = v14.Semantic.Color.Text.Default.Color3
            }, 
            paddingAboveSubtitle = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then nil else v14.Global.Space_50, 
            paddingBottom = v14.Global.Space_200
        };
    end);
    local v16 = v13.margin or 0;
    local v17 = l_GetTextSize_0(v13.text, v15.textStyles.TextSize, v15.textStyles.Font, v12);
    local v18 = nil;
    if not (not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() and not l_GetFFlagTenFootUiSupportSortSubtitle_0()) then
        v18 = {
            TitleAndTooltipPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v16), 
                PaddingRight = UDim.new(0, v16), 
                PaddingBottom = if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then UDim.new(0, v15.paddingBottom) else nil
            }), 
            TitleAndTooltipLayout = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then nil else v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SortTitleTextLabel = v2.createElement("TextLabel", v1.Dictionary.join(v15.textStyles, {
                Size = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then UDim2.fromScale(1, 1) else UDim2.new(0, v17.X, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v13.text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then nil else 1
            })), 
            SortTooltip = if not not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() and v13.tooltipHoverText then v2.createElement(l_IconWithTooltip_0, {
                tooltipOrientation = l_TooltipOrientation_0.Right, 
                hoverText = v13.tooltipHoverText, 
                triggerPointName = "GameSortTooltip", 
                supportTenFootUi = true, 
                layoutOrder = 2
            }) else nil
        };
    end;
    if not l_GetFFlagTenFootUiSupportSortSubtitle_0() then
        if not l_GetFFlagTenFootUiSupportSortHeaderTooltip_0() then
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v17.Y + v15.paddingBottom), 
                BackgroundTransparency = 1
            }, v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v16), 
                PaddingRight = UDim.new(0, v16), 
                PaddingBottom = UDim.new(0, v15.paddingBottom)
            }), v2.createElement("TextLabel", v1.Dictionary.join(v15.textStyles, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Text = v13.text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })));
        else
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v17.Y + v15.paddingBottom), 
                BackgroundTransparency = 1
            }, v18);
        end;
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, ((v17.Y + v15.paddingBottom) + if not not v13.subtitleText and v13.subtitleHeight then v13.subtitleHeight else 0) + (not v13.subtitleText and 0 or v15.paddingAboveSubtitle)), 
            BackgroundTransparency = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v16), 
                PaddingRight = UDim.new(0, v16), 
                PaddingBottom = UDim.new(0, v15.paddingBottom)
            }), 
            HeaderLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v15.paddingAboveSubtitle)
            }), 
            TitleAndTooltipFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v17.Y), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, v18), 
            SubtitleTextLabel = if not v13.subtitleText then nil else v2.createElement("TextLabel", v1.Dictionary.join(v15.subtitleTextStyles, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Text = v13.subtitleText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 2
            }))
        });
    end;
end;
