local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_script_FirstAncestor_0.Components.RightFlexRowLayout);
local v6 = require(l_script_FirstAncestor_0.Components.LeftFlexRowLayout);
local v7 = require(l_script_FirstAncestor_0.Enums.SuggestedItemTypeEnum);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local function v13(v12)
    return {
        barBackgroundColor = v12.Semantic.Color.Background.Default.Color3, 
        barBackgroundTransparency = v12.Semantic.Color.Background.Default.Transparency, 
        barHeight = v12.Global.Size_700, 
        iconAndTextInputMargin = v12.Global.Space_200, 
        iconOffsetX = v12.Global.Space_50, 
        iconContainerSize = v12.Global.Size_400, 
        textColorGroup = v12.Semantic.Color.Text.Emphasis, 
        textFontGroup = v12.Semantic.Typography.Body, 
        textIconColor = v12.Semantic.Color.Text.Emphasis.Color3, 
        textIconTransparency = v12.Semantic.Color.Text.Emphasis.Transparency, 
        textSize = v12.Semantic.Typography.Body.FontSize, 
        trailingIconSize = v12.Global.Size_200, 
        autocompleteIconSize = v12.Global.Size_300, 
        recentIconSize = v12.Global.Size_400
    };
end;
local function v15(v14)
    return {
        recent = {
            icon = l_Images_0["icons/menu/recent"], 
            size = v14.recentIconSize
        }, 
        autocomplete = {
            icon = l_Images_0["icons/common/search"], 
            size = v14.autocompleteIconSize
        }
    };
end;
local function _(v16, v17)
    local v18 = v15(v17);
    local v19 = nil;
    local v20 = nil;
    local v21 = false;
    if v16 == v7.Recent then
        return v18.recent.icon, v18.recent.size, true;
    else
        if v16 == v7.Autocomplete then
            v19 = v18.autocomplete.icon;
            v20 = v18.autocomplete.size;
        end;
        return v19, v20, v21;
    end;
end;
return function(v23)
    local v24 = l_useDesignTokens_0(v13);
    local v25 = v23.height or v24.barHeight;
    local l_text_0 = v23.text;
    local l_type_0 = v23.type;
    local v28 = v15(v24);
    local v29 = nil;
    local v30 = nil;
    local v31 = false;
    if l_type_0 == v7.Recent then
        v29 = v28.recent.icon;
        v30 = v28.recent.size;
        v31 = true;
    elseif l_type_0 == v7.Autocomplete then
        v29 = v28.autocomplete.icon;
        v30 = v28.autocomplete.size;
    end;
    local l_v29_0 = v29;
    local l_v30_0 = v30;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = v24.barBackgroundColor, 
        BackgroundTransparency = v24.barBackgroundTransparency, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v23.layoutOrder, 
        [v2.Event.Activated] = function()
            v23.onActivate();
        end
    }, {
        SuggestedItemInnerFrame = v2.createElement(v6, {
            Size = UDim2.new(1, 0, 0, v25), 
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            margin = v24.iconOffsetX, 
            flexSlot = v2.createElement(v5, {
                margin = v24.iconOffsetX, 
                rigidSlot = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Size = UDim2.fromOffset(v24.iconContainerSize, v24.iconContainerSize), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 0, 0.5, 0)
                }, {
                    SuggestedItemLeadingIcon = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_v29_0, 
                        ImageColor3 = v24.textIconColor, 
                        ImageTransparency = v24.textIconTransparency, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.fromOffset(l_v30_0, l_v30_0)
                    })
                }), 
                flexSlot = v2.createElement(l_StyledTextLabel_0, {
                    fontStyle = v24.textFontGroup, 
                    colorStyle = v24.textColorGroup, 
                    text = l_text_0 or "", 
                    textWrapped = false, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.X, 
                    size = UDim2.new(1, 0, 0, v25)
                })
            }), 
            rigidSlot = if not v31 then nil else v2.createElement(l_ImageSetButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = l_Images_0["icons/navigation/close_small"], 
                ImageColor3 = v24.textIconColor, 
                ImageTransparency = v24.textIconTransparency, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Size = UDim2.fromOffset(v24.trailingIconSize, v24.trailingIconSize), 
                [v2.Event.Activated] = function()
                    if v23.onTrailingButtonActivate then
                        v23.onTrailingButtonActivate();
                    end;
                end, 
                [v2.Tag] = "data-testid=AvatarExperienceSearch_SuggestedItem_TrailingButton"
            })
        })
    });
end;
