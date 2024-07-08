local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.devDependencies);
local l_Dash_0 = v1.Dash;
local l_LocalizationProvider_0 = v1.LocalizationProvider;
local l_Mock_0 = v2.Mock;
local l_React_0 = v1.React;
local l_Rodux_0 = v1.Rodux;
local l_createTreeWithProviders_0 = v2.UnitTestHelpers.createTreeWithProviders;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v11 = require(l_Parent_0.Analytics);
local v12 = l_Rodux_0.Store.new(l_Rodux_0.combineReducers({
    InvisibleMode = require(l_Parent_0.installReducer)()
}), {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v13, v14)
    local v15 = l_Mock_0.MagicMock.new({
        name = "Localization"
    });
    v15.Format = function(_, v17, _)
        return v17;
    end;
    local l_noop_0 = l_Dash_0.noop;
    local l_v12_0 = v12;
    if v14 then
        if v14.fireEvent then
            l_noop_0 = v14.fireEvent;
        end;
        if v14.store then
            l_v12_0 = v14.store;
        end;
    end;
    return l_createTreeWithProviders_0(function()
        return l_React_0.createElement(v11.Context.Provider, {
            value = {
                fireEvent = l_noop_0
            }
        }, {
            StyleProvider = l_withStyle_0(function(v21)
                return l_React_0.createElement(l_UIBlox_0.Style.Provider, {
                    style = l_Dash_0.join(v21, {
                        Theme = l_Dash_0.join(v21.Theme, {
                            OfflineStatus = {
                                Color = Color3.fromRGB(1, 1, 1)
                            }, 
                            OnlineStatus = {
                                Color = Color3.fromRGB(0, 255, 0)
                            }
                        })
                    })
                }, {
                    localizationProvider = l_React_0.createElement(l_LocalizationProvider_0, {
                        localization = v15
                    }, {
                        child = v13
                    })
                });
            end)
        });
    end, {
        store = l_v12_0
    });
end;
