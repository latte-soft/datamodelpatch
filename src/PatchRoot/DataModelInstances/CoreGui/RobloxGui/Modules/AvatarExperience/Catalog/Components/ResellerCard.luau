local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local v13 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactFitComponents_0 = v9.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v8.Core.ImageSet.ImageSetButton;
local v21 = require(l_Modules_0.LuaApp.AppPage);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v23 = require(l_Modules_0.LuaApp.Constants);
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v26 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v27 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v29 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v29.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v29.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_withStyle_0 = v8.Style.withStyle;
local l_AVATAR_PLACEHOLDER_IMAGE_0 = v23.AVATAR_PLACEHOLDER_IMAGE;
local v34 = l_Images_0["component_assets/circle_17"];
local v35 = nil;
local l_ImageRectSize_0 = v34.ImageRectSize;
local v37 = 8 * l_Images_0.ImagesResolutionScale;
local v38 = 8 * l_Images_0.ImagesResolutionScale;
v35 = Rect.new(v37, v38, l_ImageRectSize_0.x - v37, l_ImageRectSize_0.y - v38);
l_ImageRectSize_0 = l_Images_0["icons/status/item/limited"];
v37 = l_Images_0["icons/common/robux"];
v38 = l_Constants_0.RbxthumbTypes.AvatarHeadShot;
local v39 = v3.PureComponent:extend("ResellerCard");
v39.init = function(v40)
    v40.viewProfile = function()
        v40.props.navigateDown({
            name = v21.GenericWebPage, 
            detail = v27.user.profile({
                userId = v40.props.sellerId
            }), 
            extraProps = {
                titleKey = "CommonUI.Features.Label.Profile"
            }
        });
    end;
    v40.openPurchasePrompt = function()
        local l_userRobux_0 = v40.props.userRobux;
        local l_itemId_0 = v40.props.itemId;
        local l_itemType_0 = v40.props.itemType;
        local l_productId_0 = v40.props.productId;
        local l_itemPrice_0 = v40.props.itemPrice;
        local l_sellerId_0 = v40.props.sellerId;
        local l_sellerName_0 = v40.props.sellerName;
        local l_userAssetId_0 = v40.props.userAssetId;
        local l_collectibleInstanceId_0 = v40.props.collectibleInstanceId;
        local l_navigation_0 = v40.props.navigation;
        local v51 = v40.onOverlayClosed();
        local v52 = l_navigation_0.getParam("fromProfile");
        if not (not l_itemPrice_0 or not l_userRobux_0) and l_itemPrice_0 <= l_userRobux_0 then
            l_navigation_0.navigate(v22.PurchaseCatalogItem, {
                itemId = l_itemId_0, 
                itemType = l_itemType_0, 
                productId = l_productId_0, 
                priceInRobux = l_itemPrice_0, 
                sellerId = l_sellerId_0, 
                sellerName = l_sellerName_0, 
                userAssetId = l_userAssetId_0, 
                collectibleInstanceId = l_collectibleInstanceId_0, 
                onOverlayClosed = v51, 
                fromProfile = v52
            });
            return ;
        else
            l_navigation_0.navigate(v22.InsufficientRobuxPrompt, {
                onOverlayClosed = v51
            });
            return ;
        end;
    end;
    v40.onOverlayClosed = function()
        return function()
            v25("ResellerCard");
            v40.props.focusController.captureFocus();
        end;
    end;
end;
v39.render = function(v53)
    local l_serialNumber_0 = v53.props.serialNumber;
    local l_sellerId_1 = v53.props.sellerId;
    local l_sellerName_1 = v53.props.sellerName;
    local l_itemPrice_1 = v53.props.itemPrice;
    local l_LayoutOrder_0 = v53.props.LayoutOrder;
    local l_localization_0 = v53.props.localization;
    local v60 = l_getRbxthumbWithTypeSizeAndOptions_0(l_sellerId_1, v38, 48);
    return l_withStyle_0(function(v61)
        local l_Theme_0 = v61.Theme;
        local l_Font_0 = v61.Font;
        local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
        local l_Footer_0 = l_Font_0.Footer;
        local v66 = l_Footer_0.RelativeSize * l_Font_0.BaseSize;
        local v67 = l_NumberLocalization_0.localize(string.format("%.0f", l_itemPrice_1), l_localization_0:GetLocale());
        return l_withSelectionCursorProvider_0(function(v68)
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                margin = l_RoactFitComponents_0.Rect.rectangle(24, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = l_LayoutOrder_0, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
            }, {
                ProfileButton = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    onActivated = v53.viewProfile, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UserAndStatsFrame = v3.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        contentPadding = UDim.new(0, 12), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = not not l_serialNumber_0 and Enum.VerticalAlignment.Bottom or Enum.VerticalAlignment.Center, 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        BackgroundTransparency = 1
                    }, {
                        UserThumbnail = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 48, 0, 48), 
                            BackgroundTransparency = 1, 
                            Image = v60 or l_AVATAR_PLACEHOLDER_IMAGE_0, 
                            LayoutOrder = 1
                        }, {
                            MaskFrame = v3.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundTransparency = 1, 
                                Image = "rbxasset://textures/ui/LuaApp/graphic/profilemask.png", 
                                ImageColor3 = l_Color_0
                            })
                        }), 
                        SerialAndUsernameFrame = v3.createElement(l_FitFrameOnAxis_0, {
                            axis = l_FitFrameOnAxis_0.Axis.Both, 
                            contentPadding = UDim.new(0, 3), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        }, {
                            Username = v3.createElement(v13.EmojiWrapper, {
                                emoji = not v53.props.sellerHasVerifiedBadge and "" or v13.emoji.verified
                            }, {
                                UsernameLabel = v3.createElement("TextLabel", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    BackgroundTransparency = 1, 
                                    Font = l_Font_0.Header2.Font, 
                                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                                    Text = l_sellerName_1, 
                                    LayoutOrder = 1
                                })
                            }), 
                            SerialNumberLabel = l_serialNumber_0 and v3.createElement(l_FitFrameOnAxis_0, {
                                axis = l_FitFrameOnAxis_0.Axis.Both, 
                                contentPadding = UDim.new(0, 1), 
                                margin = l_RoactFitComponents_0.Rect.square(4), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                ImageSet = v34, 
                                BackgroundTransparency = 1, 
                                ImageColor3 = l_Theme_0.UIDefault.Color, 
                                ImageTransparency = l_Theme_0.UIDefault.Transparency, 
                                ScaleType = Enum.ScaleType.Slice, 
                                SliceCenter = v35, 
                                LayoutOrder = 2
                            }, {
                                LimitedIcon = v3.createElement(l_ImageSetLabel_0, {
                                    Size = UDim2.new(0, v66, 0, v66), 
                                    BackgroundTransparency = 1, 
                                    Image = l_ImageRectSize_0, 
                                    ImageColor3 = l_Theme_0.TextEmphasis.Color, 
                                    LayoutOrder = 1
                                }), 
                                SerialNumberText = v3.createElement(l_FitTextLabel_0, {
                                    width = l_FitTextLabel_0.Width.FitToText, 
                                    Size = UDim2.new(0, 0, 0, v66), 
                                    BackgroundTransparency = 1, 
                                    Font = l_Footer_0.Font, 
                                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                    TextSize = v66, 
                                    Text = "#" .. l_serialNumber_0, 
                                    LayoutOrder = 2
                                })
                            })
                        })
                    })
                }), 
                BuyButton = v3.createElement(l_Focusable_0[l_ImageSetButton_0], {
                    Size = UDim2.new(1, 0, 0, 44), 
                    BackgroundTransparency = 1, 
                    Image = v34, 
                    ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    LayoutOrder = 2, 
                    SelectionImageObject = v68(l_CursorKind_0.RoundedRectNoInset), 
                    [v3.Event.Activated] = v53.openPurchasePrompt
                }, {
                    PriceFrame = v3.createElement(l_FitFrameOnAxis_0, {
                        axis = l_FitFrameOnAxis_0.Axis.Both, 
                        contentPadding = UDim.new(0, 4), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        BackgroundTransparency = 1
                    }, {
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 25, 0, 25), 
                            BackgroundTransparency = 1, 
                            Image = v37, 
                            ImageColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                            ImageTransparency = l_Theme_0.ContextualPrimaryContent.Transparency, 
                            LayoutOrder = 1
                        }), 
                        Price = v3.createElement(l_FitTextLabel_0, {
                            width = l_FitTextLabel_0.Width.FitToText, 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0.Header2.Font, 
                            TextColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                            TextTransparency = l_Theme_0.ContextualPrimaryContent.Transparency, 
                            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                            Text = v67, 
                            LayoutOrder = 2
                        })
                    })
                })
            });
        end);
    end);
end;
return (l_withNavigation_0((l_RoactServices_0.connect({
    localization = v6
})((v4.connect(function(v69, v70)
    local v71 = v69.Users[v70.sellerId];
    return {
        userRobux = v69.UserRobux[v69.LocalUserId], 
        userName = v71 and v71.name
    };
end, function(v72)
    return {
        navigateDown = function(v73)
            v72(v26(v73));
        end
    };
end or nil)(v39))))));
