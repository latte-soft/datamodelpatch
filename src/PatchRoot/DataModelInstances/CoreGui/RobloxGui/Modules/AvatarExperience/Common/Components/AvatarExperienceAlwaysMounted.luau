local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonHandler);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarRouteUpdater);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceTransitionManager);
local v10 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortHandler);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAXTopLevelCounters);
local v17 = game:DefineFastFlag("AXEnableOverCountingFixCounters", false);
local v18 = game:DefineFastInt("AXTopLevelCountersThrottleInterval", 800);
local function v24(v19, v20)
    local l_name_0 = v19.current.name;
    local l_Counter_0 = v11.Counter;
    local v23 = ({
        [v12.Catalog] = l_Counter_0.CatalogView, 
        [v12.CatalogSearch] = l_Counter_0.SearchView, 
        [v12.AvatarEditor] = l_Counter_0.EditorView, 
        [v12.ItemDetails] = function()
            return not not v14.isWithinViewContext(v19, v12.CatalogSearch) and l_Counter_0.SearchItemDetailsView or l_Counter_0.CatalogItemDetailsView;
        end, 
        [v12.SortAndFilters] = function()
            return not not v14.isWithinViewContext(v19, v12.CatalogSearch) and l_Counter_0.SearchFiltersView or l_Counter_0.CatalogFiltersView;
        end
    })[l_name_0] or l_Counter_0.OthersView;
    if type(v23) == "function" then
        v23 = v23();
    end;
    v20.sendAXCounter(v23);
end;
return function(v25)
    local l_avatarRoute_0 = v25.avatarRoute;
    local l_navigation_0 = v25.navigation;
    if v16() then
        local v28 = l_useRoactService_0(v15);
        local v29 = if not v17 then nil else v4.useRef(0);
        v4.useEffect(function()
            if not v17 then
                v24(l_avatarRoute_0, v28);
            else
                local v30 = os.clock() * 1000;
                if not ((not v30 or not v29) or not v29.current) and v18 <= v30 - v29.current then
                    v24(l_avatarRoute_0, v28);
                    v29.current = v30;
                    return ;
                end;
            end;
        end, {
            l_avatarRoute_0, 
            v28
        });
    end;
    return v3.createFragment({
        BackButtonHandler = v3.createElement(v6, {
            navigation = l_navigation_0
        }), 
        ExternalNavigationHandler = v3.createElement(v8, {
            navigation = l_navigation_0
        }), 
        AvatarExperienceTransitionManager = v3.createElement(v9, {
            navigation = l_navigation_0
        }), 
        AvatarRouteUpdater = v3.createElement(v7, {
            avatarRoute = l_avatarRoute_0
        }), 
        LayeredClothingSortHandler = v3.createElement(v10, {
            avatarRoute = l_avatarRoute_0
        })
    });
end;
