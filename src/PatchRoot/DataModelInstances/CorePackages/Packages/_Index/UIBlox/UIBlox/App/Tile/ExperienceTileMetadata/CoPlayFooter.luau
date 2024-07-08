local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.React);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v5 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v6 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local _ = require(l_Parent_0.App.Style.Fonts);
local v9 = {
    size = UDim2.fromScale(1, 1), 
    faceGroupCount = 3, 
    maxBadgeDisplayNumber = 99, 
    styleProps = {}, 
    showEmphasisBorder = false
};
local v10 = {
    containerGap = 6, 
    faceGroupGap = -9, 
    faceBorderWidth = 3, 
    faceBorderRadius = 50, 
    faceWidth = 24, 
    faceHeight = 24, 
    badgeBorderWidth = 3, 
    badgeBorderRadius = 50, 
    badgeSpacingLeading = 9, 
    badgeSpacingTrailing = 9, 
    badgeHeight = 24
};
local function _(v11)
    return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v11)));
end;
local function v14(v13)
    return v3.createElement(v3.Fragment, nil, {
        Corner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, v13.borderRadius)
        }), 
        Stroke = v3.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v13.borderColor.Color, 
            Transparency = v13.borderColor.Transparency, 
            Thickness = v13.borderWidth
        })
    });
end;
local function v22(v15, v16, v17, v18)
    local l_Theme_0 = v17.Theme;
    local v20 = v15 - 1;
    local v21 = (1 - v15) / 2;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v21, 0, v21), 
        Size = UDim2.new(1, v20, 1, v20), 
        ZIndex = v18
    }, {
        v14({
            borderWidth = 1, 
            borderColor = l_Theme_0.ContextualPrimaryDefault, 
            borderRadius = v16.badgeBorderRadius
        })
    });
end;
local function v37(v23, v24, v25)
    local v26 = nil;
    v26 = if v23.maxDisplayNumber < v23.usersCount then tostring(v23.maxDisplayNumber) .. "+" else tostring(v23.usersCount);
    local l_Theme_1 = v25.Theme;
    local l_Font_0 = v25.Font;
    local v29 = v24.badgeBackgroundColor or l_Theme_1.BackgroundUIDefault;
    local l_badgeBorderWidth_0 = v24.badgeBorderWidth;
    local v31 = v24.badgeBorderColor or v25.Theme.BackgroundDefault;
    local l_badgeBorderRadius_0 = v24.badgeBorderRadius;
    local l_badgeSpacingLeading_0 = v24.badgeSpacingLeading;
    local l_badgeSpacingTrailing_0 = v24.badgeSpacingTrailing;
    local l_badgeHeight_0 = v24.badgeHeight;
    local v36 = v24.badgeContentColor or l_Theme_1.TextMuted;
    return v3.createElement("Frame", {
        LayoutOrder = v23.layoutOrder, 
        ZIndex = v23.ZIndex, 
        Size = UDim2.fromOffset(0, l_badgeHeight_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v29.Color, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        BadgeContainer = v3.createElement("Frame", {
            LayoutOrder = v23.layoutOrder, 
            ZIndex = v23.ZIndex, 
            Size = UDim2.fromOffset(0, l_badgeHeight_0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v29.Color, 
            BackgroundTransparency = v29.Transparency, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            v14({
                borderWidth = l_badgeBorderWidth_0, 
                borderColor = v31, 
                borderRadius = l_badgeBorderRadius_0
            }); 
            SizeConstraint = v3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(l_badgeHeight_0, 0)
            }), 
            Content = v3.createElement("TextLabel", {
                Size = UDim2.fromScale(1, 1), 
                BorderSizePixel = 0, 
                Text = v26, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                TextColor3 = v36.Color, 
                TextTransparency = v36.Transparency, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.X, 
                ZIndex = v23.ZIndex + 1
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_badgeSpacingLeading_0), 
                    PaddingRight = UDim.new(0, l_badgeSpacingTrailing_0)
                })
            })
        }), 
        emphasisBorder = if not v23.showEmphasisBorder then nil else v22(l_badgeBorderWidth_0, v24, v25, v23.ZIndex + 1)
    });
end;
local function v43(v38, v39, v40)
    local v41 = v39.faceBackgroundColor or v40.Theme.TextDefault;
    local l_faceBorderWidth_0 = v39.faceBorderWidth;
    return v3.createElement(l_Label_0, {
        LayoutOrder = v38.layoutOrder, 
        ZIndex = v38.ZIndex, 
        Size = UDim2.fromOffset(v39.faceWidth, v39.faceHeight), 
        Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v38.user))), 
        BackgroundColor3 = v41.Color, 
        BackgroundTransparency = v41.Transparency, 
        BorderSizePixel = 0
    }, {
        v14({
            borderWidth = l_faceBorderWidth_0, 
            borderColor = v39.faceBorderColor or v40.Theme.BackgroundDefault, 
            borderRadius = v39.faceBorderRadius
        }); 
        emphasisBorder = if not v38.showEmphasisBorder then nil else v22(l_faceBorderWidth_0, v39, v40, v38.ZIndex + 1)
    });
end;
local function v57(v44, v45, v46, v47, v48, v49)
    local l_users_0 = v44.users;
    local l_faceGroupGap_0 = v45.faceGroupGap;
    local l_badgeBorderWidth_1 = v45.badgeBorderWidth;
    local l_faceBorderWidth_1 = v45.faceBorderWidth;
    local v54 = math.max(l_badgeBorderWidth_1, l_faceBorderWidth_1);
    local v55 = {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_faceGroupGap_0)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_badgeBorderWidth_1), 
            PaddingTop = UDim.new(0, v54), 
            PaddingRight = UDim.new(0, l_faceBorderWidth_1), 
            PaddingBottom = UDim.new(0, v54)
        }), 
        Badge = if not v48 then nil else v37({
            usersCount = #l_users_0, 
            layoutOrder = 0, 
            ZIndex = v47 + 1, 
            maxDisplayNumber = v44.maxBadgeDisplayNumber, 
            showEmphasisBorder = v44.showEmphasisBorder
        }, v45, v46)
    };
    for v56 = 1, math.min(v49, #l_users_0) do
        v55["Face_" .. v56] = v43({
            user = l_users_0[v56], 
            layoutOrder = v56, 
            ZIndex = v47 - v56, 
            showEmphasisBorder = v44.showEmphasisBorder
        }, v45, v46);
    end;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v55);
end;
return function(v58)
    local v59 = v2.Dictionary.join(v9, v58);
    if not v59.users or #v59.users == 0 then
        return nil;
    else
        local v60 = v6();
        local v61, v62 = v3.useBinding(Vector2.new(0, 0));
        local v63 = v2.Dictionary.join(v10, v59.styleProps);
        local l_containerGap_0 = v63.containerGap;
        local v65 = v63.labelContentColor or v60.Theme.TextMuted;
        local l_faceGroupCount_0 = v59.faceGroupCount;
        local v67 = l_faceGroupCount_0 + 1 < #v59.users;
        if not v67 then
            l_faceGroupCount_0 = l_faceGroupCount_0 + 1;
        end;
        return v3.createElement("Frame", {
            Size = v59.size, 
            Position = v59.position, 
            AnchorPoint = v59.anchorPoint, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v59.layoutOrder
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_containerGap_0)
            }), 
            FacesFrame = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                [v3.Change.AbsoluteSize] = v3.useCallback(function(v68)
                    v62(v68.AbsoluteSize);
                end, {
                    v62
                })
            }, {
                Faces = v57(v59, v63, v60, l_faceGroupCount_0 + 1, v67, l_faceGroupCount_0)
            }), 
            LabelFrame = if not v59.labelText then nil else v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = v61:map(function(v69)
                    return UDim2.new(1, -v69.X - l_containerGap_0, 1, 0);
                end), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Label = v3.createElement(v5, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v59.labelText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = v63.fontStyle or v60.Font.CaptionBody, 
                    colorStyle = v65
                })
            })
        });
    end;
end;
