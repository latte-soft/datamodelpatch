local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Thunks.Games.OpenInfoPeekView);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.SponsoredItems);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCard);
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectSponsoredItems);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemCardRedesignIXPEnabled);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSponsoredTooltipForAvatarCatalog);
return (v2.forwardRef(function(v20, v21)
    local v22 = v3.useRefCache();
    local v23 = v3.useFocusController();
    local v25 = l_useSelector_0(function(v24)
        return v24.Search.SearchesInCatalog[v20.searchUuid];
    end);
    local v26 = l_useNavigation_0();
    local l_itemsPerRow_0 = v20.itemsPerRow;
    local l_key_0 = v26.state.key;
    local v29 = v14.ImpressionsEvents.AvatarItems .. (not l_key_0 and "" or string.gsub(l_key_0, "[-{}]", ""));
    local v30 = v25 and v25.keyword;
    local l_Catalog_0 = v15.AnalyticsContext.Catalog;
    if v20.fromSearch then
        l_Catalog_0 = v15.AnalyticsContext.CatalogSearch;
    end;
    local v32 = l_useSelector_0(v16);
    local v33 = v2.useMemo(function()
        if v32 and l_itemsPerRow_0 > 0 then
            return v4.List.getRange(v32, 1, l_itemsPerRow_0);
        else
            return nil;
        end;
    end, {
        v32, 
        l_itemsPerRow_0
    });
    local v34 = if not v19() then nil else v5({
        sponsored = "Feature.GamePage.Label.Sponsored", 
        sponsoredDisclosure = "Feature.GamePage.Label.SponsoredDisclosure", 
        gotIt = "Feature.Avatar.Action.GotIt"
    });
    local v35 = if not v19() then nil else l_useDispatch_0();
    local v38 = if not v19() then nil else function(v36, v37)
        v26.navigate(v11.GenericPrompt, {
            titleText = v36, 
            bodyText = v37, 
            buttonText = v34.gotIt
        });
    end;
    return v2.createElement(v2.Fragment, nil, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        SponsoredItems = v2.createElement(v12, {
            LayoutOrder = 1, 
            numItemsPerRow = l_itemsPerRow_0, 
            renderItem = function(v39, v40)
                return v2.createElement(v3.Focusable.Frame, {
                    Size = UDim2.fromOffset(v20.itemSize.X, v20.itemSize.Y), 
                    BackgroundTransparency = 1, 
                    ref = v22[v40], 
                    NextSelectionRight = if v40 < l_itemsPerRow_0 then v22[v40 + 1] else nil, 
                    NextSelectionLeft = if v40 > 1 then v22[v40 - 1] else nil, 
                    onFocusGained = function()
                        if v20.gamepadNavigationFocusPos:getValue().Y ~= v20.rowIndex then
                            return ;
                        else
                            v20.setGamepadNavigationFocusPos(Vector2.new(v40, v20.rowIndex));
                            return ;
                        end;
                    end
                }, {
                    CatalogItemCard = v2.createElement(v13, {
                        analyticsContext = l_Catalog_0, 
                        analyticsItemCountPerPage = v15.PageFetchLimit, 
                        index = v40, 
                        itemType = v39.type, 
                        itemId = v39.id, 
                        adTrackingData = v39.encryptedAdTrackingData, 
                        isSponsoredItem = true, 
                        itemDetailsPeekViewRefs = v20.itemDetailsPeekViewRefs, 
                        resultsListRef = v20.gridRef, 
                        impressionsTag = v29, 
                        impressionsSchema = "defaultItem", 
                        impressionsGroup = nil, 
                        impressionsSearch = v30, 
                        impressionsId = v39.id, 
                        hideItemName = if not v18() then nil else v20.hideItemNames
                    })
                });
            end, 
            sponsoredGridRef = v21, 
            scrollingFrameRef = v20.scrollingFrameRef, 
            requestImpressionsSignal = v20.requestImpressionsSignal, 
            getItemMetrics = if not v18() then nil else v20.getItemMetrics, 
            hideItemName = if not v18() then nil else v20.hideItemNames, 
            NextSelectionUp = v20.NextSelectionUp, 
            NextSelectionDown = v20.NextSelectionDown, 
            NextSelectionRight = v20.NextSelectionRight, 
            onFocusGained = v20.onFocusGained, 
            moveFocusToColumn = function()
                v20.setGamepadNavigationFocusPos(Vector2.new(v20.gamepadNavigationFocusPos:getValue().X, v20.rowIndex));
                local l_X_0 = v20.gamepadNavigationFocusPos:getValue().X;
                local _ = nil;
                v23.moveFocusTo(if not l_X_0 then v22[1] else v22[math.min(l_X_0, #v33)]);
            end, 
            onActivateTooltipCallback = if not v19() then nil else if not v19() then nil else v2.useCallback(function()
                if not (not v35 or not v34.sponsoredDisclosure) then
                    if not l_IsVRAppBuild_0() or not v38 then
                        v35(v9(v34.sponsored, v34.sponsoredDisclosure));
                    else
                        v38(v34.sponsored, v34.sponsoredDisclosure);
                        return ;
                    end;
                end;
            end, {
                v35, 
                v34.sponsored, 
                v34.sponsoredDisclosure
            })
        }), 
        ManualPaddingFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 11), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end));
