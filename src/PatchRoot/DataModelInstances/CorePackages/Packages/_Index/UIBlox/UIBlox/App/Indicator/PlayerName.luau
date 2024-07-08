local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Cryo);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
local _ = require(l_Parent_0.Style.StyleTypes);
local l_Label_0 = require(l_Parent_1.Core.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Parent_0.Loading.ShimmerPanel);
local v9 = require(l_Parent_1.Core.Style.useStyle);
local function v11(v10)
    return {
        iconLabelSpacing = v10.Global.Space_25, 
        iconSize = v10.Semantic.Icon.Size.Small, 
        iconColorStyle = v10.Semantic.Color.Icon.Default, 
        labelTypography = v10.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v10.Semantic.Color.Text.Default
    };
end;
local function _(v12)
    return {
        iconLabelSpacing = v12.Global.Space_25, 
        iconSize = v12.Semantic.Icon.Size.Small, 
        labelTypography = v12.Semantic.Typography.Subheader, 
        labelColorStyle = v12.Semantic.Color.Text.Emphasis
    };
end;
local function v15(v14)
    return {
        iconLabelSpacing = v14.Global.Space_25, 
        iconSize = v14.Global.Size_150, 
        iconColorStyle = v14.Semantic.Color.Icon.Default, 
        labelTypography = v14.Semantic.Typography.CaptionHeader, 
        labelColorStyle = v14.Semantic.Color.Text.Default
    };
end;
local function v36(v16)
    local l_layoutOrder_0 = v16.layoutOrder;
    local l_isReversed_0 = v16.isReversed;
    local l_itemProps_0 = v16.itemProps;
    local l_itemStyleDefaults_0 = v16.itemStyleDefaults;
    local l_icon_0 = l_itemProps_0.icon;
    local l_labelText_0 = l_itemProps_0.labelText;
    local l_useTextAsIcon_0 = l_itemProps_0.useTextAsIcon;
    local l_onActivated_0 = l_itemProps_0.onActivated;
    local v25 = if l_itemProps_0.isLoading ~= nil then l_itemProps_0.isLoading else false;
    local v26 = v4.Dictionary.join(l_itemStyleDefaults_0, l_itemProps_0.styleProps or {});
    local l_iconLabelSpacing_0 = v26.iconLabelSpacing;
    local l_iconSize_0 = v26.iconSize;
    local v29 = v26.iconColorStyle or {};
    local l_labelTypography_0 = v26.labelTypography;
    local l_labelColorStyle_0 = v26.labelColorStyle;
    local v32 = not v25 and (l_icon_0 and true or false);
    local v33 = not v25 and (l_onActivated_0 and true or false);
    local v34 = nil;
    if v25 then
        v34 = if not l_icon_0 then l_labelTypography_0.FontSize else math.max(l_iconSize_0, l_labelTypography_0.FontSize);
    end;
    local v35 = nil;
    if v32 then
        v35 = if not l_useTextAsIcon_0 then v3.createElement(l_Label_0, {
            LayoutOrder = not l_isReversed_0 and 1 or 2, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            Image = l_icon_0, 
            ImageColor3 = v29.Color3, 
            ImageTransparency = not v29.Transparency and 0 or v29.Transparency, 
            BackgroundTransparency = 1, 
            Selectable = false
        }) else v3.createElement("TextLabel", {
            LayoutOrder = not l_isReversed_0 and 1 or 2, 
            Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
            BackgroundTransparency = 1, 
            Text = l_icon_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_labelTypography_0.Font, 
            TextSize = l_iconSize_0, 
            TextColor3 = v29.Color3, 
            TextTransparency = not v29.Transparency and 0 or v29.Transparency, 
            Selectable = false
        });
    end;
    return v3.createElement(not v33 and "Frame" or "TextButton", {
        Text = if not v33 then nil else "", 
        AutoButtonColor = if not v33 then nil else false, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        Selectable = not not v33 or false, 
        [v3.Event.Activated] = if not v33 then nil else l_onActivated_0
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_iconLabelSpacing_0)
        }), 
        Shimmer = if not v25 then nil else v3.createElement(v8, {
            Size = UDim2.new(1, 0, 0, v34)
        }), 
        Icon = v35, 
        Label = if v25 then nil else v3.createElement("TextLabel", {
            LayoutOrder = not l_isReversed_0 and 2 or 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1, 
            Text = l_labelText_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_labelTypography_0.Font, 
            TextSize = l_labelTypography_0.FontSize, 
            TextColor3 = l_labelColorStyle_0.Color3, 
            TextTransparency = l_labelColorStyle_0.Transparency, 
            Selectable = false
        })
    });
end;
return function(v37)
    local v38 = v9();
    local l_position_0 = v37.position;
    local l_anchorPoint_0 = v37.anchorPoint;
    local l_size_0 = v37.size;
    local v42 = v37.automaticSize or Enum.AutomaticSize.Y;
    local l_layoutOrder_1 = v37.layoutOrder;
    local v44 = v37.namesSpacing or v38.Tokens.Global.Space_50;
    local l_displayNameItem_0 = v37.displayNameItem;
    local l_userNameItem_0 = v37.userNameItem;
    local l_vendorNameItem_0 = v37.vendorNameItem;
    local l_aliasItem_0 = v37.aliasItem;
    local l_createElement_0 = v3.createElement;
    local v50 = "Frame";
    local v51 = {
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        Size = l_size_0, 
        AutomaticSize = v42, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_1, 
        Selectable = false
    };
    local v52 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v44)
        })
    };
    local v53;
    if not l_displayNameItem_0 then
        v53 = nil;
    else
        v53 = v3.createElement;
        local l_v36_0 = v36;
        local v55 = {
            layoutOrder = 1, 
            isReversed = true, 
            itemProps = l_displayNameItem_0
        };
        local l_Tokens_0 = v38.Tokens;
        v55.itemStyleDefaults = {
            iconLabelSpacing = l_Tokens_0.Global.Space_25, 
            iconSize = l_Tokens_0.Semantic.Icon.Size.Small, 
            labelTypography = l_Tokens_0.Semantic.Typography.Subheader, 
            labelColorStyle = l_Tokens_0.Semantic.Color.Text.Emphasis
        };
        v53 = v53(l_v36_0, v55);
    end;
    v52.DisplayName = v53;
    v52.UserName = if not l_userNameItem_0 then nil else v3.createElement(v36, {
        layoutOrder = 2, 
        itemProps = l_userNameItem_0, 
        itemStyleDefaults = v15(v38.Tokens)
    });
    v52.VendorName = if not l_vendorNameItem_0 then nil else v3.createElement(v36, {
        layoutOrder = 3, 
        itemProps = l_vendorNameItem_0, 
        itemStyleDefaults = v11(v38.Tokens)
    });
    v52.Alias = if not l_aliasItem_0 then nil else v3.createElement(v36, {
        layoutOrder = 4, 
        itemProps = l_aliasItem_0, 
        itemStyleDefaults = v11(v38.Tokens)
    });
    return l_createElement_0(v50, v51, v52);
end;
