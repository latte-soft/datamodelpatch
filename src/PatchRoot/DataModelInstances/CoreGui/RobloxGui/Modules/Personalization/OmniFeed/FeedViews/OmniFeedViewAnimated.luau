local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v7 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedItem);
local v8 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedImpressionsDetector);
local v9 = require(l_Modules_0.Personalization.Analytics.ScrollDetector);
local v10 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v12 = require(l_Modules_0.Personalization.OmniFeed.DataStore.FeedItemModel);
local l_AnimatedFlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).AnimatedFlatList;
local v14 = game:DefineFastFlag("OmniFeedViewAnimatedUseScrollEventThrottle", false);
return function(v15)
    local v16 = v3.useRef(l_Signal_0.new());
    local v17 = v3.useRef(l_Signal_0.new());
    local v18, v19 = v3.useState(1);
    local v21 = v3.useCallback(function(v20)
        v16.current:fire();
        v19(v20);
    end, {});
    local l_pageContext_0 = v15.pageContext;
    local l_impressionsTag_0 = v15.impressionsTag;
    local l_omniFeedItems_0 = v15.omniFeedItems;
    local v25 = l_useDesignTokens_0();
    local l_HomeOmniFeed_0 = v25.LuaApps.HomeOmniFeed;
    local v27 = v4.Dictionary.join(l_HomeOmniFeed_0, (l_HomeOmniFeed_0.getLayoutSpacing(true)));
    local v28 = v15.topPadding or v27.topMargin;
    local v29 = v27.bottomMargin + v27.trailingWhitespace;
    local _ = v27.layoutPadding;
    local l_scrollBarThickness_0 = v27.scrollBarThickness;
    local l_BackgroundColor_0 = v25.LuaApps.App.Page.BackgroundColor;
    local l_BackgroundTransparency_0 = v25.LuaApps.App.Page.BackgroundTransparency;
    local v34 = if not v15.header then v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v28), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        BorderSizePixel = 0
    }) else v15.header;
    local v35 = if not v15.header then v28 else v15.headerHeight;
    local v39 = v3.useCallback(function(v36)
        local l_item_0 = v36.item;
        local l_index_0 = v36.index;
        return v3.createElement(v7, {
            omniFeedItemType = l_item_0.treatmentType, 
            layoutOrder = l_index_0, 
            feedItemNameId = v12.getUniqueNameForAnalytics(l_item_0), 
            impressionsTag = l_impressionsTag_0, 
            itemProps = v4.Dictionary.join({
                [v10.key] = v10.new(v36.index, v16.current, v17.current, l_pageContext_0)
            }, l_item_0.treatmentProps or {}), 
            itemIndex = l_index_0
        });
    end, {
        l_impressionsTag_0, 
        l_pageContext_0
    });
    local v40 = v3.useCallback(function()
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v27.layoutPadding), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 10000000
        });
    end, {
        v27.layoutPadding
    });
    local v41 = v3.useRef(nil);
    local v42 = nil;
    if not (not v41 or not v41.current) then
        local v43 = v41.current:getNativeScrollRef();
        if v43 ~= nil then
            v42 = v43._nativeRef;
        end;
    end;
    return v3.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_BackgroundColor_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        Selectable = false, 
        SelectionGroup = true, 
        SelectionBehaviorUp = if v18 == 1 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop, 
        [v2.Change.AbsoluteSize] = v15.onAbsoluteSizeChanged, 
        [v2.Ref] = v15.scrollingFrameRef
    }, {
        OmniFeed = v3.createElement(l_AnimatedFlatList_0, {
            animated = true, 
            animationConfig = v27.animationConfig, 
            onSelectedIndexChanged = v21, 
            initialNumToRender = #l_omniFeedItems_0, 
            data = l_omniFeedItems_0, 
            contentContainerStyle = {
                BackgroundTransparency = l_BackgroundTransparency_0
            }, 
            style = {
                Selectable = false, 
                ClipsDescendants = false, 
                BackgroundTransparency = l_BackgroundTransparency_0, 
                ScrollBarThickness = l_scrollBarThickness_0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ScrollingEnabled = false
            }, 
            viewOffset = v35, 
            renderItem = v39, 
            ItemSeparatorComponent = v40, 
            ListHeaderComponent = v34, 
            ListFooterComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v29), 
                BackgroundTransparency = l_BackgroundTransparency_0, 
                BorderSizePixel = 0
            }), 
            scrollEventThrottle = if not v14 then nil else 83.33333333333333, 
            listRef = v41
        }), 
        OmniFeedImpressionsDetector = v3.createElement(v8, {
            onItemsUpdatedSignal = v16.current, 
            impressionsTag = l_impressionsTag_0, 
            omniFeedItems = l_omniFeedItems_0, 
            eventContext = v15.analyticsContext
        }), 
        ScrollDetector = if not v15.sendScrollEvent then nil else v3.createElement(v9, {
            scrollingFrameRef = v42, 
            sendScrollEvent = v15.sendScrollEvent
        })
    });
end;
