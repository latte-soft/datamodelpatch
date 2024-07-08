local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v9 = require(l_CorePackages_0.Cryo);
local v10 = require(l_CorePackages_0.Packages.tutils);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.UIBlox);
local l_TextService_0 = game:GetService("TextService");
local l_ItemTileEnums_0 = v12.Tile.ItemTileEnums;
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v20 = require(l_Modules_0.LuaApp.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v26 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v27 = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local v28 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v29 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v32 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v33 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v34 = require(l_Modules_0.AvatarExperience.Flags.UniversalAppCameraIXPTest);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.CategoryTypes);
local v38 = require(l_Modules_0.LuaApp.mutedError);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v40 = l_GuiService_0:IsTenFootInterface();
local v41 = game:DefineFastFlag("AXAllowU13UsageOfCameraButton", false);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v43 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardTallEnabled);
local v44 = game:DefineFastFlag("AXEnableRecommendationsInSalesTypeFilters", false);
local v45 = require(l_Modules_0.AvatarExperience.Flags.GetAXDisableBundleIcon);
local v46 = {
    PageType = v16.PageType.Other, 
    RecommendationsType = v17.RecommendationsType.None, 
    Name = "OtherPage", 
    Title = "Feature.Catalog.LabelShirts", 
    IconOn = "icons/menu/clothing/hair_on", 
    IconOff = "icons/menu/clothing/hair_off"
};
local v47 = {
    PageType = v16.PageType.Other, 
    RecommendationsType = v17.RecommendationsType.None, 
    CanAnimateCameraBasedMood = true, 
    Name = "OtherPage", 
    Title = "Feature.Catalog.LabelShirts", 
    IconOn = "icons/menu/clothing/hair_on", 
    IconOff = "icons/menu/clothing/hair_off"
};
local v48 = {};
local v49 = {};
local v56 = l_memoize_0(function(v50, v51, v52)
    local v53 = v50[v51];
    if not (not v53.Subcategories or not v52) then
        local v54 = v53.Subcategories[v52];
        if v54 then
            local v55 = v9.Dictionary.join(v53, v54);
            v55.AssetTypeIdStrings = v54.AssetTypeIdStrings;
            v55.BundleTypes = v54.BundleTypes;
            v55.CategoryFilter = v54.CategoryFilter;
            v55.Subcategories = v54.Subcategories;
            return v55;
        end;
    end;
    if v53.PageType == v16.PageType.Emotes then
        return v9.Dictionary.join(v53, {
            EmoteSlot = v52
        });
    else
        return v53;
    end;
end);
local function _(v57, v58, v59)
    return string.format("%s.%s.%s", tostring(v57), tostring(v58), (tostring(v59)));
end;
v48.getCategoryInfo = l_memoize_0(function(v61, v62, v63)
    local v64 = string.format("%s.%s.%s", tostring(v61), tostring(v62), (tostring(v63)));
    local v65 = v49[v64];
    if v65 == nil then
        v65 = v56(v61, v62, v63);
        v49[v64] = v65;
    end;
    return v65;
end);
v48.getCatalogCategoryInfo = l_memoize_0(function(v66, v67)
    return v48.getCategoryInfo(v18(), v66, v67);
end);
v48.getAvatarEditorCategoryInfo = l_memoize_0(function(v68, v69)
    return v48.getCategoryInfo(v15(), v68, v69);
end);
local function _(v70)
    if v70 < 100 then
        return 30;
    elseif v70 < 148 then
        return 36;
    else
        return 42;
    end;
end;
local v74 = l_memoize_0(function(v72)
    return function(v73)
        return ((v73 + v16.ItemTileTitleMaxLines * v72) + v16.ItemTilePadding * 2) + (v73 < 100 and 30 or (v73 < 148 and 36 or 42));
    end;
end);
local v77 = l_memoize_0(function(v75)
    return function(v76)
        return ((v76 / v16.ItemTileTallAspectRatio + v16.ItemTileTitleMaxLines * v75) + v16.ItemTilePadding * 2) + (v76 < 100 and 30 or (v76 < 148 and 36 or 42));
    end;
end);
local v82 = l_memoize_0(function(v78, _, v80)
    return function(v81)
        return ((v81 / v16.ItemTileTallAspectRatio + if v80 == v33.Types.SearchToAvatarLooksWidget then v78 else 0) + v16.ItemTilePadding * 2) + (v81 < 100 and 30 or (v81 < 148 and 36 or 42));
    end;
end);
local v89 = l_memoize_0(function(v83, v84)
    return function(v85)
        local v86 = v16.ItemTileTitleMaxLines * v83;
        local v87 = v85 < 100 and 30 or (v85 < 148 and 36 or 42);
        local _ = nil;
        if not v84 then
            return ((v85 + v86) + v16.ItemTilePadding * 2) + v87;
        else
            return (v85 + v16.ItemTilePaddingExtraSmall * 2) + v87;
        end;
    end;
end);
local v92 = l_memoize_0(function(v90)
    return function(v91)
        return (v91 + v16.ItemTileTitleMaxLines * v90) + v16.ItemTilePadding;
    end;
end);
local function v94(v93)
    return v93;
end;
local v97 = l_memoize_0(function(v95)
    if v95 == nil then
        return v94;
    else
        return function(v96)
            return (v96 + v16.ItemTileTitleMaxLines * v95) + v16.ItemTilePadding * 2;
        end;
    end;
end);
local function _(v98)
    if not v98 then
        return {};
    else
        return string.split(v98, " ");
    end;
end;
v48.mergeKeywordsAndTopics = function(v100, v101)
    local v102 = if not v100 then {} else string.split(v100, " ");
    local v103 = if not v101 then {} else string.split(v101, " ");
    for _, v105 in v103, nil, nil do
        if not (not (#v105 > 0) or table.find(v102, v105)) then
            table.insert(v102, v105);
        end;
    end;
    return table.concat(v102, " ");
end;
v48.GetCategoryIndexes = l_memoize_0(function(v106, v107)
    for v108, v109 in (v18()), nil, nil do
        if v109.NavigationKey and v109.NavigationKey == v106 then
            if not (not v109.Subcategories or not v107) then
                for v110, v111 in v109.Subcategories, nil, nil do
                    if v111.NavigationKey == v107 then
                        return v108, v110;
                    end;
                end;
            end;
            return v108, nil;
        end;
    end;
    return nil, nil;
end);
v48.GridItemHeightGetter = function(v112, ...)
    if v112 == v16.ItemTileType.AvatarEditorTile then
        return v97(...);
    elseif v112 == v16.ItemTileType.BodyColorButton then
        return v94;
    elseif v112 == v16.ItemTileType.BundleItemTile then
        return v92(...);
    elseif v112 == v16.ItemTileType.BundleItemTileNoText then
        return v94;
    elseif v112 == v16.ItemTileType.LookItemTile then
        return v82(...);
    elseif v112 == v16.ItemTileType.CatalogItemTile then
        if not v42() then
            return (v74(...));
        else
            return (v89(...));
        end;
    elseif v43() and v112 == v16.ItemTileType.TallCatalogItemTile then
        return v77(...);
    elseif v42() and v112 == v16.ItemTileType.RecommendedCatalogItemTile then
        return v74(...);
    else
        warn("Unknown itemType " .. tostring(v112) .. " in AvatarExperienceUtils.GridItemHeightGetter");
        return v94;
    end;
end;
v48.isAvatarBackground = function(v113)
    return v113 == v22.AvatarBackground;
end;
v48.isAvatarExperienceRoute = function(v114)
    local l_history_0 = v114.Navigation.history;
    for _, v117 in l_history_0[#l_history_0], nil, nil do
        if not (v117.name ~= v22.AvatarExperienceRoot) or v117.name == l_SwitchTab_0.AvatarExperienceTab then
            return true;
        end;
    end;
    return false;
end;
v48.isRouteInAvatarEditor = function(v118)
    return v118.opaque.name == v22.AvatarEditor;
end;
v48.didLeaveAvatarEditor = function(v119, v120)
    if not v48.isRouteInAvatarEditor(v120) or v48.isRouteInAvatarEditor(v119) then
        return false;
    else
        return true;
    end;
end;
v48.getIsSceneFullViewFromState = function(v121, v122)
    return v121.AvatarExperience.Common.FullView[v122.opaque.name] == v26.SceneFullView;
end;
v48.getCatalogCategoryInfoFromState = function(v123)
    return v48.getCatalogCategoryInfo(v123.AvatarExperience.Catalog.Categories.category, v123.AvatarExperience.Catalog.Categories.subcategory);
end;
v48.getAvatarEditorCategoryInfoFromState = function(v124)
    return v48.getAvatarEditorCategoryInfo(v124.AvatarExperience.AvatarEditor.Categories.category, v124.AvatarExperience.AvatarEditor.Categories.subcategory);
end;
v48.getCategoryInfoFromState = function(v125, v126)
    local l_name_0 = v126.opaque.name;
    if l_name_0 == v22.AvatarEditor then
        return v48.getAvatarEditorCategoryInfoFromState(v125);
    elseif l_name_0 == v22.Catalog then
        return v48.getCatalogCategoryInfoFromState(v125);
    elseif l_name_0 == v22.ProfilePictureEditorEmotes then
        local v128 = v25().AssetTypeToCategorySubcategory[v16.AssetTypeIdStrings.EmoteAnimation];
        return v48.getAvatarEditorCategoryInfo(v128.category, v128.subcategory);
    elseif v32.readTestVariable(v34.EnabledForUser) and l_name_0 == v22.CatalogSearch then
        return v47;
    else
        return v46;
    end;
end;
local v129 = {
    "Torso", 
    "RightArm", 
    "LeftArm", 
    "LeftLeg", 
    "RightLeg"
};
v48.routeIsProfilePictureEditor = function(v130)
    local v131 = true;
    if v130.opaque.name ~= v22.ProfilePictureEditorEmotes then
        v131 = true;
        if v130.opaque.name ~= v22.ProfilePictureEditorCamera then
            v131 = v130.opaque.name == v22.ProfilePictureEditorFinal;
        end;
    end;
    return v131;
end;
v48.routeIsPPEStaticImagePage = function(v132)
    local v133 = true;
    if v132.opaque.name ~= v22.ProfilePictureEditorCamera then
        v133 = v132.opaque.name == v22.ProfilePictureEditorFinal;
    end;
    return v133;
end;
v48.isFullyQualifiedCostume = function(v134)
    for _, v136 in v129, nil, nil do
        if not (v134[v136] ~= "") or v134[v136] == 0 then
            return false;
        end;
    end;
    return true;
end;
v48.shouldShowGradientForScrollingFrame = function(v137)
    local l_AbsoluteSize_0 = v137.AbsoluteSize;
    local l_CanvasSize_0 = v137.CanvasSize;
    local l_CanvasPosition_0 = v137.CanvasPosition;
    return l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset, l_CanvasPosition_0.X > 20, l_CanvasPosition_0.X + l_AbsoluteSize_0.X < l_CanvasSize_0.X.Offset - 20;
end;
v48.Round = function(v141, v142)
    local v143 = v142 or 1;
    return math.floor((v141 + v143 / 2) / v143) * v143;
end;
v48.isFetchingDoneOrFailed = function(v144, v145)
    local v146 = true;
    if v144 ~= l_RetrievalStatus_0.Done then
        v146 = v144 == l_RetrievalStatus_0.Failed;
    end;
    local v147 = true;
    if v145 ~= l_RetrievalStatus_0.Done then
        v147 = v145 == l_RetrievalStatus_0.Failed;
    end;
    return not v146 and v147;
end;
v48.getDeviceType = function()
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return v16.DeviceType.Android;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return v16.DeviceType.IOS;
    else
        return v16.DeviceType.Other;
    end;
end;
v48.getUserOutfitIdFromBundle = function(v149)
    for _, v151 in v149.items, nil, nil do
        if v151.type == v16.ItemType.Outfit then
            return v151.id;
        end;
    end;
    return nil;
end;
v48.getUserOutfitIdsFromBundle = function(v152)
    local v153 = {};
    if v152.items then
        for _, v155 in v152.items, nil, nil do
            if v155.type == v16.ItemType.Outfit then
                table.insert(v153, v155.id);
            end;
        end;
    end;
    return v153;
end;
v48.getBundleInfo = l_memoize_0(function(v156, v157)
    if v157 == nil then
        return nil;
    else
        local v158 = v156[v157];
        if v158 then
            if not v158.receivedCatalogData then
                return nil;
            else
                return v158;
            end;
        else
            return nil;
        end;
    end;
end);
v48.getBundleInfoFromState = function(v159, v160)
    return v48.getBundleInfo(v159.AvatarExperience.Common.BundleInfos, v160);
end;
v48.getOutfitInfoFromBundleIdNoState = function(v161, v162)
    if v161 then
        assert(v161, "contentId is not nil: silences type checker");
        local v163 = v48.getUserOutfitIdsFromBundle(v161);
        if #v163 < 1 then
            return nil;
        else
            local v164 = nil;
            for _, v166 in v163, nil, nil do
                local v167 = v162[v166];
                if v167 then
                    if v164 then
                        v164.assets = v9.Dictionary.join(v164.assets, v167.assets);
                    else
                        v164 = v10.deepCopy(v167);
                    end;
                else
                    return nil;
                end;
            end;
            return v164;
        end;
    else
        return nil;
    end;
end;
v48.getOutfitInfoFromBundleId = function(v168, v169)
    return v48.getOutfitInfoFromBundleIdNoState(v48.getBundleInfoFromState(v168, v169), v168.AvatarExperience.AvatarEditor.OutfitInfos);
end;
v48.getAllCategoriesStr = function(v170)
    local v171 = "";
    local v172 = 1;
    while true do
        local v173 = "level" .. v172;
        if v170[v173] then
            if v172 ~= 1 then
                v171 = v171 .. "|";
            end;
            v171 = v171 .. v170[v173];
            v172 = v172 + 1;
        else
            break;
        end;
    end;
    return v171;
end;
v48.isAnimationAssetType = function(v174)
    local v175 = true;
    if v174 ~= v16.AssetTypeIdStrings.ClimbAnimation then
        v175 = true;
        if v174 ~= v16.AssetTypeIdStrings.FallAnimation then
            v175 = true;
            if v174 ~= v16.AssetTypeIdStrings.IdleAnimation then
                v175 = true;
                if v174 ~= v16.AssetTypeIdStrings.JumpAnimation then
                    v175 = true;
                    if v174 ~= v16.AssetTypeIdStrings.RunAnimation then
                        v175 = true;
                        if v174 ~= v16.AssetTypeIdStrings.SwimAnimation then
                            v175 = v174 == v16.AssetTypeIdStrings.WalkAnimation;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v175;
end;
v48.getNumElementsWithKeyField = function(v176)
    local v177 = 0;
    if v176 then
        for _, v179 in v176, nil, nil do
            if not (not (typeof(v179) == "table") or not v179.key) then
                v177 = v177 + 1;
            end;
        end;
    end;
    return v177;
end;
local _ = function(v180, v181)
    for _, v183 in v181, nil, nil do
        if v180.CategoryFilter == v183 then
            return true;
        end;
    end;
    return false;
end;
local function v185(v186, v187)
    local v188 = {};
    for v189, v190 in v186, nil, nil do
        local v191;
        for _, v193 in v187, nil, nil do
            if v190.CategoryFilter == v193 then
                v191 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v191 = false;
        ::label0::;
        if not v191 then
            if v190.Subcategories then
                v191 = v185(v190.Subcategories, v187);
                if v191 ~= v190.Subcategories then
                    v188[v189] = v9.Dictionary.join(v190, {
                        Subcategories = v191
                    });
                end;
            end;
        else
            v188[v189] = v9.None;
        end;
    end;
    if v9.isEmpty(v188) then
        return v186;
    else
        local v194 = {};
        for v195, v196 in v186, nil, nil do
            if v188[v195] ~= nil then
                if v188[v195] ~= v9.None then
                    table.insert(v194, v188[v195]);
                end;
            else
                table.insert(v194, v196);
            end;
        end;
        return v194;
    end;
end;
v48.filterCategories = l_memoize_0(function(v197, v198, v199)
    local v200 = {};
    if v198 then
        table.insert(v200, v16.CommunityCreationsCategoryFilter);
    end;
    if v199 then
        table.insert(v200, v16.PremiumCategoryFilter);
    end;
    if #v200 == 0 then
        return v197;
    else
        return (v185(v197, v200));
    end;
end);
v48.lerp = function(v201, v202, v203)
    return (v202 - v201) * v203 + v201;
end;
v48.getTopBarHeightAvatarScene = function(v204)
    if v204.TopBar then
        if v204.DeviceOrientation == l_DeviceOrientationMode_0.Landscape then
            return v204.TopBar.statusBarHeight + v20.NAV_BAR_SIZE;
        else
            return v204.TopBar.topBarHeight;
        end;
    else
        return 0;
    end;
end;
v48.tableToCamelCaseKeys = function(v205)
    local v206 = {};
    for v207, v208 in v205, nil, nil do
        local l_v207_0 = v207;
        if typeof(v207) == "string" then
            l_v207_0 = string.lower((string.sub(v207, 1, 1))) .. string.sub(v207, 2);
        end;
        local l_v208_0 = v208;
        if typeof(v208) == "table" then
            l_v208_0 = v48.tableToCamelCaseKeys(v208);
        end;
        v206[l_v207_0] = l_v208_0;
    end;
    return v206;
end;
v48.AssetTypeIdStringToEnumValue = function(v211)
    return Enum.AvatarAssetType[v16.AssetTypeIdStringToName[v211]];
end;
v48.bundleIdToEnum = function(v212)
    return Enum.BundleType[v16.BundleTypeIdStringToName[v212]];
end;
v48.getSearchKey = function(v213, v214)
    return v16.SearchCatalogKey .. v214 .. "." .. v35.selectSortAndFiltersKey(v213);
end;
local function v216(v215)
    assert(v11.strictInterface({
        searchUuid = v11.union(v11.number, v11.string), 
        searchKeyword = v11.optional(v11.string), 
        recordSearchTime = v11.optional(v11.boolean), 
        categoryInfo = v11.optional(v11.table), 
        minPrice = v11.optional(v11.number), 
        maxPrice = v11.optional(v11.number), 
        catalogSort = v11.optional(v11.string), 
        categoryFilter = v11.optional(v11.enum(Enum.CatalogCategoryFilter))
    })(v215));
end;
local function v218(v217)
    assert(v11.strictInterface({
        CatalogSort = v11.optional(v11.string), 
        CatalogSortAggregation = v11.optional(v11.string), 
        PriceRange = v11.strictInterface({
            maxPrice = v11.number, 
            minPrice = v11.number
        }), 
        SelectedTopics = v11.optional(v11.array(v11.string)), 
        SalesTypeFilter = v11.optional(v11.string), 
        CreatorFilter = v11.optional(v11.string), 
        UnavailableItemFilter = v11.optional(v11.string)
    })(v217));
end;
local function v224(v219, v220, v221)
    if v220 ~= nil and #v220 > 0 then
        v219.AssetTypes = v9.List.map(v220, function(v222)
            return v48.AssetTypeIdStringToEnumValue(v222);
        end);
    end;
    if v221 ~= nil and #v221 > 0 then
        v219.BundleTypes = v9.List.map(v221, function(v223)
            return v48.bundleIdToEnum(v223);
        end);
    end;
end;
local function v227(v225)
    local v226 = true;
    if v225.SortType == Enum.CatalogSortType.Relevance then
        v226 = true;
        if v225.CreatorName == "" then
            if v225.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
                v226 = not v44;
                if v226 then
                    goto label1;
                end;
            end;
            v226 = true;
            if v225.SearchKeyword == "" then
                v226 = true;
                if v19.MinPriceFilter >= v225.MinPrice then
                    v226 = true;
                    if v225.MaxPrice >= v19.MaxPriceFilter then
                        v226 = v225.IncludeOffSale;
                    end;
                end;
            end;
        end;
    end;
    ::label1::;
    return v226;
end;
v48.getSearchParams = function(v228, v229)
    v216(v228);
    v218(v229);
    local v230 = CatalogSearchParams.new();
    local v231 = nil;
    if v228.searchKeyword then
        v231 = v228.searchKeyword;
    end;
    v230.AssetTypes = {};
    v230.BundleTypes = {};
    v230.IncludeOffSale = false;
    local v232 = false;
    local l_SelectedTopics_0 = v229.SelectedTopics;
    if l_SelectedTopics_0 and #l_SelectedTopics_0 > 0 then
        v232 = true;
        local v234 = table.concat(l_SelectedTopics_0, " ");
        if v231 == nil then
            v231 = v234;
        else
            if #v231 > 0 then
                v231 = v231 .. " ";
            end;
            v231 = v231 .. v234;
        end;
    end;
    if v231 then
        v230.SearchKeyword = v231;
    end;
    v230.Limit = 120;
    if v228.categoryInfo == nil then
        local v235 = {};
        local v236 = {};
        v230.CategoryFilter = v228.categoryFilter or Enum.CatalogCategoryFilter.None;
        v224(v230, v235, v236);
    else
        local v237 = v19.CategoryFilters[v228.categoryInfo.CategoryFilter];
        if v237 ~= nil and not v232 then
            v230.CategoryFilter = v237;
        else
            v230.CategoryFilter = Enum.CatalogCategoryFilter.None;
        end;
        v224(v230, v228.categoryInfo.AssetTypeIdStrings, v228.categoryInfo.BundleTypes);
    end;
    local v238 = v228.minPrice or v229.PriceRange.minPrice;
    local v239 = v228.maxPrice or v229.PriceRange.maxPrice;
    if v19.MinPriceFilter < v238 then
        v230.MinPrice = v238;
    end;
    if v239 < v19.MaxPriceFilter then
        v230.MaxPrice = v239;
    end;
    local v240 = v228.catalogSort or v229.CatalogSort;
    v230.SortType = Enum.CatalogSortType[v240];
    if v229.UnavailableItemFilter ~= v29.Hide then
        v230.IncludeOffSale = true;
    end;
    local l_SalesTypeFilter_0 = v229.SalesTypeFilter;
    if l_SalesTypeFilter_0 ~= v28.All then
        v230.SalesTypeFilter = Enum.SalesTypeFilter[l_SalesTypeFilter_0];
    end;
    local l_CreatorFilter_0 = v229.CreatorFilter;
    if l_CreatorFilter_0 ~= nil and l_CreatorFilter_0 ~= "" then
        v230.CreatorName = l_CreatorFilter_0;
    end;
    if not (v240 ~= v27.MostFavorited) or v240 == v27.Bestselling then
        v230.SortAggregation = Enum.CatalogSortAggregation[v229.CatalogSortAggregation];
    end;
    if v227(v230) then
        v230.CategoryFilter = Enum.CatalogCategoryFilter.None;
    end;
    return v230;
end;
v48.getWebAssetModelFromEquippedAssets = function(v243)
    local v244 = {};
    for v245, v246 in v243, nil, nil do
        local v247 = v16.LayeredAssetTypes[v245] ~= nil;
        for v248, v249 in v246, nil, nil do
            table.insert(v244, {
                id = v248, 
                meta = not not v247 and v249 or nil
            });
        end;
    end;
    return v244;
end;
v48.createHumanoidDescriptionAccessoryInfo = function(v250, v251, v252)
    local v253 = tonumber(v251);
    assert(v253 ~= nil, "assetIdAsNumber is not nil. Silence type checker.");
    return {
        AssetId = v253, 
        Order = v252.order, 
        AccessoryType = v252.type or v16.AssetTypeIdToAccessoryTypeEnum[v250], 
        IsLayered = v252.isLayered
    };
end;
v48.createDefaultHumanoidDescriptionAccessoryInfo = function(v254, v255)
    local v256 = tonumber(v255);
    if v256 == nil then
        v38("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.");
        v256 = 0;
    end;
    assert(v256, "assetIdAsNumber is non-nil: Silence type checker");
    return {
        AssetId = v256, 
        Order = v16.LayeredClothingOrder[v254], 
        AccessoryType = v16.AssetTypeIdToAccessoryTypeEnum[v254], 
        IsLayered = v16.LayeredAssetTypes[v254] ~= nil
    };
end;
v48.getNewFullViewEnum = function(v257)
    if v257 == v26.None then
        return v26.UIFullView;
    else
        return v26.None;
    end;
end;
v48.getPartCFrame = function(v258, v259)
    if not v258 or not v258:FindFirstChild(v259) then
        return CFrame.new(v16.DefaultRigPosition);
    else
        return v258[v259].CFrame;
    end;
end;
v48.getAttachmentCFrame = function(v260, v261, v262)
    if not (not v260 or not v260:FindFirstChild(v261)) then
        local v263 = v260[v261];
        local l_v263_FirstChild_0 = v263:FindFirstChild(v262);
        if l_v263_FirstChild_0 then
            return v263.CFrame * l_v263_FirstChild_0.CFrame;
        end;
    end;
    return nil;
end;
v48.isLCCategory = function(v265)
    if not (not v265 or not v265.AssetTypeIdStrings) then
        for _, v267 in v265.AssetTypeIdStrings, nil, nil do
            if v16.LayeredAssetTypes[v267] ~= nil then
                if v16.LayeredAssetTypes[v267] == Enum.AccessoryType.Hair then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
v48.isShoeBundle = function(v268)
    local v269 = true;
    if v268.bundleType ~= v16.BundleTypeIdStrings.Shoes then
        v269 = v268.bundleType == Enum.BundleType.Shoes.Name;
    end;
    return v269;
end;
v48.isBundleOrLCAsset = function(v270, v271)
    local v272 = v270 == v16.ItemType.Bundle;
    local v273;
    if v270 == v16.ItemType.Asset then
        v273 = true;
        if not (v16.LayeredAssetTypes[v271] == nil) then
            goto label2;
        end;
    end;
    v273 = v272;
    ::label2::;
    return v273;
end;
v48.isBoundingBoxVectorSane = function(v274)
    local v275 = false;
    if v274.X <= 50000 then
        v275 = false;
        if v274.X >= -50000 then
            v275 = false;
            if v274.Y <= 50000 then
                v275 = false;
                if v274.Y >= -50000 then
                    v275 = false;
                    if v274.Z <= 50000 then
                        v275 = v274.Z >= -50000;
                    end;
                end;
            end;
        end;
    end;
    return v275;
end;
v48.isBoundingBoxCFrameSane = function(v276)
    return v48.isBoundingBoxVectorSane(v276.Position) and v48.isBoundingBoxVectorSane(v276.LookVector);
end;
v48.getAssetIdsWithGeometryFromHumanoidDescription = function(v277)
    if v277 == nil then
        return {};
    else
        local v278 = {};
        for _, v280 in (v277:GetAccessories(true)), nil, nil do
            if v280.AssetId then
                table.insert(v278, v280.AssetId);
            end;
        end;
        if v277.Torso then
            table.insert(v278, v277.Torso);
        end;
        if v277.RightLeg then
            table.insert(v278, v277.RightLeg);
        end;
        if v277.RightArm then
            table.insert(v278, v277.RightArm);
        end;
        if v277.LeftLeg then
            table.insert(v278, v277.LeftLeg);
        end;
        if v277.LeftArm then
            table.insert(v278, v277.LeftArm);
        end;
        if v277.Head then
            table.insert(v278, v277.Head);
        end;
        return v278;
    end;
end;
v48.calculateNewAssetIdsWithGeometry = function(v281, v282)
    if v281 and v282 then
        local v283 = v48.getAssetIdsWithGeometryFromHumanoidDescription(v281);
        local v284 = v48.getAssetIdsWithGeometryFromHumanoidDescription(v282);
        local v285 = v9.List.toSet(v283);
        return (v9.List.filter(v284, function(v286)
            return v285[v286] == nil;
        end));
    else
        return {};
    end;
end;
v48.getItemIconTypeFromOutfit = function(v287)
    local v288 = v287.outfitType == v16.OutfitTypes.DynamicHead;
    local l_containsDynamicHead_0 = v287.containsDynamicHead;
    if not v288 and not l_containsDynamicHead_0 then
        if not v45() then
            return l_ItemTileEnums_0.ItemIconType.Bundle;
        else
            return nil;
        end;
    else
        return l_ItemTileEnums_0.ItemIconType.DynamicHead;
    end;
end;
v48.hackGetAbsoluteSzieOfDescendants = function(v290)
    local v291 = v290:getValue();
    if v291 then
        local _ = v291.AbsoluteSize;
        for v293, v294 in (v291:GetDescendants()), nil, nil do
            if v294:IsA("GuiObject") then
                v293 = v294.AbsoluteSize;
            end;
        end;
    end;
end;
v48.assetTypeIdIsAnimationOrEmote = function(v295)
    if v295 then
        return v16.AssetTypeIdToCategory[v295] == v16.AssetCategories.Animation;
    else
        return false;
    end;
end;
local v298 = l_memoize_0(function(v296)
    local v297 = v296 and v296[v16.AssetTypeIdStrings.MoodAnimation];
    return v297 and next(v297);
end);
v48.getEquippedMoodAssetId = function(v299)
    return v298(v299.AvatarExperience.AvatarEditor.Character.EquippedAssets);
end;
v48.getAssetIdForPPEPose = function(v300)
    local l_AvatarExperience_0 = v300.AvatarExperience;
    for v302, v303 in v300.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, nil, nil do
        if v303.itemType == v16.ItemType.Asset and v48.assetTypeIdIsAnimationOrEmote(v303.itemSubType) then
            return v302;
        end;
    end;
    if not l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
        return nil;
    else
        return l_AvatarExperience_0.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    end;
end;
local v305 = l_memoize_0(function(v304)
    return (v304 and v304[v16.AssetTypeIdStrings.Gear]) and next(v304[v16.AssetTypeIdStrings.Gear]);
end);
v48.getEquippedToolId = function(v306)
    return v305(v306.AvatarExperience.AvatarEditor.Character.EquippedAssets);
end;
v48.getNextPageCursorKey = function(v307, v308, v309)
    if not v308 then
        return v307;
    else
        return v307 .. (v309 or "");
    end;
end;
v48.getPerformFetchKey = function(v310, v311, v312)
    if not v311 then
        return v16.UserInventoryKey .. v310;
    else
        return v16.OutfitsKey .. v310 .. (v312 or "");
    end;
end;
v48.getCurrentScreenIgnoreItemDetails = function(v313)
    local l_name_1 = v313.current.name;
    if l_name_1 == v22.ItemDetails then
        l_name_1 = v313.opaque.name;
    end;
    return l_name_1;
end;
v48.getLargestPossibleOneLineTextSize = function(v315, v316, v317, v318)
    local v319 = Vector2.new(v318 - 1, 100000);
    while true do
        if v316 > 1 then
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v315, v316, v317.Font, v319);
            if l_l_TextService_0_TextSize_0.Y <= v316 then
                return Vector2.new(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), v316;
            else
                v316 = v316 - 1;
            end;
        else
            return nil, nil;
        end;
    end;
end;
v48.selectSceneSize = function(v321)
    local l_GlobalGuiInset_0 = v321.GlobalGuiInset;
    local v323 = v321.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_ScreenSize_0 = v321.ScreenSize;
    return not not v323 and l_getSafeAreaSize_0(l_ScreenSize_0, l_GlobalGuiInset_0).Y.Offset * v16.PortraitSceneHeight or l_ScreenSize_0.Y - l_GlobalGuiInset_0.bottom, not not v323 and l_ScreenSize_0.X or l_ScreenSize_0.X * v16.LandscapeSceneWidth;
end;
v48.getColor3Difference = l_memoize_0(function(v325, v326)
    return (math.sqrt(((v325.R - v326.R) * (v325.R - v326.R) + (v325.G - v326.G) * (v325.G - v326.G)) + (v325.B - v326.B) * (v325.B - v326.B)));
end);
v48.color3ToBodyColor = l_memoize_0(function(v327, v328)
    local v329 = 3;
    local v330 = nil;
    for _, v332 in v328, nil, nil do
        local l_brickColorId_0 = v332.brickColorId;
        local v334 = v48.getColor3Difference(v327, BrickColor.new(l_brickColorId_0).Color);
        if v334 < v329 then
            v330 = l_brickColorId_0;
            v329 = v334;
        end;
    end;
    return v330;
end);
v48.color3HexToBodyColor = l_memoize_0(function(v335, v336)
    return v48.color3ToBodyColor(Color3.fromHex(v335), v336);
end);
v48.bodyColorToBodyColor3 = l_memoize_0(function(v337)
    if not v337 then
        return nil;
    else
        return BrickColor.new(v337).Color;
    end;
end);
v48.bodyPartForSkinColoringIdToBodyColorId = {
    headColor3 = "headColorId", 
    torsoColor3 = "torsoColorId", 
    rightArmColor3 = "rightArmColorId", 
    rightLegColor3 = "rightLegColorId", 
    leftArmColor3 = "leftArmColorId", 
    leftLegColor3 = "leftLegColorId"
};
v48.bodyColorIdToBodyPartForSkinColoringId = {};
for v338, v339 in pairs(v48.bodyPartForSkinColoringIdToBodyColorId) do
    v48.bodyColorIdToBodyPartForSkinColoringId[v339] = v338;
end;
v48.convertBodyColorsToColor3s = l_memoize_0(function(v340)
    local v341 = {};
    for v342, v343 in pairs(v340) do
        v341[v48.bodyColorIdToBodyPartForSkinColoringId[v342]] = v48.bodyColorToBodyColor3(v343);
    end;
    return v341;
end);
v48.convertBodyColor3HexesToIds = l_memoize_0(function(v344, v345)
    local v346 = {};
    for _, v348 in v17.allBodyPartForSkinColoringIds, nil, nil do
        v346[v48.bodyPartForSkinColoringIdToBodyColorId[v348]] = v48.color3HexToBodyColor(v344[v348], v345);
    end;
    return v346;
end);
v48.convertBodyColor3sToIds = l_memoize_0(function(v349, v350)
    local v351 = {};
    for _, v353 in v17.allBodyPartForSkinColoringIds, nil, nil do
        v351[v48.bodyPartForSkinColoringIdToBodyColorId[v353]] = v48.color3ToBodyColor(v349[v353], v350);
    end;
    return v351;
end);
v48.convertBodyColor3sToHexes = l_memoize_0(function(v354)
    local v355 = {};
    for v356, v357 in pairs(v354) do
        v355[v356] = v357:ToHex();
    end;
    return v355;
end);
v48.convertBodyColor3HexesToColor3s = l_memoize_0(function(v358)
    local v359 = {};
    for v360, v361 in pairs(v358) do
        v359[v360] = Color3.fromHex(v361);
    end;
    return v359;
end);
v48.isAvatarSceneButtonsVisible = function(v362, v363, v364, v365, v366)
    local v367 = ((v23[v362.opaque.name] or {}).refinementButtonVisible and not v364) and not v365;
    if not v366 then
        return v367 and v363;
    else
        return v367 and v366.state.key == v362.opaque.key;
    end;
end;
v48.isUserCameraEligible = function()
    local v368 = v9.isEmpty((l_VideoCaptureService_0:GetCameraDevices()));
    assert(l_Players_0 ~= nil, "Players should always be defined");
    local v369 = not l_Players_0.LocalPlayer and true or l_Players_0.LocalPlayer:GetUnder13();
    if not v41 then
        return not ((v368 or v40) or v369);
    else
        return not (v368 or v40);
    end;
end;
v48.getUserId = function(v370)
    if not v370.LocalUserId then
        if not v370.RobloxUser or not v370.RobloxUser.rbxuid then
            return nil;
        else
            return (tostring(v370.RobloxUser.rbxuid));
        end;
    else
        return v370.LocalUserId;
    end;
end;
v48.getRecommendedAssetTypeIdStringFromCategoryInfo = l_memoize_0(function(v371)
    if not v371.RecommendedAssetTypeIdString then
        if v371.AssetTypeIdStrings and #v371.AssetTypeIdStrings == 1 then
            return v371.AssetTypeIdStrings[1];
        else
            return nil;
        end;
    else
        return v371.RecommendedAssetTypeIdString;
    end;
end);
v48.getRecommendedKey = l_memoize_0(function(v372)
    if v372.RecommendationsType == v17.RecommendationsType.Asset then
        local v373 = v48.getRecommendedAssetTypeIdStringFromCategoryInfo(v372);
        if v373 then
            return v373;
        else
            v38("called getRecommendedKey with a category with no assetTypeIdString");
            return v16.AssetTypeIdStrings.Hat;
        end;
    elseif v372.RecommendationsType == v17.RecommendationsType.BodyParts then
        return v17.RecommendationsType.BodyParts;
    elseif v372.RecommendationsType == v17.RecommendationsType.AvatarAnimations then
        return v17.RecommendationsType.AvatarAnimations;
    elseif v372.RecommendationsType == v17.RecommendationsType.Shoes then
        return v17.RecommendationsType.Shoes;
    elseif v372.RecommendationsType == v17.RecommendationsType.DynamicHeads then
        return v17.RecommendationsType.DynamicHeads;
    else
        return v17.RecommendationsType.None;
    end;
end);
v48.getCategoryInfoByName = l_memoize_0(function(v374, v375, v376)
    local v377 = nil;
    local v378 = nil;
    for v379, v380 in v374, nil, nil do
        if v380.Name == v375 then
            v377 = v379;
            if not (not v376 or not v380.Subcategories) then
                for v381, v382 in v380.Subcategories, nil, nil do
                    if v382.Name == v376 then
                        v378 = v381;
                        break;
                    end;
                end;
                assert(v378 ~= nil, "Could not find subcategory with name " .. v376);
                break;
            else
                break;
            end;
        end;
    end;
    assert(v377 ~= nil, "Could not find category with name  " .. v375);
    return (v48.getCategoryInfo(v374, v377, v378));
end);
v48.getAssetIdFromContent = l_memoize_0(function(v383)
    if v383 == nil then
        return nil;
    else
        assert(v383, "contentId is not nil: silences type checker");
        local v384 = string.match(v383, ".*?id=([0-9]+)");
        if not v384 then
            return string.match(v383, "rbxassetid://([0-9]+)");
        else
            return v384;
        end;
    end;
end);
v48.sortOutfitTryOnItemsByRecency = l_memoize_0(function(v385, v386)
    local v387 = {};
    for _, v389 in v385, nil, nil do
        table.insert(v387, v389);
    end;
    table.sort(v387, function(v390, v391)
        if not v386 then
            return v390.itemRecency < v391.itemRecency;
        else
            return v391.itemRecency < v390.itemRecency;
        end;
    end);
    return v387;
end);
return v48;
