local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSearch").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Rodux);
local l_DesignTokenProvider_0 = require(l_Parent_0.Style).DesignTokenProvider;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v7 = {
    themeName = "dark", 
    fontName = "gotham"
};
local function v10()
    return {
        Format = function(_, v9)
            return v9 .. "-translated";
        end, 
        GetLocale = function()
            return "locale";
        end
    };
end;
local function v11()
    return v3.Store.new(v3.createReducer({}, {}));
end;
return function(v12)
    local v13 = v12.store or v11();
    local v14 = v12.localization or v10();
    return function(v15)
        return v2.createElement(l_LocalizationProvider_0, {
            localization = v14
        }, {
            StyleProvider = v2.createElement(l_AppStyleProvider_0, {
                style = v7
            }, {
                StoreProvider = v2.createElement(v1.StoreProvider, {
                    store = v13
                }, {
                    DesignTokenProvider = v2.createElement(l_DesignTokenProvider_0, {
                        tokenMappers = {}
                    }, {
                        TestSubject = v15.children
                    })
                })
            })
        });
    end;
end;
