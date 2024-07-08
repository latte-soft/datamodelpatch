local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.devDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Rodux_0 = v1.Rodux;
local l_UIBlox_0 = v1.UIBlox;
local l_LocalizationProvider_0 = v1.LocalizationProvider;
local v8 = v2.Mock.MagicMock.new({
    name = "Localization"
});
v8.Format = function(_, v10, _)
    return v10;
end;
local v12 = l_Rodux_0.Store.new(function()
    return {};
end, {}, {
    l_Rodux_0.thunkMiddleware
});
return function(v13, v14)
    return (l_Roact_0.createFragment({
        storeProvider = l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v14.store or v12
        }, {
            styleProvider = l_Roact_0.createElement(l_UIBlox_0.App.Style.AppStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                localizationProvider = l_Roact_0.createElement(l_LocalizationProvider_0, {
                    localization = v8
                }, {
                    myElement = l_Roact_0.createElement(v13, v14.props)
                })
            })
        })
    }));
end;
