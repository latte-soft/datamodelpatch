local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v10 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v11 = require(l_Modules_0.LuaApp.SearchUuid);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AppPanel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).AppPanel3D;
local l_Panel3D_0 = v6.Core.VR.Panel3D;
local v15 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v16 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_HeaderBar_0 = v6.App.Bar.HeaderBar;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_SearchTypes_0 = require(l_Modules_0.LuaApp.Constants).SearchTypes;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local l_SegmentedControl_0 = v6.App.Control.SegmentedControl;
local v26 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_VR_0 = v5.VR;
local l_GetFFlagAdjustVRFloor_0 = v4.GetFFlagAdjustVRFloor;
local v29 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v30 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v31 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_ROUNDED_CORNER_RADIUS_0 = require(l_Modules_0.LuaApp.Constants).ROUNDED_CORNER_RADIUS;
local v33 = l_Images_0["icons/navigation/pushBack"];
local v34 = l_Images_0["icons/common/search"];
local v35 = l_Images_0["icons/menu/customize"];
local v36 = l_Images_0["icons/menu/shop"];
local v37 = {
    v24.AvatarEditor, 
    v24.Catalog
};
local v38 = {
    [v24.AvatarEditor] = 1, 
    [v24.CatalogSearch] = 2, 
    [v24.Catalog] = 2
};
local v39 = if not l_GetFFlagAdjustVRFloor_0() then l_Panel3D_0 else l_AppPanel3D_0;
return function(v40)
    local v41, v42 = v3.useState(false);
    local v43 = l_useDispatch_0();
    local v44 = v21(v26);
    local v45 = l_useStyle_0();
    local v46 = l_useLocalization_0({
        shop = "Feature.Avatar.Action.Shop", 
        customize = "Feature.Catalog.Action.Customize", 
        searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
    });
    local function v48(v47)
        return v3.createElement(l_IconButton_0, {
            layoutOrder = 1, 
            size = UDim2.fromOffset(58, 58), 
            icon = v33, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = v45.Theme.SystemPrimaryDefault.Color, 
            iconTransparency = v45.Theme.SystemPrimaryDefault.Transparency, 
            backgroundColor = {
                Color = v45.Theme.BackgroundUIDefault.Color, 
                Transparency = v45.Theme.BackgroundUIDefault.Transparency
            }, 
            showBackground = true, 
            onActivated = v47
        });
    end;
    local v54 = v3.useCallback(function(v49, v50, v51)
        local v52 = v11();
        local v53 = {
            searchKeyword = v49, 
            isKeywordSuggestionEnabled = true
        };
        v43(v30(v52, l_SearchTypes_0.Catalog));
        v43(v29(v52, v53));
        v31(v44, "catalog", v49, v50, v24.CatalogSearch, v51);
        v12.navigateToSearch(v40.navigation, v52, v53);
        v42(false);
    end);
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if not v41 then
        if v40.currentPage == v24.LayeredClothingSort then
            v55 = v48(function()
                v40.navigation.navigate(v24.Catalog);
            end);
            v58 = "Feature.Avatar.Title.LCSortPage";
        else
            v56 = v3.createElement(l_SegmentedControl_0, {
                layoutOrder = 2, 
                selectedTabIndex = v38[v40.currentPage] or 1, 
                onTabActivated = function(v59)
                    v40.navigation.navigate(v37[v59]);
                end, 
                tabs = {
                    {
                        tabName = v46.customize, 
                        icon = v35
                    }, 
                    {
                        tabName = v46.shop, 
                        icon = v36
                    }
                }, 
                width = UDim.new(0, 350), 
                height = 58
            });
            v57 = if v38[v40.currentPage] == 2 then v3.createElement(l_IconButton_0, {
                layoutOrder = 3, 
                size = UDim2.fromOffset(58, 58), 
                icon = v34, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v45.Theme.SystemPrimaryDefault.Color, 
                iconTransparency = v45.Theme.SystemPrimaryDefault.Transparency, 
                backgroundColor = {
                    Color = v45.Theme.BackgroundUIDefault.Color, 
                    Transparency = v45.Theme.BackgroundUIDefault.Transparency
                }, 
                showBackground = true, 
                onActivated = function()
                    v42(true);
                end
            }) else nil;
        end;
    else
        v56 = v3.createElement(v10, {
            Size = UDim2.new(1, 0, 1, -l_ROUNDED_CORNER_RADIUS_0), 
            modernUI = true, 
            cancelSearch = function()
                v42(false);
            end, 
            confirmSearch = v54, 
            onFocused = nil, 
            onTextCleared = nil, 
            isCompactView = false, 
            placeholderText = v46.searchPlaceholder, 
            searchType = l_SearchTypes_0.Catalog, 
            autocomplete = true, 
            isSearching = v41
        });
    end;
    return v3.createElement(v15.Consumer, {
        render = function(v60)
            return v3.createElement(v16.Consumer, {
                render = function(v61)
                    return v3.createElement(v39, {
                        partSize = l_VR_0.AvatarEditorNavBarSize, 
                        offset = if not l_GetFFlagAdjustVRFloor_0() then CFrame.lookAt(l_VR_0.AvatarEditorNavBarPosition, l_VR_0.AvatarEditorNavBarOrientation) else l_VR_0.AvatarEditorNavBarPosition, 
                        virtualScreenSize = l_VR_0.AvatarEditorNavBarResolution, 
                        panelName = "AvatarNavBarVR", 
                        hidden = not v61 or v60 ~= v24.AvatarExperienceRoot
                    }, {
                        RoundedFrame = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v45.Theme.BackgroundDefault.Color
                        }, {
                            UICorner = v3.createElement("UICorner", {
                                CornerRadius = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0)
                            }), 
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingRight = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0), 
                                PaddingLeft = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0)
                            }), 
                            HeaderBar = l_withLocalization_0({
                                title = v58
                            })(function(v62)
                                return v3.createElement(l_HeaderBar_0, {
                                    backgroundTransparency = 0, 
                                    barHeight = l_VR_0.AvatarEditorNavBarResolution.Y, 
                                    renderLeft = if not v55 then nil else function()
                                        return v55;
                                    end, 
                                    renderCenter = not not v56 and function()
                                        return v56;
                                    end or nil, 
                                    renderRight = not not v57 and function()
                                        return v57;
                                    end or nil, 
                                    title = not not v58 and v62.title or nil
                                });
                            end)
                        })
                    });
                end
            });
        end
    });
end;
