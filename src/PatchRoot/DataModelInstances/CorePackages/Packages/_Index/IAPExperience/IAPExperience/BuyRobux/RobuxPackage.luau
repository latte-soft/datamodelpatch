local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_DarkTheme_0 = v4.App.Style.Themes.DarkTheme;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local v14 = require(l_Parent_1.RoactGamepad);
local v15 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameHorizontal_0 = v15.FitFrameHorizontal;
local l_FitTextLabel_0 = v15.FitTextLabel;
local v18 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v19 = require(l_Parent_0.Utility.formatNumber);
local v20 = require(l_Parent_0.Flags.getEnableRobuxPageNewSelectionCursor);
local _ = v3.Component:extend(script.Name);
local v22 = l_Images_0["icons/common/robux"];
local function v32(v23, v24, v25, v26, v27)
    if v23.robuxAmount == nil then
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 404 * v23.scale, 0, 448 * v23.scale)
        }, {
            ShimmerPanel = v3.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 1, 0)
            })
        });
    else
        local l_Theme_0 = v25.Theme;
        local l_Font_0 = v25.Font;
        local v30 = 64 * v23.scale;
        local v31 = if l_Theme_0 == l_DarkTheme_0 then Color3.fromRGB(25, 27, 29) else Color3.fromRGB(242, 244, 245);
        if v23.selected then
            v31 = if l_Theme_0 == l_DarkTheme_0 then Color3.fromRGB(57, 59, 61) else Color3.fromRGB(255, 255, 255);
        end;
        return v3.createElement(v14.Focusable[l_ImageSetButton_0], {
            LayoutOrder = v23.layoutOrder, 
            BackgroundColor3 = l_Theme_0.UIEmphasis.Color, 
            BackgroundTransparency = l_Theme_0.UIEmphasis.Transparency, 
            Size = UDim2.new(0, 404 * v23.scale, 0, 448 * v23.scale), 
            Image = nil, 
            SelectionImageObject = if not v20() then v26(l_CursorKind_0.RoundedRect) else v27, 
            [v3.Ref] = v23.forwardRef, 
            NextSelectionUp = nil, 
            NextSelectionDown = nil, 
            NextSelectionLeft = v23.nextSelectionLeft, 
            NextSelectionRight = v23.nextSelectionRight, 
            inputBindings = {
                Activated = if v23.onActivated ~= nil then v14.Input.onBegin(Enum.KeyCode.ButtonA, function()
                    v23.onActivated(v23.packageId);
                end) else nil
            }, 
            [v3.Event.Activated] = function()
                v23.onActivated(v23.packageId);
            end, 
            [v3.Event.MouseMoved] = function()
                v23.onHover(v23.forwardRef, true);
            end, 
            [v3.Event.MouseEnter] = function()
                v23.onHover(v23.forwardRef, true);
            end, 
            [v3.Event.MouseLeave] = function()
                v23.onHover(v23.forwardRef, false);
            end, 
            [v3.Event.SelectionGained] = function()
                v23.onSelect(v23.forwardRef);
            end
        }, {
            Corner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Outline = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = v31, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -3, 1, -3)
            }, {
                Corner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), 
                MiddleContent = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24 * v23.scale)
                    }), 
                    v3.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 17.5 * v23.scale)
                    }), 
                    RobuxImageFrame = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(192 * v23.scale, 192 * v23.scale), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        RobuxImage = v3.createElement(l_ImageSetLabel_0, {
                            Size = if not v23.selected then UDim2.fromOffset(192 * v23.scale, 192 * v23.scale) else UDim2.fromOffset((192 * v23.scale) * 1.6, (192 * v23.scale) * 1.6), 
                            Position = if not v23.selected then UDim2.new(0.5, 0, 0.5, 0) else UDim2.new(0.5, 0, 0.3, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v23.robuxImage, 
                            ImageTransparency = 0
                        })
                    }), 
                    RobuxAmount = v3.createElement(l_FitFrameHorizontal_0, {
                        LayoutOrder = 2, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        height = UDim.new(0, v30), 
                        contentPadding = UDim.new(0, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1
                    }, {
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, v30, 0, v30), 
                            Image = v22, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = l_Theme_0.TextEmphasis.Transparency
                        }), 
                        RobuxAmountText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v19(l_LocalizationService_0.RobloxLocaleId, v23.robuxAmount), 
                            Font = l_Font_0.Title.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v30, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    CurrencyAmmountText = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v23.currencyAmountStr, 
                        Font = l_Font_0.Header1.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = 32 * v23.scale, 
                        BackgroundTransparency = 1
                    }), 
                    MoreText = not not v23.robuxMoreAmount and v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Text = v24.moreRobux, 
                        Font = l_Font_0.Header2.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = 32 * v23.scale, 
                        BackgroundTransparency = 1
                    }, {
                        Gradient = v3.createElement("UIGradient", {
                            Rotation = 0, 
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 251, 103)), 
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(243, 185, 34))
                            })
                        })
                    }) or nil
                })
            })
        });
    end;
end;
return function(v33)
    local v34 = if not v20() then nil else l_useCursor_0(UDim.new(0, 8));
    return v3.createElement(v18, {
        keys = {
            moreRobux = {
                key = ("IAPExperience.BuyRobux.%s"):format("Text.MoreRobux2"), 
                params = {
                    robux = v19(l_LocalizationService_0.RobloxLocaleId, v33.robuxMoreAmount or 0)
                }
            }
        }, 
        render = function(v35)
            return l_withStyle_0(function(v36)
                return l_withSelectionCursorProvider_0(function(v37)
                    if v33.scale == nil then
                        v33.scale = 0.65;
                    end;
                    return v32(v33, v35, v36, v37, v34);
                end);
            end);
        end
    });
end;
