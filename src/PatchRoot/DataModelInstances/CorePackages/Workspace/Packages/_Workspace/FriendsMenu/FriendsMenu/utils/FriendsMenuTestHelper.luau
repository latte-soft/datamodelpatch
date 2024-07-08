local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.Dev.RoactServices).RoactServices;
local l_AppStyleProvider_0 = require(l_Parent_0.Style).AppStyleProvider;
local l_Constants_0 = require(l_Parent_0.Style).Constants;
local v7 = {
    themeName = l_Constants_0.ThemeName.Dark, 
    fontName = l_Constants_0.FontName.Gotham
};
local v8 = {
    ScreenSize = Vector2.new(500, 500), 
    SetAlias = {
        Aliases = {
            byUserId = {
                ["1"] = "foo"
            }
        }
    }
};
local function v12(v9, v10)
    return v2.Store.new(v10 or function(v11)
        return v11;
    end, v9 or {}, {
        v2.thunkMiddleware
    });
end;
return {
    mockServices = function(v13, v14)
        return (v1.createElement(l_RoactServices_0.ServiceProvider, {}, {
            storeProvider = v1.createElement(v3.StoreProvider, {
                store = v14 or v12(v8)
            }, {
                styleProvider = v1.createElement(l_AppStyleProvider_0, {
                    style = v7
                }, v13)
            })
        }));
    end, 
    mockStore = v12
};
