local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.Constant.IconSize;
local v11 = require(l_Parent_0.Components.Notification);
local v12 = require(l_Parent_0.Components.Favorites);
local v13 = require(l_Parent_0.UtilityFunctions);
local v14 = require(l_Parent_0.Colors);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v17 = require(l_Parent_0.getSelectionImageObjectRegular);
local v18 = require(l_Parent_0.Components.InspectAndBuyContext);
local v19 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v20 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v21 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedItemBugFixAndAlignment);
local v22 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v23 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v24 = l_Images_0["icons/status/premium"];
local v25 = v3.PureComponent:extend("DetailsText");
v25.init = function(v26)
    v26.name = "";
    v26.creator = "";
    v26.selectedImage = v17();
end;
v25.setText = function(v27)
    local v28 = v27.props.assetInfo or {};
    local v29 = v28.bundlesAssetIsIn and #v28.bundlesAssetIsIn == 1;
    if v22() then
        v29 = v28.parentBundleId ~= nil;
    end;
    local v30 = v29 and not v28.isForSale;
    if v23() then
        v30 = v29;
    end;
    local v31 = v27.props.bundleInfo or {};
    if not v30 then
        if v28 then
            v27.name = v28.name or "";
            v27.creator = v28.creatorName or "";
        end;
    else
        local v32 = v13.getBundleId(v28);
        if v31[v32] then
            v27.name = v31[v32].name or "";
            v27.creator = v31[v32].creatorName or "";
            return ;
        end;
    end;
end;
v25.render = function(v33)
    v33:setText();
    local l_view_0 = v33.props.view;
    local l_locale_0 = v33.props.locale;
    local l_showFavoritesCount_0 = v33.props.showFavoritesCount;
    local v37 = v33.props.assetInfo or {};
    local v38 = v37.bundlesAssetIsIn and #v37.bundlesAssetIsIn == 1;
    local v39 = v37.bundlesAssetIsIn and #v37.bundlesAssetIsIn > 1;
    if v22() then
        v38 = v37.parentBundleId ~= nil;
        v39 = v38 and #v33.props.assetBundles[v37.assetId] > 1;
    end;
    local v40 = v37.premiumPricing ~= nil;
    local v41 = v37.creatorHasVerifiedBadge or false;
    local v42 = not not v40 and l_IconSize_0.Regular + 5 or 0;
    local v43 = false;
    if v15.LayeredAssetTypes[v37.assetTypeId] ~= nil then
        v43 = v33.props.localPlayerModel and v33.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
    end;
    local v44 = v37.isLimited or v20() and v37.isLimitedUnique;
    if v21() then
        v44 = v13.isLimited1Point0(v37);
    end;
    local v45 = nil;
    if not v39 then
        if not v38 then
            if not v44 then
                if v43 then
                    v45 = v15.NotificationKeys.LayeredClothingOnR6Key;
                end;
            else
                v45 = v15.NotificationKeys.LimitedItemNoticeKey;
            end;
        else
            v45 = v15.NotificationKeys.SingleBundleNoticeKey;
        end;
    else
        v45 = v15.NotificationKeys.MultipleBundleNoticeKey;
    end;
    return v3.createElement(v18.Consumer, {
        render = function(v46)
            return v3.createElement("Frame", {
                Position = v46[l_view_0].DetailsFramePosition, 
                Size = UDim2.new(1, 0, 0, 131), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Notification = v45 and v3.createElement(v11, {
                    noticeKey = v45
                }), 
                AssetName = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1
                }, {
                    PremiumIcon = not not v40 and v3.createElement("ImageLabel", v5.Dictionary.join(v24, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                        ImageColor3 = Color3.new(1, 1, 1)
                    })) or nil, 
                    PlayerName = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, v42, 0, 0), 
                        Size = UDim2.new(1, v42, 0, 50), 
                        LayoutOrder = 1, 
                        Text = v33.name or "", 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextScaled = true, 
                        TextSize = 20, 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextColor3 = v14.White
                    }, {
                        UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32
                        })
                    })
                }) or v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1, 
                    Text = v33.name or "", 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextScaled = true, 
                    TextSize = 20, 
                    Font = l_AppFonts_0.default:getBold(), 
                    TextColor3 = v14.White
                }, {
                    UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 32
                    })
                }), 
                CreatorLabelContainer = if not v19 then v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 20)
                }, {
                    CreatorLabelWrapper = v3.createElement(v7.EmojiWrapper, {
                        emoji = not v41 and "" or v7.emoji.verified
                    }, {
                        CreatorLabel = v3.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Text = v16:FormatByKeyForLocale("InGame.InspectMenu.Label.By", l_locale_0, {
                                CREATOR = v33.creator
                            }), 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextScaled = false, 
                            TextSize = 12, 
                            TextColor3 = v14.White, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        })
                    })
                }) else nil, 
                FavoriteContainer = l_showFavoritesCount_0 and v3.createElement(v12)
            });
        end
    });
end;
return v4.connect(function(v47, _)
    return {
        view = v47.view, 
        locale = v47.locale, 
        assetInfo = v47.assets[v47.detailsInformation.assetId], 
        bundleInfo = v47.bundles, 
        assetBundles = if not v22() then nil else v47.assetBundles, 
        showFavoritesCount = not v47.isSubjectToChinaPolicies
    };
end)(v25);
