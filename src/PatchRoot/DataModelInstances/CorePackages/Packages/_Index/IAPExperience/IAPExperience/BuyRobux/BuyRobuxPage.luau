local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.RoactGamepad);
local v7 = require(l_Parent_2.UIBlox);
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_DarkTheme_0 = v7.App.Style.Themes.DarkTheme;
local v15 = require(l_Parent_2.RoactFitComponents);
local l_FitFrameHorizontal_0 = v15.FitFrameHorizontal;
local l_FitTextLabel_0 = v15.FitTextLabel;
local v18 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v19 = require(l_Parent_1.Utility.formatNumber);
local v20 = require(l_Parent_1.Generic.Animator);
local v21 = require(l_Parent_1.Flags.getEnableCompensatingScrollingFrame);
local v22 = require(l_Parent_1.Utility.getUserInputEventData);
local v23 = require(l_Parent_0.RobuxPackage);
local v24 = v5.Component:extend(script.Name);
local v25 = l_Images_0["icons/common/goldrobux"];
local v26 = l_Images_0["icons/logo/block"];
local v27 = {
    l_Images_0["icons/graphic/robuxcoin1_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin2_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin3_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin4_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin5_xxlarge"], 
    l_Images_0["icons/graphic/robuxcoin6_xxlarge"]
};
local v28 = l_Images_0["icons/navigation/close"];
local _ = {
    dampingRatio = 1, 
    frequency = 1
};
v24.init = function(v30)
    v30.state = {
        selectedPackage = nil, 
        showMessageBanner = false
    };
    v30.buttonRefs = v6.createRefCache();
    v30.scrollingFrameRef = v5.createRef();
    v30.getGamepadNextSelectionLeft = function(v31)
        return v31 > 1 and v30.buttonRefs[v31 - 1] or nil;
    end;
    v30.getGamepadNextSelectionRight = function(v32)
        return v32 < #v30.buttonRefs and v30.buttonRefs[v32 + 1] or nil;
    end;
    v30.initSelectionChangedListener = function()
        if v30.selectionListener ~= nil then
            v30.selectionListener:Disconnect();
            v30.selectionListener = nil;
        end;
        if v30.selectionListener ~= nil then
            v30.selectionListener:Disconnect();
            v30.selectionListener = nil;
        end;
        v30.selectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
            if not (v30.state.selectedPackage ~= nil and l_GuiService_0.SelectedCoreObject ~= nil) or v30.state.selectedPackage ~= l_GuiService_0.SelectedCoreObject then
                v30:setState({
                    selectedPackage = l_GuiService_0.SelectedCoreObject
                });
            end;
        end);
    end;
end;
v24.didMount = function(v33)
    v33.initSelectionChangedListener();
end;
v24.didUpdate = function(v34, v35, _)
    local l_props_0 = v34.props;
    if not (not (v35.hasNativePurchaseSucceeded ~= l_props_0.hasNativePurchaseSucceeded) or not l_props_0.hasNativePurchaseSucceeded) then
        v34:setState({
            showMessageBanner = true
        });
        task.delay(3, function()
            v34:setState({
                showMessageBanner = false
            });
        end);
    end;
end;
v24.willUnmount = function(v38)
    if v38.selectionListener ~= nil then
        v38.selectionListener:Disconnect();
        v38.selectionListener = nil;
    end;
end;
v24.getScale = function(v39)
    if not v39.props.isConsoleSize then
        return 0.65;
    else
        return 1;
    end;
end;
v24.render = function(v40)
    return v5.createElement(v18, {
        keys = {
            BannerText = {
                key = ("IAPExperience.BuyRobux.%s"):format("Banner.Text")
            }, 
            BannerTitle = {
                key = ("IAPExperience.BuyRobux.%s"):format("Banner.Title")
            }, 
            SuccessfulMessage = {
                key = ("IAPExperience.BuyRobux.%s"):format("Alert.SuccessfulMessage")
            }
        }, 
        render = function(v41)
            return l_withSelectionCursorProvider_0(function(v42)
                return v40:renderWithLocale(v41, v42);
            end);
        end
    });
end;
v24.movePackageToAttentionArea = function(v43, v44)
    if v21() then
        local l_current_0 = v43.scrollingFrameRef.current;
        if not (l_current_0 ~= nil) or v44 == nil then
            return ;
        else
            local l_X_0 = l_current_0.AbsoluteSize.X;
            local v47 = 48 * v43:getScale();
            local v48 = v44.AbsolutePosition.X - v47;
            if v48 < 0 then
                l_current_0.CanvasPosition = Vector2.new(v48, 0);
                v43:reportScrollingFrameCompensationHappened();
                return ;
            elseif l_X_0 < (v44.AbsolutePosition.X + v44.AbsoluteSize.X) + v47 then
                l_current_0.CanvasPosition = Vector2.new(v48, 0);
                v43:reportScrollingFrameCompensationHappened();
                return ;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
v24.reportScrollingFrameCompensationHappened = function(v49)
    local l_props_1 = v49.props;
    if l_props_1.onAnalyticEvent then
        l_props_1.onAnalyticEvent("UserPurchaseFlow", (v22(l_props_1.analyticId, "", "BuyRobux", "ScrollingFrame", "Compensated")));
        return ;
    else
        return ;
    end;
end;
v24.renderWithLocale = function(v51, v52, v53)
    local l_props_2 = v51.props;
    return l_withStyle_0(function(v55)
        local l_Theme_0 = v55.Theme;
        local l_Font_0 = v55.Font;
        local v58 = l_props_2.robuxPackages ~= nil;
        local v59 = not v58 and 6 or #l_props_2.robuxPackages;
        local v60 = 32 * v51:getScale();
        local v61 = {
            LeadingPadding = v5.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                Size = UDim2.new(0, 80 * v51:getScale(), 0, 1)
            }), 
            RobuxPackageChildren = v5.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16 * v51:getScale())
            }), 
            TrailingPadding = v5.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = v59 + 1, 
                Size = UDim2.new(0, 80 * v51:getScale(), 0, 1)
            })
        };
        for v62 = 1, v59 do
            local v63 = v62 + 1;
            local l_createElement_0 = v5.createElement;
            local l_v23_0 = v23;
            local v66 = {
                layoutOrder = v62, 
                scale = v51:getScale()
            };
            local v67 = false;
            if v51.state.selectedPackage ~= nil then
                v67 = v51.state.selectedPackage == v51.buttonRefs[v62]:getValue();
            end;
            v66.selected = v67;
            v66.packageId = if not v58 then tostring(v62) else l_props_2.robuxPackages[v62].packageId;
            v66.robuxAmount = if not v58 then nil else l_props_2.robuxPackages[v62].robuxAmount;
            v66.currencyAmountStr = if not v58 then nil else l_props_2.robuxPackages[v62].currencyAmountStr;
            v66.robuxMoreAmount = if not v58 then nil else l_props_2.robuxPackages[v62].robuxMoreAmount;
            v66.robuxImage = v27[v62];
            v66.forwardRef = v51.buttonRefs[v62];
            v66.nextSelectionLeft = v51.getGamepadNextSelectionLeft(v62);
            v66.nextSelectionRight = v51.getGamepadNextSelectionRight(v62);
            v66.onActivated = function(v68)
                l_props_2.robuxPackageActivated(v68);
            end;
            v66.onSelect = function(v69)
                v51:movePackageToAttentionArea(v69:getValue());
            end;
            v66.onHover = function(v70, v71)
                if not v71 then
                    v51:setState({
                        selectedPackage = ""
                    });
                elseif v51.state.selectedPackage ~= v70:getValue() then
                    v51:setState({
                        selectedPackage = v70:getValue()
                    });
                    return ;
                end;
            end;
            v61[v63] = l_createElement_0(l_v23_0, v66);
        end;
        return v5.createElement(v6.Focusable.Frame, {
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0.8, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            BuyRobuxPageBackground = v5.createElement("Frame", {
                BackgroundTransparency = 0, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = v51.props.showBackground, 
                ZIndex = 0
            }, {
                BackgroundImage = v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0, 
                    Image = l_Theme_0 == l_DarkTheme_0 and "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" or "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png", 
                    Size = UDim2.new(1, 0, 1, 0)
                }), 
                Backdrop = v5.createElement("Frame", {
                    BackgroundTransparency = l_Theme_0 == l_DarkTheme_0 and 0.5 or 0.7, 
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0)
                })
            }), 
            CloseButton = v5.createElement(l_ImageSetButton_0, {
                Position = UDim2.new(0, 48 * v51:getScale(), 0, 48 * v51:getScale()), 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0, 36, 0, 36), 
                Image = v28, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 0.7, 
                BorderSizePixel = 0, 
                SelectionImageObject = v53(l_CursorKind_0.RoundedRect), 
                Visible = v51.props.showCloseButton, 
                [v5.Event.Activated] = l_props_2.onPageClose
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 16 * v51:getScale())
                })
            }), 
            MessageBannerAnimator = v5.createElement(v20, {
                shouldAnimate = l_props_2.shouldAnimate, 
                shouldShow = v51.state.showMessageBanner, 
                animateDown = true, 
                ZIndex = 10, 
                renderChildren = function()
                    return v5.createElement("Frame", {
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = if l_Theme_0 == l_DarkTheme_0 then Color3.fromRGB(17, 18, 20) else Color3.fromRGB(198, 203, 206), 
                        Position = UDim2.fromOffset(48 * v51:getScale(), 40 * v51:getScale()), 
                        Size = UDim2.new(1, -96 * v51:getScale(), 0, v60 * 2)
                    }, {
                        UICorner = v5.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 16 * v51:getScale())
                        }), 
                        Icon = v5.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Image = v26, 
                            ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                            ImageTransparency = 0, 
                            Position = UDim2.fromOffset(24 * v51:getScale(), v60), 
                            Size = UDim2.fromOffset(36 * v51:getScale(), 36 * v51:getScale())
                        }), 
                        AlertMessage = v5.createElement(l_FitTextLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Position = UDim2.fromOffset(80 * v51:getScale(), v60), 
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v52.SuccessfulMessage, 
                            Font = l_Font_0.Header1.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextSize = v60, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1
                        })
                    });
                end
            }), 
            RobuxBalanceFrame = v5.createElement(l_FitFrameHorizontal_0, {
                Position = UDim2.new(1, -96 * v51:getScale(), 0, 48 * v51:getScale()), 
                AnchorPoint = Vector2.new(1, 0), 
                height = UDim.new(0, v60), 
                contentPadding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                BackgroundTransparency = 1
            }, {
                Icon = v5.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(v60 + 15 * v51:getScale(), v60 + 15 * v51:getScale()), 
                    Image = v25, 
                    ImageTransparency = 0
                }), 
                BalanceText = v5.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 2, 
                    width = l_FitTextLabel_0.Width.FitToText, 
                    Text = not l_props_2.robuxBalance and "" or v19(l_LocalizationService_0.RobloxLocaleId, l_props_2.robuxBalance), 
                    Font = l_Font_0.Header1.Font, 
                    TextColor3 = if not l_props_2.showBackground then l_Theme_0.TextEmphasis.Color else Color3.new(255, 255, 255), 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextSize = v60, 
                    BackgroundTransparency = 1
                })
            }), 
            BannerFrame = v5.createElement("Frame", {
                Position = UDim2.new(0, 96 * v51:getScale(), 0, 146 * v51:getScale()), 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 36 * v51:getScale())
                }); 
                BannerTitle = v5.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0.Title.Font, 
                    Text = v52.BannerTitle, 
                    TextSize = 46 * v51:getScale(), 
                    TextColor3 = if not l_props_2.showBackground then l_Theme_0.TextEmphasis.Color else Color3.new(255, 255, 255)
                }), 
                BannerText = v5.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_0.Header1.Font, 
                    Text = v52.BannerText, 
                    TextSize = 38 * v51:getScale(), 
                    TextColor3 = if not l_props_2.showBackground then l_Theme_0.TextEmphasis.Color else Color3.new(255, 255, 255)
                })
            }), 
            RobuxPackageTilesFrame = v5.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, 310 * v51:getScale()), 
                Size = UDim2.new(1, 0, 0, 615 * v51:getScale()), 
                AutomaticSize = Enum.AutomaticSize.None, 
                CanvasSize = UDim2.new(0, 0, 0, 0), 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                ScrollingEnabled = v58, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                ScrollBarImageTransparency = 1, 
                ScrollBarThickness = 0, 
                Selectable = false, 
                BackgroundTransparency = 1, 
                [v5.Ref] = v51.scrollingFrameRef
            }, v61)
        });
    end);
end;
return v24;
