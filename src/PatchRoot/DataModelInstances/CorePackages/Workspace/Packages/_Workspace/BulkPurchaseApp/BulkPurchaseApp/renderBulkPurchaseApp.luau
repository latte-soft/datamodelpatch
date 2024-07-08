local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.ReactRoblox);
local v6 = require(l_Parent_0.RoactRodux);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.HttpRequest);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local v13 = require(l_Parent_0.ReactFocusNavigation);
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local v15 = require(l_Parent_0.UIBlox);
local l_SelectionCursorProvider_0 = v15.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v15.App.SelectionCursor.CursorProvider;
local v18 = require(l_script_FirstAncestor_0.BulkPurchaseApp);
local v19 = require(l_script_FirstAncestor_0.Store.Reducers.BulkPurchaseReducer);
local v20 = require(l_script_FirstAncestor_0.Hooks.NetworkContext);
local v21 = {
    themeName = "dark", 
    fontName = "gotham"
};
local function _()
    return v13.FocusNavigationService.new(v13.EngineInterface.CoreGui);
end;
local function v26()
    return v8.config({
        requestFunction = function(v23, v24, v25)
            return (v8.requestFunctions.HttpRbxApi(v23, v24, v25));
        end, 
        maxRetryCount = game:DefineFastInt("BulkPurchaseMaxHttpRequestRetries", 2), 
        maxWaitTime = game:DefineFastInt("BulkPurchaseMaxHttpRequestWaitTime", 1)
    });
end;
local function _()
    return v4.Store.new(v19, nil, {
        v4.makeThunkMiddleware()
    });
end;
return function()
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "BulkPurchaseApp";
    l_Folder_0.Parent = l_CoreGui_0;
    local v29 = v7.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        v7.createElement(l_AppStyleProvider_0, {
            style = v21
        }, {
            NetworkProvider = v7.createElement(v20.Provider, {
                value = v26()
            }, {
                StoreProvider = v7.createElement(v6.StoreProvider, {
                    store = v4.Store.new(v19, nil, {
                        v4.makeThunkMiddleware()
                    })
                }, {
                    DesignTokenProvider = v7.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        CursorProvider = v7.createElement(l_SelectionCursorProvider_0, {}, {
                            NewCursorProvider = v7.createElement(l_CursorProvider_0, {}, {
                                FocusNavigationProvider = v7.createElement(v13.FocusNavigationContext.Provider, {
                                    value = v13.FocusNavigationService.new(v13.EngineInterface.CoreGui)
                                }, {
                                    FocusNavigationRegistryProvider = v7.createElement(l_Provider_0, nil, {
                                        BulkPurchaseApp = v7.createElement(v18)
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    });
    local v30 = v5.createRoot(l_Folder_0);
    v30:render(v29);
    return v30;
end;
