local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v10 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ShimmerPanel_0 = v10.App.Loading.ShimmerPanel;
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v16 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLook);
local v17 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v23 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v26 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v27 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v28 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSendCounter);
local v29 = require(l_Modules_0.AvatarExperience.Common.Hooks.useIsWithinViewContext);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v33 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.ItemCardFooter);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAdaptiveScrollingItemResetFix);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCounterLooksWidgetHome);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixLooksTileDetailButton);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixLooksWidgetBottomPadding);
local l_game_EngineFeature_0 = game:GetEngineFeature("BatchThumbnailSupportsVariousSizesLooks");
local v40 = game:DefineFastString("LooksWidgetThumbnailSize", "w=420&h=420");
local v41 = game:DefineFastFlag("FixLooksSecondaryLayerApdativeScrolling", false);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagSupportLooksTileFooter);
local v43 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXAvatarWidgetData);
local v44 = l_Images_0["icons/actions/selectOn"];
local v45 = v44.ImageRectSize / l_Images_0.ImagesResolutionScale;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local function v93(v47)
    local v48 = l_useDesignTokens_0();
    local v49 = if not v47.lookData then nil else v47.lookData;
    local v50 = if not v49 then nil else v49.id;
    local v51 = v4.useRef(nil);
    local v52 = nil;
    if v42() then
        v52 = v4.useRef(nil);
    end;
    local v53 = v26();
    local v54 = l_useDispatch_0();
    local v55 = v21(v22);
    local v56 = v21(v18);
    local v57 = l_useNavigation_0();
    local v58 = l_useStyle_0();
    local l_Theme_0 = v58.Theme;
    local l_Font_0 = v58.Font;
    local v61 = if not v36() then nil else v28();
    local v62 = if not not v49 and v49.assets then #v49.assets else 0;
    local v63 = if (not not v43() and v49) and v49.bundles then #v49.bundles else 0;
    local v64 = l_useLocalization_0({
        detailsText = {
            "Feature.Avatar.Label.Details"; 
            quantity = v62
        }
    });
    local l_Font_1 = v58.Font.SubHeader1.Font;
    local v66 = v58.Font.BaseSize * v58.Font.SubHeader1.RelativeSize;
    local v67 = v36() and v29(v31.CatalogSearch);
    local v68 = not l_game_EngineFeature_0 and "w=150&h=150" or v40;
    local v70 = if not not v49 and v49.assets then v3.List.map(v49.assets, function(v69)
        return v69.id;
    end) else nil;
    local v71 = if not not v70 and v47.widgetAnalyticsInfo then v3.Dictionary.join(v47.widgetAnalyticsInfo, {
        assetIds = v70
    }) else v47.widgetAnalyticsInfo;
    local v74 = l_useSelector_0(function(v72)
        local v73 = false;
        if v50 ~= nil then
            v73 = v72.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v50;
        end;
        return v73;
    end);
    local v77 = l_useSelector_0(function(v75)
        local l_opaque_0 = v75.AvatarExperience.AvatarScene.AvatarRoute.opaque;
        if not l_opaque_0 then
            return nil;
        else
            return l_opaque_0.name;
        end;
    end);
    local v78 = v4.useRef(true);
    v4.useEffect(function()
        if not v78.current then
            v56.widgetInteractionV2(v71, if not v74 then v23.ActionType.ITEM_DESELECTED else v23.ActionType.ITEM_CLICK);
            if not (not v61 or not v74) then
                if not v67 then
                    v61(v27.Counter.PopularLooksWidgetHomeTileClicked);
                else
                    v61(v27.Counter.PopularLooksWidgetSearchTileClicked);
                end;
            end;
        end;
        v78.current = false;
    end, {
        v74, 
        v67
    });
    local v81 = v4.useCallback(function(v79)
        if v50 then
            if v74 then
                if not (not v35() or not v53) then
                    v53.setSelectedItemInstance(nil);
                end;
                v54(v25(l_PeekViewState_0.Closed));
            else
                if v53 then
                    local v80 = if not v51 then nil else v51.current;
                    if v42() then
                        v80 = if not v79 then nil else v79.current;
                    end;
                    if v80 ~= nil then
                        v53.setSelectedItemInstance(v80);
                    end;
                end;
                if v77 ~= nil then
                    v54(v20(v56, v77, v19.None));
                end;
                if v43() and v47.tileContentType == v23.Types.SearchToAvatarLooksWidget then
                    v54(v17(v55, v57, v71, v50));
                    return ;
                else
                    v54(v16(v55, v57, v71, v50));
                    return ;
                end;
            end;
        end;
    end, {
        v55, 
        v57, 
        v71, 
        v50
    });
    local v82 = (v42() and v49) and (v49.curator or v49.totalPrice);
    local v83 = if not v38() then v48.Global.Space_300 else v48.Global.Space_0;
    if not (not v42() or not v82) then
        v83 = if not v47.isFocusedWidget then v48.Global.Space_0 else v48.Global.Space_175;
    end;
    local l_createElement_0 = v4.createElement;
    local v85 = "Frame";
    local v86 = {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    };
    local v87 = {
        UIListLayout = v42() and v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v48.Global.Size_50)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v83)
        })
    };
    local v88 = false;
    if v49 == nil then
        v88 = v4.createElement(l_ShimmerPanel_0, {
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.fromScale(1, 1), 
            Size = UDim2.fromScale(1, 1), 
            cornerRadius = UDim.new(0, 10)
        });
    end;
    v87.LoadingShimmer = v88;
    v87.Tile = v50 and v4.createElement("TextButton", {
        Size = UDim2.fromScale(1, 1), 
        AutoButtonColor = false, 
        BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
        BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
        ClipsDescendants = true, 
        Text = "", 
        ref = v51, 
        [v4.Event.Activated] = not not v42() and function()
            v81(v51);
        end or v81
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), 
        LookThumbnail = v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1.2, 1.2), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            BackgroundTransparency = 1, 
            Image = ("rbxthumb://type=Look&id=%*&%*"):format(v50, v68), 
            ZIndex = 2
        }, {
            AspectRatio = v4.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        SelectionOverlay = v74 and v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            SelectionImage = v4.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Image = v44, 
                Position = UDim2.new(1, -6, 0, 6), 
                Size = UDim2.fromOffset(v45.X, v45.Y)
            }), 
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            })
        }), 
        DetailsButton = if not v74 then nil else if v37() then v4.createElement(v30, {
            activateButton = function()
                if v41 then
                    v54(v20(v56, v77, v19.None));
                end;
                v54(v25(l_PeekViewState_0.Brief));
            end, 
            itemsCount = if not v43() then v62 else v62 + v63
        }) else v4.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.new(0, 0, 1, -28), 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            [v4.Event.Activated] = function()
                v54(v25(l_PeekViewState_0.Brief));
            end, 
            ZIndex = 10, 
            BackgroundTransparency = 1
        }, {
            BoundingFrame = v4.createElement("TextLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                Font = l_Font_0.CaptionHeader.Font, 
                TextSize = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, 
                Text = v64.detailsText, 
                TextColor3 = l_Theme_0.TextEmphasis.Color
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                })
            })
        })
    });
    v88 = v82;
    if v88 then
        v88 = v4.createElement;
        local v89 = "TextButton";
        local v90 = {
            LayoutOrder = 2, 
            Text = "", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            ref = v52, 
            [v4.Event.Activated] = function()
                v81(v52);
            end
        };
        local v91 = {
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v48.Global.Space_50)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v48.Global.Space_100)
            })
        };
        local l_v49_0 = v49;
        if l_v49_0 then
            l_v49_0 = v49.curator;
            if l_v49_0 then
                l_v49_0 = false;
                if v49.curator.hasVerifiedBadge == false then
                    l_v49_0 = v4.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        AnchorPoint = Vector2.new(1, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Font = l_Font_1, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextSize = v66, 
                        Text = v49.curator.name, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    });
                end;
            end;
        end;
        v91.UnverifiedCuratorName = l_v49_0;
        l_v49_0 = v49;
        if l_v49_0 then
            l_v49_0 = v49.curator;
            if l_v49_0 then
                l_v49_0 = false;
                if v49.curator.hasVerifiedBadge == true then
                    l_v49_0 = v4.createElement(v33.EmojiWrapper, {
                        layoutOrder = 1, 
                        emoji = v33.emoji.verified, 
                        font = l_Font_1, 
                        anchorPoint = Vector2.new(1, 0), 
                        position = UDim2.new(1, 0, 0, 0), 
                        size = UDim2.new(1, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        verticalAlignment = Enum.VerticalAlignment.Center
                    }, {
                        TextLabel = v4.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Font_1, 
                            Size = UDim2.new(0, 0, 1, 0), 
                            Text = v49.curator.name, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextSize = v66, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            AutomaticSize = Enum.AutomaticSize.X
                        })
                    });
                end;
            end;
        end;
        v91.VerifiedCreatorName = l_v49_0;
        v91.PriceFooterFrame = (v49 and v49.totalPrice) and v4.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, v48.Global.Size_250)
        }, {
            PriceFooter = v4.createElement(v34, {
                price = v49.totalPrice, 
                isPriceLoaded = true, 
                isSellableInShop = true, 
                fitContentHeight = true
            })
        });
        v88 = v88(v89, v90, v91);
    end;
    v87.Footer = v88;
    return l_createElement_0(v85, v86, v87);
end;
if v36() then
    v93 = v32((l_withNavigation_0(v93, nil)));
end;
return v93;
