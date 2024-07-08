local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v8 = require(l_script_FirstAncestor_0.Hooks.NetworkContext);
local v9 = require(l_script_FirstAncestor_0.Hooks.ScreenSizeContext);
local v10 = {
    themeName = "dark", 
    fontName = "gotham"
};
local function v13()
    return {
        Format = function(_, v12)
            return v12 .. "-translated";
        end, 
        GetLocale = function()
            return "locale";
        end
    };
end;
local function v14()
    return v4.Store.new(v4.createReducer({}, {}));
end;
return function(v15)
    local v16 = v15.store or v14();
    local v17 = v15.network or {};
    local v18 = v15.localization or v13();
    local v19 = v15.screenSize or Vector2.new(1000, 1000);
    return function(v20)
        return v3.createElement(l_LocalizationProvider_0, {
            localization = v18
        }, {
            StyleProvider = v3.createElement(l_AppStyleProvider_0, {
                style = v10
            }, {
                NetworkProvider = v3.createElement(v8.Provider, {
                    value = v17
                }, {
                    StoreProvider = v3.createElement(v2.StoreProvider, {
                        store = v16
                    }, {
                        DesignTokenProvider = v3.createElement(l_DesignTokenProvider_0, {
                            tokenMappers = {}
                        }, v3.createElement(v9.Provider, {
                            value = v19
                        }, {
                            TestSubject = v20.children
                        }))
                    })
                })
            })
        });
    end;
end;
