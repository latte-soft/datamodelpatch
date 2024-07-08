local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarRouteContext);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceAlwaysMounted);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootNavigator);
local v9 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v10 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.AvatarExperience.Common.Debug.LogTree).logger("ax.loadtime");
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local v20 = v3.Component:extend("AvatarExperienceRootContainer");
local v21 = require(l_CorePackages_0.Packages.RoactGamepad);
local v22 = game:DefineFastFlag("EnableAXEnableAXClientLatencyLogging", false);
local v23 = game:DefineFastFlag("EnableAXFPSLogging", false);
local v24 = game:DefineFastFlag("EnableAXClientErrorLogging", false);
local v25 = game:DefineFastFlag("EnableAXClientLatencyLoggingByPlatform", false);
local v26 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.GetTopLevelPageFPSCounterName);
local v28 = game:DefineFastInt("AvatarExperienceFPSDuration", 6);
v20.init = function(v29)
    v29.namedRefs = v21.createRefCache();
    if v22 then
        v29.startAXLatencyTimer = os.clock();
        v29.isNavigating = false;
    end;
    if v23 then
        v29:trackTopLevelPageFPS((v6(v29.props.navigation, false)));
    end;
end;
v20.render = function(v30)
    return v3.createElement(v9.Consumer, {
        render = function(v31)
            return v3.createElement(v10.Consumer, {
                render = function(v32)
                    local v33 = v30.props.screenProps and v30.props.screenProps.isVisible;
                    if not v33 then
                        if v32 then
                            v33 = true;
                            if not (v31 ~= v4.AvatarExperienceRoot) then
                                goto label0;
                            end;
                        end;
                        v33 = false;
                    end;
                    ::label0::;
                    return v3.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Visible = v33
                    }, {
                        AvatarExperienceRoot = v30:renderWithVisibility(v33)
                    });
                end
            });
        end
    });
end;
v20.renderWithVisibility = function(v34, v35)
    local l_navigation_0 = v34.props.navigation;
    local v37 = v6(l_navigation_0, v35);
    return v3.createElement(v19.Provider, {
        value = v34.namedRefs
    }, {
        AvatarRouteProvider = v3.createElement(v5.Provider, {
            value = v37
        }, {
            RootNavigator = v3.createElement(v8, {
                navigation = l_navigation_0, 
                avatarRoute = v37
            }), 
            AlwaysMounted = v3.createElement(v7, {
                navigation = l_navigation_0, 
                avatarRoute = v37
            })
        })
    });
end;
local function v40(v38)
    local l_TopLevelErrors_0 = v11.Counter.TopLevelErrors;
    return {
        [v4.Catalog] = l_TopLevelErrors_0.CatalogViewError, 
        [v4.CatalogSearch] = l_TopLevelErrors_0.SearchViewError, 
        [v4.AvatarEditor] = l_TopLevelErrors_0.EditorViewError, 
        [v4.ItemDetails] = not not v38 and l_TopLevelErrors_0.SearchItemDetailsViewError or l_TopLevelErrors_0.CatalogItemDetailsViewError, 
        [v4.SortAndFilters] = not not v38 and l_TopLevelErrors_0.SearchFiltersViewError or l_TopLevelErrors_0.CatalogFiltersViewError
    };
end;
local function v44(v41, v42)
    local v43 = v40((v12.isWithinViewContext(v41, v4.CatalogSearch)))[v41.current.name] or v11.Counter.TopLevelErrors.UnknownViewError;
    task.spawn(function()
        v42.sendAXCounter(v43);
    end);
end;
local function v47(v45)
    local l_TopLevelLatency_0 = v11.Counter.TopLevelLatency;
    return {
        [v4.Catalog] = l_TopLevelLatency_0.CatalogViewLatency, 
        [v4.CatalogSearch] = l_TopLevelLatency_0.SearchViewLatency, 
        [v4.AvatarEditor] = l_TopLevelLatency_0.EditorViewLatency, 
        [v4.ItemDetails] = not not v45 and l_TopLevelLatency_0.SearchItemDetailsViewLatency or l_TopLevelLatency_0.CatalogItemDetailsViewLatency, 
        [v4.SortAndFilters] = not not v45 and l_TopLevelLatency_0.SearchFiltersViewLatency or l_TopLevelLatency_0.CatalogFiltersViewLatency
    };
end;
v20.trackTopLevelPageLatency = function(v48)
    local v49 = v6(v48.props.navigation, false);
    local l_appAnalytics_0 = v48.props.appAnalytics;
    local v51 = v47((v12.isWithinViewContext(v49, v4.CatalogSearch)))[v49.current.name] or v11.Counter.TopLevelLatency.UnknownViewLatency;
    local v52 = (os.clock() - v48.startAXLatencyTimer) * 1000;
    v16:info("Avatar experirence load time: {} ms", v52);
    if not v25 then
        l_appAnalytics_0.Diag:reportStats(v51, v52);
    else
        l_appAnalytics_0.Diag:reportStats(v51 .. "_" .. v18.getDeviceType(), v52);
    end;
    v48.startAXLatencyTimer = nil;
end;
v20.trackTopLevelPageFPS = function(_, v54)
    local v55 = v27(v54.current.name, v54);
    if not v28 or v28 <= 0 then
        v28 = 1;
    end;
    l_IntervalPerformanceTracker_0:startTracking(v55, v28);
end;
if v24 then
    v20.componentDidCatch = function(v56, v57, _)
        v44(v6(v56.props.navigation, false), v56.props.catalogAnalytics);
        error(v57);
    end;
    if v22 then
        v20.didMount = function(v59)
            v59:trackTopLevelPageLatency();
        end;
        v20.willUpdate = function(v60, v61)
            local v62 = v6(v61.navigation, false);
            if v62.current.name ~= v6(v60.props.navigation, false).current.name then
                v60.startAXLatencyTimer = os.clock();
                v60.isNavigating = true;
                if v23 then
                    v60:trackTopLevelPageFPS(v62);
                end;
            end;
        end;
        v20.didUpdate = function(v63, v64)
            local v65 = v6(v63.props.navigation, false);
            local l_name_0 = v6(v64.navigation, false).current.name;
            local l_name_1 = v65.current.name;
            if v63.isNavigating and l_name_1 ~= l_name_0 then
                v63:trackTopLevelPageLatency();
                v63.isNavigating = false;
            end;
        end;
    end;
    v20 = l_RoactServices_0.connect({
        catalogAnalytics = v15, 
        appAnalytics = if not v22 then nil else v26
    })(v20);
end;
v20.router = v8.router;
return v20;
