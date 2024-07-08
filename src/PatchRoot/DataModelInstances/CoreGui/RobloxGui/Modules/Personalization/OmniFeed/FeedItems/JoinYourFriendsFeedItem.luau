local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.Generic.CarouselWidget);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(l_Modules_0.Personalization.OmniFeed.JoinYourFriendsTile);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local v10 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v12 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v13 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v17 = require(l_CorePackages_0.UIBlox);
local l_GridMetrics_0 = v17.App.Grid.GridMetrics;
local l_Images_0 = v17.App.ImageSet.Images;
local l_useStyle_0 = v17.Core.Style.useStyle;
local l_useResponsiveLayout_0 = v17.Core.Layout.Responsive.useResponsiveLayout;
local v22 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends);
local l_CarouselGenericSquareTile_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Components.CarouselGenericSquareTile;
local v24 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local v26 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsLogging);
local v27 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsDesktop);
local v28 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsAlwaysWithFindFriends);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v14.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v14.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local l_GAME_CAROUSEL_CHILD_PADDING_0 = v14.GAME_CAROUSEL_CHILD_PADDING;
local l_NarrowFooterHeight_0 = v14.GridTiles.NarrowFooterHeight;
local v33 = 0;
local v34 = 0;
local v35 = 0;
if not v27() then
    v33 = v14.JoinYourFriendsTile.Width;
    v34 = v14.JoinYourFriendsTile.Height;
    v35 = v33 * 0.0625;
end;
local function v47(v36, v37, v38, v39)
    if v26() then
        if not v36 or #v36 == 0 then
            return ;
        else
            local v40 = {};
            local v41 = {};
            local v42 = {};
            local v43 = {};
            for v44 = 1, #v36 do
                local v45 = v36[v44];
                local v46 = v38[v45];
                if v46 then
                    if v46.type == v6 then
                        table.insert(v40, v46.props.friendUserId);
                        table.insert(v41, v46.props.universeId);
                        table.insert(v42, v46.props.rootPlaceId);
                        table.insert(v43, v45);
                    else
                        table.insert(v41, "Other");
                        table.insert(v43, v45);
                    end;
                end;
            end;
            v37:sendEventDeferred(v39, v14.ImpressionsEvents.JoinYourFriends, {
                coplayIds = table.concat(v40, ","), 
                contentIds = table.concat(v41, ","), 
                rootPlaceIds = table.concat(v42, ","), 
                positions = table.concat(v43, ",")
            });
        end;
    end;
end;
local function _(v48, v49)
    if v26() then
        v49:sendEventDeferred(v48, "joinYourFriendProfileViewOpen", {
            friendId = "FIND_FRIENDS"
        });
    end;
end;
local function v56(v51, v52, v53, v54, v55)
    return v2.createElement(l_CarouselGenericSquareTile_0, {
        LayoutOrder = v51, 
        borderThickness = 1, 
        tileSize = v52.Y, 
        icon = l_Images_0["icons/graphic/findfriends_large"], 
        labelText = v53, 
        onActivated = v55, 
        impressionsTag = "JYF_TILE_IMPRESSION", 
        styleProps = {
            font = v54, 
            textXAlignment = Enum.TextXAlignment.Left, 
            containFooterInTileSize = true
        }
    });
end;
local function v70(v57, v58, v59)
    local v60 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = if not v27() then UDim.new(0, v35) else UDim.new(0, l_GAME_CAROUSEL_CHILD_PADDING_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v61 = 0;
    if not v28() then
        for v62 = 1, #v57 do
            local v63 = v57[v62];
            local v64 = "tile_" .. tostring(v62);
            for v65 = 1, #v63.coplayUsers do
                local v66 = v64 .. "_" .. tostring(v65);
                v61 = v61 + 1;
                v60[v66] = v2.createElement(v6, {
                    LayoutOrder = v61, 
                    size = if not v27() then nil else v58, 
                    friendUserId = tostring(v63.coplayUsers[v65].userId), 
                    thumbnailAssetId = tostring(v63.thumbnailAssetId), 
                    experienceName = v63.name, 
                    rootPlaceId = v63.rootPlaceId, 
                    universeId = v63.contentId, 
                    impressionsTag = "JYF_TILE_IMPRESSION"
                });
            end;
        end;
    else
        if v59 then
            v61 = v61 + 1;
            v60[v61] = v56(v61, v58, v59.tileText, v59.textFont, v59.onActivated);
        end;
        for v67 = 1, #v57 do
            local v68 = v57[v67];
            for v69 = 1, #v68.coplayUsers do
                v61 = v61 + 1;
                v60[v61] = v2.createElement(v6, {
                    LayoutOrder = v61, 
                    size = if not v27() then nil else v58, 
                    friendUserId = tostring(v68.coplayUsers[v69].userId), 
                    thumbnailAssetId = tostring(v68.thumbnailAssetId), 
                    experienceName = v68.name, 
                    rootPlaceId = v68.rootPlaceId, 
                    universeId = v68.contentId, 
                    impressionsTag = "JYF_TILE_IMPRESSION"
                });
            end;
        end;
    end;
    return {
        tiles = v60, 
        tileCount = v61
    };
end;
return function(v71)
    local v73 = l_useSelector_0(function(v72)
        return v72.FormFactor;
    end);
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    if v73 == l_FormFactor_0.COMPACT then
        if not v27() then
            v74 = l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0;
        else
            v75 = l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0;
            v76 = v14.JoinYourFriendsTile.NarrowColumnCount;
        end;
    elseif not v27() then
        v74 = l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    else
        local v77 = l_useResponsiveLayout_0("gutter", l_LayoutConfig_0.Kind.Experiences.GridTile) or 0;
        v75 = if v77 ~= 0 then v77 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
        v76 = v14.JoinYourFriendsTile.WideColumnCount;
    end;
    local v78 = v2.useRef(l_Signal_0.new());
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    if v26() then
        v79 = v8(v10);
        v80 = (v71[v12.key] or {}).appPage;
        v81 = v2.useCallback(function(_)
            v78.current:fire();
        end);
    end;
    local v83 = nil;
    if v28() then
        v83 = l_useRouteName_0();
    end;
    local v84 = nil;
    if v28() then
        v84 = l_useLocalization_0({
            carouselTitle = "Feature.Home.Heading.JoinYourFriends", 
            findFriendsTile = "Feature.Friends.Action.FindFriends"
        });
    end;
    local v86 = l_useSelector_0(function(v85)
        return v85.ScreenSize;
    end);
    local v87 = nil;
    if v27() then
        local l_itemWidth_0 = l_GridMetrics_0.getMetricsForFixedColumns(v86.X - 2 * v75, v75, v76).itemWidth;
        v87 = Vector2.new(l_itemWidth_0, l_itemWidth_0 / 1.7777777777777777 + l_NarrowFooterHeight_0);
    end;
    local l_topicId_0 = v71.topicId;
    local v91 = l_useSelector_0(function(v90)
        if not l_topicId_0 then
            return nil;
        else
            return not not v90.Personalization.TopicContents and v90.Personalization.TopicContents[l_topicId_0] or nil;
        end;
    end);
    local v92 = not not v91 and v91.entries or {};
    local v93 = nil;
    local _ = nil;
    local v95 = nil;
    if v28() then
        v93 = l_useStyle_0();
        v95 = v22({
            policyIsEnabled = v24(function(v96)
                return v96.getContactImporterEnabled();
            end)
        });
    end;
    local v97 = nil;
    if not ((not v28() or not v71.topicLayoutData) or not v71.topicLayoutData[v15.TopicLayoutDataKeys.JYFFindFriendsEnabled]) then
        v97 = {
            tileText = v84.findFriendsTile, 
            textFont = v93.Font.Header2, 
            onActivated = function()
                local l_v83_0 = v83;
                local l_v79_0 = v79;
                if v26() then
                    l_v79_0:sendEventDeferred(l_v83_0, "joinYourFriendProfileViewOpen", {
                        friendId = "FIND_FRIENDS"
                    });
                end;
                v95();
            end
        };
    end;
    local v100 = {};
    local v101 = 0;
    if v91 then
        local v102 = v70(v92, v87, v97);
        v100 = v102.tiles;
        v101 = v102.tileCount;
    end;
    local v103 = nil;
    v103 = if not v27() then if v28() then (v101 - 1) * (v35 + v33) + (v35 + v33 / 2) else v101 * (v35 + v33) else if v28() then (v101 - 1) * (l_GAME_CAROUSEL_CHILD_PADDING_0 + v87.X) + (l_GAME_CAROUSEL_CHILD_PADDING_0 + v87.X / 2) else v101 * (l_GAME_CAROUSEL_CHILD_PADDING_0 + v87.X);
    if v26() then
        v2.useEffect(function()
            v78.current:fire();
        end, {});
    end;
    if v101 > 0 then
        if not v28() then
            v84 = l_useLocalization_0({
                carouselTitle = "Feature.Home.Heading.JoinYourFriends"
            });
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = if not v27() then UDim.new(0, v74) else UDim.new(0, v75), 
                PaddingBottom = UDim.new(1, 0)
            }), 
            TileCarousel = v2.createElement(v3, {
                title = v84.carouselTitle, 
                index = 1, 
                itemWidth = if not v27() then v33 else v87.X, 
                canvasWidth = v103, 
                carouselHeight = if not v27() then v34 else v87.Y, 
                itemPadding = if not v27() then v35 else l_GAME_CAROUSEL_CHILD_PADDING_0, 
                items = v100, 
                itemCount = v101, 
                fetchingStatus = v13.Done, 
                showSeeAll = false, 
                onChangeCanvasPosition = not v26() and function()
                end or v81
            }), 
            JYFCarouselImpressionsDetector = if not v26() then nil else v2.createElement(l_ScreenSizeImpressionsDetector_0, {
                onRequestImpressionsSignal = v78.current, 
                onImpressionsDetected = function(v104)
                    v47(v104, v79, v100, v80);
                end, 
                impressionsTag = "JYF_TILE_IMPRESSION"
            })
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        });
    end;
end;
