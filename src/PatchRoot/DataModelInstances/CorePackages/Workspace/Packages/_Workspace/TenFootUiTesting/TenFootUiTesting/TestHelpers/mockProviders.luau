local l_Parent_0 = script:FindFirstAncestor("TenFootUiTesting").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.Rodux);
local v6 = require(l_Parent_0.UIBlox);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local v9 = require(l_Parent_0.t);
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local l_Constants_0 = v6.App.Style.Constants;
local l_MockContentProvider_0 = v6.UnitTestHelpers.MockContentProvider;
local v13 = v9.strictInterface({
    includeStoreProvider = v9.optional(v9.boolean), 
    store = v9.optional(v9.table), 
    topLevelReducer = v9.optional(v9.callback), 
    initialStoreState = v9.optional(v9.table), 
    includeStyleProvider = v9.optional(v9.boolean), 
    includeLocalizationProvider = v9.optional(v9.boolean), 
    includeNavigationProvider = v9.optional(v9.boolean), 
    includeAppPolicyProvider = v9.optional(v9.boolean), 
    includeFocusControllerProvider = v9.optional(v9.boolean), 
    middlewareList = v9.optional(v9.table), 
    appStyle = v9.optional(v9.table), 
    appPolicy = v9.optional(v9.table), 
    policyFactory = v9.optional(v9.union(v9.callback, v9.table)), 
    focusController = v9.optional(v9.table), 
    captureFocusOnMount = v9.optional(v9.boolean), 
    includeContentProvider = v9.optional(v9.boolean), 
    localization = v9.optional(v9.table), 
    navigation = v9.optional(v9.table)
});
local function v14()
    return {
        includeStoreProvider = false, 
        store = nil, 
        topLevelReducer = nil, 
        initialStoreState = nil, 
        includeStyleProvider = true, 
        includeLocalizationProvider = true, 
        includeNavigationProvider = false, 
        includeAppPolicyProvider = true, 
        includeFocusControllerProvider = false, 
        focusController = nil, 
        captureFocusOnMount = false, 
        includeContentProvider = false, 
        middlewareList = nil, 
        policyFactory = nil, 
        appPolicy = nil, 
        appStyle = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham
        }, 
        localization = {}, 
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
            getParam = function()
                return nil;
            end, 
            navigate = function()
            end, 
            state = {
                routeName = "DummyRoute"
            }
        }
    };
end;
assert(v13((v14())));
local function v16(v15)
    return v15;
end;
return function(v17, v18)
    assert(v17, "Expected a map of components, received none");
    local v19 = v14();
    if v18 then
        assert(v13(v18));
        v19 = v1.join(v19, v18);
    end;
    if v19.includeStoreProvider then
        local v20 = {
            v5.thunkMiddleware
        };
        if v19.middlewareList then
            v1.append(v20, v19.middlewareList);
        end;
        local v21 = v19.topLevelReducer or v16;
        local _ = nil;
        v17 = {
            StoreProvider = v2.createElement(v4.StoreProvider, {
                store = if not v19.store then if v19.initialStoreState then v5.Store.new(v21, v19.initialStoreState, v20) else v5.Store.new(v21, nil, v20) else v19.store
            }, v17)
        };
    end;
    if v19.includeAppPolicyProvider then
        v17 = {
            PolicyProvider = v2.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0, 
                    v19.policyFactory or function()
                        return {};
                    end
                }, 
                policyData = v19.appPolicy
            }, v17)
        };
    end;
    if v19.includeStyleProvider then
        v17 = {
            StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                style = v19.appStyle
            }, v17)
        };
    end;
    if v19.includeNavigationProvider then
        v17 = {
            NavigationProvider = v2.createElement(v3.Provider, {
                value = v19.navigation
            }, v17)
        };
    end;
    local v23 = v2.createElement("Folder", {}, v17);
    if v19.includeContentProvider then
        v23 = v2.createElement(v6.App.Context.ContentProvider.Provider, {
            value = l_MockContentProvider_0.new()
        }, v23);
    end;
    return v23;
end;
