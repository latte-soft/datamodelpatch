local l_Parent_0 = script:FindFirstAncestor("ContactsToast").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Rodux);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v6 = require(l_Parent_0.LuaSocialLibrariesDeps).Mock.MagicMock.new({
    name = "Localization"
});
v6.Format = function(_, v8, _)
    return v8;
end;
local v10 = v4.Store.new(function()
    return {};
end, {}, {
    v4.thunkMiddleware
});
return function(v11, v12)
    return (v1.createFragment({
        storeProvider = v1.createElement(v2.StoreProvider, {
            store = v12.store or v10
        }, {
            styleProvider = v1.createElement(v3.App.Style.AppStyleProvider, {
                style = {
                    themeName = "Dark", 
                    fontName = "Gotham"
                }
            }, {
                localizationProvider = v1.createElement(l_LocalizationProvider_0, {
                    localization = v6
                }, {
                    myElement = v1.createElement(v11, v12.props)
                })
            })
        })
    }));
end;
