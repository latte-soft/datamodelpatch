local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v5 = require(l_CorePackages_0.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v8 = require(l_CorePackages_0.Promise);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v13 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItem);
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedImpressionsDetector);
local v16 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v17 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v18 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_useAnimateScrollViewToSelection_0 = require(l_CorePackages_0.Workspace.Packages.GameCollectionViews).useAnimateScrollViewToSelection;
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v23 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v24 = require(l_Modules_0.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent);
local v25 = require(l_Modules_0.LuaApp.Constants);
local v26 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local v27 = require(l_Modules_0.Personalization.Analytics.ScrollDetector);
local v28 = require(l_Modules_0.Personalization.Flags.GetFFlagOmniLoadMoreHeuristicMount);
local v29 = require(l_Modules_0.Personalization.Flags.GetFFlagUseUpsellCardOmniFeedItem);
local v30 = require(l_Modules_0.Personalization.Flags.FIntLuaJoinYourFriendsRefreshInterval);
local v31 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppFixFeedZIndex);
local v32 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppConsoleSupportRFY);
local v33 = game:DefineFastFlag("UseOmniFeedDividerOverrides", false);
local v34 = game:DefineFastInt("OmniFeedDividerHeightOverride", -1);
local v35 = game:DefineFastInt("OmniFeedDividerPaddingOverride", -1);
local v36 = game:DefineFastInt("LuaAppOmniFeedInitialNumRows", 6);
local v37 = game:DefineFastInt("LuaAppOmniFeedLoadlNumRows", 3);
local function _(v38)
    local v39 = v38.treatmentProps.topicLayoutData and v38.treatmentProps.topicLayoutData[v16.TopicLayoutDataKeys.ComponentType];
    local v40 = true;
    if v39 ~= v16.ComponentTypeDataKeys.GridTile then
        v40 = v39 == v16.ComponentTypeDataKeys.EventTile;
    end;
    return v40;
end;
local v42 = game:DefineFastString("LuaAppSortsWithDividers", "200000000, 200000001");
local v43 = game:DefineFastFlag("LuaAppUseSortsWithDividersFString2", false);
local v44 = {};
if v43 then
    for v45 in v42:gmatch("(%d+)") do
        v44[v45] = true;
    end;
end;
local v46 = game:DefineFastInt("LuaAppOmniFeedScrollAnimDurationMs", 400) / 1000;
local function v55(v47, v48, v49)
    local v50 = 0;
    local v51 = 0;
    for v52 = v48, #v47 do
        local v53 = v47[v52];
        local v54 = (not not v53 and v53.treatmentProps) and v53.treatmentProps.numberOfRows or 1;
        if v54 == -1 then
            v54 = 1;
        end;
        v51 = v51 + 1;
        v50 = v50 + v54;
        if not (v49 > v50) then
            break;
        end;
    end;
    return v51;
end;
return function(v56)
    local v57 = l_useStyle_0();
    local v59 = v18(function(v58)
        return v58.useGridPageLayout();
    end);
    local v61 = v18(function(v60)
        return v60.getMountAllOmniFeedItems();
    end);
    local v62 = nil;
    if v32 then
        v62 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
        v59 = v59 and not v62;
    end;
    local v63 = v3.useRef(l_Signal_0.new());
    local v64 = v3.useRef(l_Signal_0.new());
    local v65 = v3.useRef(0);
    local v66 = v3.useRef(false);
    local l_scrollingFrameRef_0 = v56.scrollingFrameRef;
    local v68 = nil;
    local v69 = nil;
    if v28() then
        local v70, v71 = v3.useState(function()
            if not v61 then
                if not v32 then
                    return 1;
                else
                    return (v55(v56.omniFeedItems, 1, v36));
                end;
            else
                return #v56.omniFeedItems;
            end;
        end);
        v68 = v70;
        v69 = v71;
    end;
    local l_pageContext_0 = v56.pageContext;
    local l_impressionsTag_0 = v56.impressionsTag;
    local l_omniFeedItems_0 = v56.omniFeedItems;
    local l_Theme_0 = v57.Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local l_Color_1 = l_Theme_0.BackgroundContrast.Color;
    local v79 = nil;
    v79 = not v59 and 0 or 4;
    local v80 = l_useDesignTokens_0();
    l_Color_0 = v80.LuaApps.App.Page.BackgroundColor;
    l_Transparency_0 = v80.LuaApps.App.Page.BackgroundTransparency;
    local v81 = v3.useMemo(function()
        return v80.LuaApps.HomeOmniFeed.getLayoutSpacing(v59);
    end, l_dependencyArray_0(v59, v80));
    local v82 = v56.topPadding or v81.topMargin;
    local v84 = l_useSelector_0(function(v83)
        return v83.Personalization.OmniItemsGlobalLayoutData;
    end);
    local l_v84_0 = v84;
    if l_v84_0 then
        l_v84_0 = true;
        if v84[v16.GlobalLayoutDataKeys.JYFRefresh] ~= "true" then
            l_v84_0 = v84[v16.GlobalLayoutDataKeys.JYFRefresh] == true;
        end;
    end;
    local v88 = v3.useCallback(function(v86)
        v65.current = tick();
        v64.current:fire();
        local _ = nil;
        return v56.refresh(if not v86 then v16.OmniRecommendationsRequestIntent.ManualRefresh else v16.OmniRecommendationsRequestIntent.FriendPresenceChange);
    end);
    local function _()
        v66.current = false;
        if l_scrollingFrameRef_0.current then
            local l_Y_0 = l_scrollingFrameRef_0.current.CanvasPosition.Y;
            local l_Height_0 = v25.JoinYourFriendsTile.Height;
            if l_Y_0 >= 0 and l_Y_0 <= l_Height_0 then
                v88(true);
            end;
        end;
    end;
    v3.useEffect(function()
        local v92 = nil;
        if l_v84_0 then
            v92 = v24.Event:Connect(function()
                if not v66.current then
                    local v93 = v30 - (tick() - v65.current);
                    if v93 < 0 then
                        v66.current = false;
                        if l_scrollingFrameRef_0.current then
                            local l_Y_1 = l_scrollingFrameRef_0.current.CanvasPosition.Y;
                            local l_Height_1 = v25.JoinYourFriendsTile.Height;
                            if l_Y_1 >= 0 and l_Y_1 <= l_Height_1 then
                                v88(true);
                                return ;
                            end;
                        end;
                    else
                        v66.current = true;
                        task.delay(v93, function()
                            v66.current = false;
                            if l_scrollingFrameRef_0.current then
                                local l_Y_2 = l_scrollingFrameRef_0.current.CanvasPosition.Y;
                                local l_Height_2 = v25.JoinYourFriendsTile.Height;
                                if l_Y_2 >= 0 and l_Y_2 <= l_Height_2 then
                                    v88(true);
                                end;
                            end;
                        end);
                    end;
                    return ;
                else
                    return ;
                end;
            end);
        end;
        return function()
            if v92 then
                v92:Disconnect();
                v92 = nil;
            end;
        end;
    end, {
        v56.refresh
    });
    local v99 = l_useSelector_0(function(v98)
        return v98.OmniRecommendations[l_pageContext_0];
    end);
    local v100 = not not v99 and v99.sorts or {};
    local v121 = v3.useMemo(function()
        local v101 = {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v82), 
                PaddingBottom = UDim.new(0, 80)
            }), 
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        local v102 = 1;
        local l_layoutPadding_0 = v81.layoutPadding;
        local v104 = v81.layoutPadding / 2;
        if v33 then
            if v35 >= 0 then
                l_layoutPadding_0 = v35;
            end;
            if v34 >= 0 then
                v104 = v34;
            end;
        end;
        for v105, v106 in ipairs(l_omniFeedItems_0) do
            if not v28() or v68 >= v105 then
                local v107 = v106.treatmentProps or {};
                local v108 = v26.getUniqueNameForAnalytics(v106);
                v107 = v5.Dictionary.join({
                    [v17.key] = v17.new(v105, v63.current, v64.current, l_pageContext_0)
                }, v107);
                local v109 = v105 > 1;
                local v110 = v109 and v106.treatmentType == v23.UpsellCard;
                local v111 = if not v106.itemId then nil else v106.itemId.sortIndex;
                local v112 = if not v111 then nil else v100[v111];
                if v112 and (not v112.topic or v112.topic == "") then
                    v109 = false;
                end;
                if v109 then
                    v101["feedPaddingTop_" .. tostring(v105)] = v2.createElement("Frame", {
                        Size = if not not v29() and v110 then UDim2.new(1, 0, 0, v80.Global.Space_150) else UDim2.new(1, 0, 0, l_layoutPadding_0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v102
                    });
                    v102 = v102 + 1;
                end;
                v101["feedItem_" .. tostring(v105)] = v3.createElement(v14, {
                    omniFeedItemType = v106.treatmentType, 
                    layoutOrder = v102, 
                    feedItemNameId = v108, 
                    itemProps = v107, 
                    itemIndex = v105, 
                    impressionsTag = l_impressionsTag_0, 
                    zIndex = if not not v28() and v31() then v68 - v105 else -1 * v105
                });
                v102 = v102 + 1;
                local v113 = v32 and v62;
                local v114 = nil;
                local v115 = false;
                if (not v113 and v105 > 1) and v105 < #l_omniFeedItems_0 then
                    local v116 = l_omniFeedItems_0[v105 - 1];
                    local v117 = l_omniFeedItems_0[v105];
                    local v118 = l_omniFeedItems_0[v105 + 1];
                    if not (not v43 or not (not (not v117.itemId or not v117.itemId.topicId) and v44[v117.itemId.topicId]) and ((not v118.itemId or not v118.itemId.topicId) or not v44[v118.itemId.topicId])) then
                        v115 = true;
                    end;
                    if not (not (v106.treatmentType == v23.HomeGameGrid) or v118.treatmentType == v23.HomeGameGrid) or (v106.treatmentType ~= v23.HomeGameGrid and v116.treatmentType == v23.HomeGameGrid) and v118.treatmentType == v23.HomeGameGrid then
                        v115 = true;
                    elseif l_isSubjectToDesktopPolicies_0() then
                        local v119 = false;
                        if v106.treatmentType == v23.Carousel then
                            v119 = false;
                            if v118.treatmentType == v23.HomeGameGrid then
                                local v120 = v106.treatmentProps.topicLayoutData and v106.treatmentProps.topicLayoutData[v16.TopicLayoutDataKeys.ComponentType];
                                v119 = true;
                                if v120 ~= v16.ComponentTypeDataKeys.GridTile then
                                    v119 = v120 == v16.ComponentTypeDataKeys.EventTile;
                                end;
                                if v119 then
                                    v120 = v118.treatmentProps.topicLayoutData and v118.treatmentProps.topicLayoutData[v16.TopicLayoutDataKeys.ComponentType];
                                    v119 = true;
                                    if v120 ~= v16.ComponentTypeDataKeys.GridTile then
                                        v119 = v120 == v16.ComponentTypeDataKeys.EventTile;
                                    end;
                                end;
                            end;
                        end;
                        v114 = v119;
                    end;
                end;
                if not (not v115 and not v114) then
                    v101["feedPaddingBottom_" .. tostring(v105)] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_layoutPadding_0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v102
                    });
                    v102 = v102 + 1;
                end;
                if v115 then
                    v101["feedDivider_" .. tostring(v105)] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v104), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_Color_1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v102
                    });
                    v102 = v102 + 1;
                end;
                if not (not (v28() and v105 == v68) or not v56.hasNextPage) then
                    v101["loadingBlank_" .. tostring(v105)] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 10), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v102
                    });
                    v102 = v102 + 1;
                end;
            else
                break;
            end;
        end;
        return v101;
    end, l_dependencyArray_0(l_omniFeedItems_0, v100, if not v28() then nil else v68));
    if v32 then
        l_useAnimateScrollViewToSelection_0(l_scrollingFrameRef_0, v46);
    end;
    local v122 = v3.useCallback(function()
        v63.current:fire();
    end);
    local v123 = nil;
    if v28() then
        v123 = function()
            if v68 < #l_omniFeedItems_0 then
                local _ = nil;
                v69(if not v61 then if v32 then v68 + v55(l_omniFeedItems_0, v68 + 1, v37) else v68 + 1 else #l_omniFeedItems_0);
                return true;
            else
                return false;
            end;
        end;
        v3.useEffect(function()
            v123();
        end, {
            l_omniFeedItems_0
        });
    end;
    return v2.createElement(v13, {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScrollBarThickness = v79, 
        onLoadMore = function()
            if not v28() or not v123() then
                local l_loadNext_0 = v56.loadNext;
                if not l_loadNext_0 then
                    return v8.resolve();
                else
                    return l_loadNext_0();
                end;
            else
                return v8.reject();
            end;
        end, 
        refresh = v88, 
        parentAppPage = l_pageContext_0, 
        onAbsoluteSizeChangedCallback = v56.onAbsoluteSizeChanged, 
        onCanvasSizeChangedCallback = v122, 
        onCanvasPositionChangedCallback = v122, 
        useAutomaticSizeContentFrame = true, 
        [v2.Ref] = l_scrollingFrameRef_0, 
        createEndOfScrollElement = v56.createEndOfScrollElement, 
        onScrollDirectionChanged = v56.onScrollDirectionChanged, 
        ScrollingEnabled = if not v32 then nil else not v62
    }, {
        OmniFeed = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v121), 
        OmniFeedImpressionsDetector = v3.createElement(v15, {
            onItemsUpdatedSignal = v63.current, 
            impressionsTag = l_impressionsTag_0, 
            omniFeedItems = l_omniFeedItems_0, 
            eventContext = v56.analyticsContext
        }), 
        ScrollDetector = if not v56.sendScrollEvent then nil else v3.createElement(v27, {
            scrollingFrameRef = l_scrollingFrameRef_0, 
            sendScrollEvent = v56.sendScrollEvent
        })
    });
end;
