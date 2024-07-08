local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.Style);
local v5 = require(l_Parent_0.Localization);
local l_Signal_0 = require(l_Parent_0.Dev.AppCommonLib).Signal;
local v7 = require(l_Parent_0.Dev.RoactNavigation);
local function v9(v8)
    return v8;
end;
return function(v10, v11)
    return v1.createElement(v2.StoreProvider, {
        store = v3.Store.new(v9, {}, {
            v3.thunkMiddleware
        })
    }, {
        Navigation = v1.createElement(v7.Provider, {
            value = not not v11 and v11.navigation or {
                navigate = function()
                end
            }
        }, {
            UiModeStyle = v1.createElement(v4.UiModeStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                DesignTokenProvider = v1.createElement(v4.DesignTokenProvider, {
                    tokenMappers = {}
                }, {
                    localization = v1.createElement(v5.LocalizationProvider, {
                        localization = {
                            Format = function(_, v13, _)
                                return v13;
                            end, 
                            changed = l_Signal_0.new()
                        }
                    }, {
                        child = v10
                    })
                })
            })
        })
    });
end;
