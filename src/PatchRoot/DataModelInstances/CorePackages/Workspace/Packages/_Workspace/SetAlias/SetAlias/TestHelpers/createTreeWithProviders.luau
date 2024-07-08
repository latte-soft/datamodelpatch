local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.devDependencies);
local v3 = require(l_Parent_0.Analytics);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Rodux_0 = v1.Rodux;
local l_UIBlox_0 = v1.UIBlox;
local l_LocalizationProvider_0 = v1.LocalizationProvider;
local v9 = v2.Mock.MagicMock.new({
    name = "Localization"
});
v9.Format = function(_, v11, _)
    return v11;
end;
local v13 = l_Rodux_0.Store.new(function()
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v14, v15)
    return (l_Roact_0.createFragment({
        storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v15.store or v13
        }, {
            styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                localizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                    localization = v9
                }, {
                    analyticsProvider = l_Roact_0.createElement(v3.Context.Provider, {
                        value = v15.mockAnalytics or {}
                    }, {
                        myElement = l_Roact_0.createElement(v14, v15.props)
                    })
                })
            })
        })
    }));
end;
