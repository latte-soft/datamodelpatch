local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
if require(l_Parent_2.UIBloxConfig).useNewHeaderBar then
    local v4 = require(l_Parent_3.React);
    local v5 = require(l_Parent_3.Cryo);
    local _ = require(l_Parent_1.Style.StyleTypes);
    local _ = require(l_Parent_1.Style.Fonts);
    local v8 = require(l_Parent_2.Core.Style.useStyle);
    local v9 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
    local v10 = require(l_Parent_2.Core.Text.GetTextSize);
    local v11 = require(l_Parent_2.Core.Bar.ThreeSectionBar);
    local v12 = {
        barHeight = 48, 
        title = "", 
        isTitleCentered = true, 
        isSecondary = false, 
        isOnMedia = false, 
        hasDivider = false
    };
    local function v28(v13, v14)
        local l_Tokens_0 = v14.Tokens;
        local l_Theme_0 = v14.Theme;
        local l_backgroundStyle_0 = v13.backgroundStyle;
        local l_backgroundTransparency_0 = v13.backgroundTransparency;
        local l_isOnMedia_0 = v13.isOnMedia;
        local v21 = v4.useMemo(function()
            if not l_isOnMedia_0 then
                local v20 = l_backgroundStyle_0 or {
                    Color3 = l_Theme_0.BackgroundDefault.Color, 
                    Transparency = l_Theme_0.BackgroundDefault.Transparency
                };
                if l_backgroundTransparency_0 then
                    v20.Transparency = l_backgroundTransparency_0;
                end;
                return v20;
            else
                return {};
            end;
        end, {
            l_isOnMedia_0, 
            l_backgroundStyle_0, 
            l_backgroundTransparency_0, 
            l_Theme_0
        });
        local l_paddingTop_0 = v13.paddingTop;
        local l_paddingRight_0 = v13.paddingRight;
        local l_paddingBottom_0 = v13.paddingBottom;
        local l_paddingLeft_0 = v13.paddingLeft;
        local l_margin_0 = v13.margin;
        return {
            BackgroundStyle = v21, 
            Padding = v4.useMemo(function()
                local v27 = {
                    Top = l_paddingTop_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
                    Right = l_paddingRight_0 or UDim.new(0, l_Tokens_0.Global.Space_250), 
                    Bottom = l_paddingBottom_0 or UDim.new(0, l_Tokens_0.Global.Space_100), 
                    Left = l_paddingLeft_0 or UDim.new(0, l_Tokens_0.Global.Space_250)
                };
                if l_margin_0 then
                    v27.Left = UDim.new(0, l_margin_0);
                    v27.Right = UDim.new(0, l_margin_0);
                end;
                return v27;
            end, {
                l_paddingTop_0, 
                l_paddingRight_0, 
                l_paddingBottom_0, 
                l_paddingLeft_0, 
                l_margin_0, 
                l_Tokens_0
            })
        };
    end;
    local function v46(v29, v30)
        return v4.useMemo(function()
            local l_title_0 = v29.title;
            local l_renderLeft_0 = v29.renderLeft;
            local l_isTitleCentered_0 = v29.isTitleCentered;
            local l_isSecondary_0 = v29.isSecondary;
            local l_shouldHideSecondaryLeftItem_0 = v29.shouldHideSecondaryLeftItem;
            local v36 = true;
            if l_renderLeft_0 ~= nil then
                v36 = l_renderLeft_0 == v4.None;
            end;
            local l_Tokens_1 = v30.Tokens;
            local l_renderLeft_1 = v29.renderLeft;
            if v36 and string.len(l_title_0) > 0 then
                return function(v39)
                    return v4.createElement(v4.Fragment, nil, {
                        Text = v4.createElement(v9, {
                            fluidSizing = true, 
                            Text = l_title_0, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = l_Tokens_1.Semantic.Typography.Title, 
                            LineHeight = l_Tokens_1.Semantic.Typography.Title.LineHeight, 
                            colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                        }, (v5.Dictionary.join(v39.children, {
                            TextPadding = v4.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                                PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                            })
                        })))
                    });
                end;
            elseif not (not l_isSecondary_0 or l_shouldHideSecondaryLeftItem_0) and string.len(l_title_0) > 0 then
                local l_Theme_1 = v30.Theme;
                local l_Font_0 = v30.Font;
                local l_Header2_0 = l_Font_0.Header2;
                local v43 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
                return function()
                    return v4.createElement(v4.Fragment, nil, {
                        Text = v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v43), 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1
                        }, {
                            Layout = v4.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = UDim.new(0, 12)
                            }), 
                            Left = v4.createElement("Frame", {
                                LayoutOrder = 1, 
                                Selectable = false, 
                                Size = UDim2.fromOffset(0, 0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY
                            }, {
                                LeftContent = if not l_renderLeft_0 then nil else l_renderLeft_0()
                            }), 
                            Divider = v4.createElement("Frame", {
                                LayoutOrder = 2, 
                                Selectable = false, 
                                BackgroundColor3 = l_Theme_1.Divider.Color, 
                                BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                                BorderSizePixel = 0, 
                                Size = UDim2.new(0, 1, 1, 0)
                            }), 
                            TextLabel = v4.createElement(v9, {
                                LayoutOrder = 3, 
                                Selectable = false, 
                                ClipsDescendants = true, 
                                Text = l_title_0, 
                                TextTruncate = Enum.TextTruncate.AtEnd, 
                                TextWrapped = false, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                fontStyle = l_Header2_0, 
                                colorStyle = l_Theme_1.TextEmphasis
                            })
                        })
                    });
                end;
            else
                if not (l_isSecondary_0 or l_isTitleCentered_0) then
                    local l_Header_0 = l_Tokens_1.Semantic.Typography.Header;
                    local l_FontSize_0 = l_Header_0.FontSize;
                    l_renderLeft_1 = function()
                        return v4.createElement(v4.Fragment, nil, {
                            LeftFrame = v4.createElement("Frame", {
                                Selectable = false, 
                                Size = UDim2.new(1, 0, 0, l_FontSize_0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1
                            }, {
                                Layout = v4.createElement("UIListLayout", {
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = UDim.new(0, l_Tokens_1.Global.Space_150)
                                }), 
                                Left = v4.createElement("Frame", {
                                    LayoutOrder = 1, 
                                    Selectable = false, 
                                    Size = UDim2.fromOffset(0, 0), 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY
                                }, {
                                    LeftContent = if not l_renderLeft_0 then nil else l_renderLeft_0()
                                }), 
                                TextLabel = v4.createElement(v9, {
                                    LayoutOrder = 2, 
                                    Selectable = false, 
                                    ClipsDescendants = true, 
                                    Text = l_title_0, 
                                    TextTruncate = Enum.TextTruncate.AtEnd, 
                                    TextWrapped = false, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    fontStyle = l_Header_0, 
                                    colorStyle = l_Tokens_1.Semantic.Color.Text.Emphasis
                                }, {
                                    TextPadding = v4.createElement("UIPadding", {
                                        PaddingTop = UDim.new(0, l_Tokens_1.Global.Space_25), 
                                        PaddingBottom = UDim.new(0, l_Tokens_1.Global.Space_25)
                                    })
                                })
                            })
                        });
                    end;
                end;
                return l_renderLeft_1;
            end;
        end, {
            v29.title, 
            v29.isTitleCentered, 
            v29.renderLeft, 
            v29.isSecondary, 
            v29.shouldHideSecondaryLeftItem, 
            v30
        });
    end;
    return function(v47)
        local v48 = v5.Dictionary.join(v12, v47);
        local v49 = v8();
        local l_Tokens_2 = v49.Tokens;
        local l_title_1 = v48.title;
        local l_renderCenter_0 = v48.renderCenter;
        local l_renderRight_0 = v48.renderRight;
        local l_isTitleCentered_1 = v48.isTitleCentered;
        local l_isSecondary_1 = v48.isSecondary;
        local l_onHeaderActivated_0 = v48.onHeaderActivated;
        local l_contentPaddingRight_0 = v48.contentPaddingRight;
        local l_automaticHeight_0 = v48.automaticHeight;
        local l_isOnMedia_1 = v48.isOnMedia;
        local l_zIndex_0 = v48.zIndex;
        local l_hasDivider_0 = v48.hasDivider;
        local v62 = true;
        if v48.renderLeft ~= nil then
            v62 = v48.renderLeft == v4.None;
        end;
        local v63 = v46(v48, v49);
        local v67 = v4.useMemo(function()
            local l_l_renderCenter_0_0 = l_renderCenter_0;
            if not (((l_l_renderCenter_0_0 or v62) or l_isSecondary_1) or not l_isTitleCentered_1) then
                local l_Header_1 = l_Tokens_2.Semantic.Typography.Header;
                local l_FontSize_1 = l_Header_1.FontSize;
                l_l_renderCenter_0_0 = function()
                    return v4.createElement(v9, {
                        Selectable = false, 
                        ClipsDescendants = true, 
                        Size = UDim2.new(1, 0, 0, l_FontSize_1), 
                        Text = l_title_1, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = false, 
                        fontStyle = l_Header_1, 
                        colorStyle = l_Tokens_2.Semantic.Color.Text.Emphasis
                    }, {
                        TextPadding = v4.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_Tokens_2.Global.Space_25), 
                            PaddingBottom = UDim.new(0, l_Tokens_2.Global.Space_25)
                        })
                    });
                end;
            end;
            return l_l_renderCenter_0_0;
        end, {
            l_renderCenter_0, 
            v62, 
            l_isSecondary_1, 
            l_isTitleCentered_1, 
            l_Tokens_2
        });
        local v69 = v4.useMemo(function()
            if (not v63 or not l_renderCenter_0) or not l_renderRight_0 then
                if ((l_renderCenter_0 or v62) or l_isSecondary_1) or not l_isTitleCentered_1 then
                    return math.huge;
                else
                    local l_Header_2 = l_Tokens_2.Semantic.Typography.Header;
                    return v10(l_title_1, l_Header_2.FontSize, l_Header_2.Font, Vector2.new(math.huge, math.huge)).X;
                end;
            else
                return 0;
            end;
        end, {
            l_title_1, 
            l_isTitleCentered_1, 
            v62, 
            v63, 
            l_renderCenter_0, 
            l_renderRight_0, 
            l_isSecondary_1, 
            l_Tokens_2
        });
        local v70 = v4.useMemo(function()
            if not l_contentPaddingRight_0 then
                if not v62 then
                    return UDim.new(0, l_Tokens_2.Global.Space_300);
                else
                    return UDim.new(0, 0);
                end;
            else
                return l_contentPaddingRight_0;
            end;
        end, {
            l_contentPaddingRight_0, 
            v62, 
            l_Tokens_2
        });
        local v71 = v28(v48, v49);
        local l_BackgroundStyle_0 = v71.BackgroundStyle;
        local l_Padding_0 = v71.Padding;
        return v4.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.new(1, 0, 0, if not l_isOnMedia_1 then v48.barHeight else v48.barHeight + l_Tokens_2.Global.Size_500), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_BackgroundStyle_0.Color3, 
            BackgroundTransparency = l_BackgroundStyle_0.Transparency, 
            AutomaticSize = if not l_automaticHeight_0 then nil else Enum.AutomaticSize.Y, 
            ZIndex = l_zIndex_0
        }, {
            Gradient = if not l_isOnMedia_1 then nil else v4.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.7), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            }), 
            OnMediaExtendedHeight = if not l_isOnMedia_1 then nil else v4.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Tokens_2.Global.Size_500)
            }), 
            Bar = v4.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.fromScale(1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = l_Padding_0.Top, 
                    PaddingRight = l_Padding_0.Right, 
                    PaddingBottom = l_Padding_0.Bottom, 
                    PaddingLeft = l_Padding_0.Left
                }), 
                ThreeSectionBar = v4.createElement(v11, {
                    BackgroundTransparency = 1, 
                    barHeight = if not l_automaticHeight_0 then math.max(0, (v48.barHeight - l_Padding_0.Top.Offset) - l_Padding_0.Bottom.Offset) else 0, 
                    automaticHeight = l_automaticHeight_0, 
                    renderLeft = v63, 
                    renderCenter = v67, 
                    renderRight = l_renderRight_0, 
                    estimatedCenterWidth = v69, 
                    sectionSpacing = l_Tokens_2.Global.Space_150, 
                    contentPaddingRight = v70
                })
            }), 
            HeaderClickArea = if not l_onHeaderActivated_0 then nil else v4.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = "", 
                Size = UDim2.fromScale(1, 1), 
                Selectable = false, 
                [v4.Event.Activated] = l_onHeaderActivated_0, 
                ZIndex = 0
            }), 
            BottomDivider = if not l_hasDivider_0 then nil else v4.createElement("Frame", {
                Selectable = false, 
                Size = UDim2.new(1, 0, 0, l_Tokens_2.Global.Stroke_100), 
                Position = UDim2.new(0, 0, 1, -l_Tokens_2.Global.Stroke_100), 
                BackgroundColor3 = l_Tokens_2.Semantic.Color.Common.Divider.Color3, 
                BackgroundTransparency = l_Tokens_2.Semantic.Color.Common.Divider.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 1
            })
        });
    end;
else
    return require(l_Parent_0.HeaderBar_DEPRECATED);
end;
