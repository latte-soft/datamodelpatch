local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.React);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.Rodux);
local v7 = require(l_Parent_0.UIBlox);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Provider_0 = require(l_Parent_0.Dev.RoactAppExperiment).Provider;
local l_FocusControllerProvider_0 = require(l_Parent_0.Dev.UnitTestHelpers).FocusControllerProvider;
local l_Localization_0 = require(l_Parent_0.Dev.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_MockIXPService_0 = require(l_Parent_0.Dev.RoactAppExperiment).MockIXPService;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v16 = require(l_Parent_0.Cryo);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_mockHttpResponse_0 = require(l_Parent_0.Dev.UnitTestHelpers).mockHttpResponse;
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v20 = require(l_Parent_0.Promise);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_RoactAppPolicy_0 = require(l_Parent_0.Dev.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.Dev.UniversalAppPolicy).AppFeaturePolicies;
local l_Analytics_0 = require(l_Parent_0.Dev.Analytics).Analytics;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local v27 = require(l_script_FirstAncestor_0.Reducers.installReducer);
local v28 = v2.strictInterface({
    includeTopBarSearchSignalProvider = v2.optional(v2.boolean), 
    includeIXPServiceProvider = v2.optional(v2.boolean), 
    includeABTestServiceProvider = v2.optional(v2.boolean), 
    browserTrackerABTests = v2.optional(v2.table), 
    userABTests = v2.optional(v2.table), 
    browserTrackerLayers = v2.optional(v2.table), 
    userLayers = v2.optional(v2.table), 
    includeStoreProvider = v2.optional(v2.boolean), 
    store = v2.optional(v2.table), 
    initialStoreState = v2.optional(v2.table), 
    includeAppGridProvider = v2.optional(v2.boolean), 
    includeStyleProvider = v2.optional(v2.boolean), 
    includeDesignTokenProvider = v2.optional(v2.boolean), 
    includeThemeProvider = v2.optional(v2.boolean), 
    includeAppPolicyProvider = v2.optional(v2.boolean), 
    includeLocalizationProvider = v2.optional(v2.boolean), 
    includeNavigationProvider = v2.optional(v2.boolean), 
    includeFocusControllerProvider = v2.optional(v2.boolean), 
    includeDefaultAvatarEditorServiceMock = v2.optional(v2.boolean), 
    includeApolloProvider = v2.optional(v2.boolean), 
    includeCursorProvider = v2.optional(v2.boolean), 
    includeRootRNAppContainer = v2.optional(v2.boolean), 
    middlewareList = v2.optional(v2.table), 
    focusController = v2.optional(v2.table), 
    captureFocusOnMount = v2.optional(v2.boolean), 
    includeContentProvider = v2.optional(v2.boolean), 
    theme = v2.optional(v2.table), 
    appPolicy = v2.optional(v2.table), 
    themeName = v2.optional(v2.string), 
    appStyle = v2.optional(v2.table), 
    appGridConfig = v2.optional(v2.table), 
    localization = v2.optional(v2.table), 
    navigation = v2.optional(v2.table), 
    extraServices = v2.optional(v2.map(v2.table, v2.any)), 
    apolloClient = v2.optional(v2.table)
});
local function v31()
    return {
        includeTopBarSearchSignalProvider = false, 
        includeABTestServiceProvider = false, 
        includeIXPServiceProvider = true, 
        browserTrackerABTests = {}, 
        userABTests = {}, 
        browserTrackerLayers = {}, 
        userLayers = {}, 
        includeStoreProvider = false, 
        store = {}, 
        initialStoreState = nil, 
        includeStyleProvider = true, 
        includeAppGridProvider = false, 
        includeDesignTokenProvider = false, 
        includeThemeProvider = true, 
        includeAppPolicyProvider = false, 
        includeLocalizationProvider = true, 
        includeNavigationProvider = true, 
        includeFocusControllerProvider = false, 
        includeDefaultAvatarEditorServiceMock = false, 
        includeApolloProvider = false, 
        includeCursorProvider = false, 
        includeRootRNAppContainer = false, 
        apolloClient = nil, 
        focusController = nil, 
        captureFocusOnMount = false, 
        includeContentProvider = true, 
        middlewareList = nil, 
        appPolicy = {}, 
        appStyle = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham, 
            deviceType = "Desktop"
        }, 
        appGridConfig = nil, 
        localization = l_Localization_0.new("en-us"), 
        navigation = {
            isFocused = function()
                return false;
            end, 
            addListener = function()
                return {
                    remove = function()
                    end
                };
            end, 
            getParam = function(_, v30)
                return v30;
            end, 
            navigate = function()
            end, 
            state = {
                routeName = "DummyRoute"
            }
        }, 
        extraServices = nil
    };
end;
local _ = function(v32)
    assert(v32 ~= nil, "Expected responseBody not to be nil");
    return function(v33, _)
        return v20.resolve(l_mockHttpResponse_0.new(v33, v32, 0, l_StatusCodes_0.OK));
    end;
end;
return function(v36, v37)
    local v38 = v31();
    if v37 then
        assert(v28(v37));
        v38 = v16.Dictionary.join(v38, v37);
    end;
    local l_store_0 = v38.store;
    local v40 = {};
    local v41 = {};
    local l_l_RoactNetworking_0_0 = l_RoactNetworking_0;
    local v43 = {};
    assert(v43 ~= nil, "Expected responseBody not to be nil");
    local l_v43_0 = v43 --[[ copy: 8 -> 10 ]];
    v41[l_l_RoactNetworking_0_0] = function(v45, _)
        return v20.resolve(l_mockHttpResponse_0.new(v45, l_v43_0, 0, l_StatusCodes_0.OK));
    end;
    v41[l_RoactAnalytics_0] = l_Analytics_0.mock();
    v40.services = v41;
    if v38.extraServices ~= nil then
        for v47, v48 in pairs(v38.extraServices) do
            assert(type(v47) == "table", "Expected key to be a table");
            v40.services[v47] = v48;
        end;
    end;
    v41 = {
        DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
            tokenMappers = {}
        }, v36)
    };
    l_l_RoactNetworking_0_0 = {
        v6.thunkMiddleware
    };
    local v51 = v6.combineReducers({
        FetchingStatus = l_FetchingStatus_0, 
        ScreenSize = function(v49, v50)
            v49 = v49 or Vector2.new(0, 0);
            assert(v49, "");
            if v50.type == "SetScreenSize" then
                return v50.screenSize;
            else
                return v49;
            end;
        end, 
        [l_RODUX_KEY_0] = v27()
    });
    v43 = function(v52, v53)
        return v51(v52, v53);
    end;
    if not v38.initialStoreState then
        if not l_store_0 then
            l_store_0 = v6.Store.new(v43, nil, l_l_RoactNetworking_0_0);
        elseif getmetatable(l_store_0) == nil then
            l_store_0 = v6.Store.new(v43, l_store_0, l_l_RoactNetworking_0_0);
        end;
    else
        l_store_0 = v6.Store.new(v43, v38.initialStoreState, l_l_RoactNetworking_0_0);
    end;
    if v38.includeStoreProvider then
        v41 = {
            StoreProvider = v3.createElement(v5.StoreProvider, {
                store = l_store_0
            }, v41)
        };
    end;
    if v38.includeStyleProvider then
        v41 = {
            StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                style = v38.appStyle
            }, v41)
        };
    end;
    if v38.includeCursorProvider then
        assert(v38.includeStyleProvider, "includeStyleProvider must be set to `true` in order to include CursorProvider");
        v41 = {
            CursorProvider = v3.createElement(v7.App.SelectionCursor.CursorProvider, {}, v41)
        };
    end;
    if v38.includeIXPServiceProvider then
        v41 = {
            IXPServiceProvider = v3.createElement(l_Provider_0, {
                value = l_MockIXPService_0.new(v38.browserTrackerLayers, v38.userLayers, true)
            }, v41)
        };
    end;
    if v38.includeFocusControllerProvider then
        v41 = {
            FocusControllerProvider = v3.createElement(l_FocusControllerProvider_0, {
                captureFocusOnMount = v38.captureFocusOnMount, 
                focusController = v38.focusController
            }, v41)
        };
    end;
    if v38.includeThemeProvider then
        v41 = {
            ThemeProvider = v3.createElement(v7.Style.Provider, {}, v41)
        };
    end;
    if v38.includeLocalizationProvider then
        v41 = {
            LocalizationProvider = v3.createElement(l_LocalizationProvider_0, {
                localization = v38.localization
            }, v41)
        };
    end;
    if v38.includeAppPolicyProvider then
        v41 = {
            AppPolicyProvider = v3.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }, 
                policyData = v38.appPolicy
            }, v41)
        };
    end;
    return (v3.createElement(l_RoactServices_0.ServiceProvider, v40, v41));
end;
