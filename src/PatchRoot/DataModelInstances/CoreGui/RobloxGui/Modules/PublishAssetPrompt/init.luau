local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(script.Parent.Common.renderWithCoreScriptsStyleProvider);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(script.Components.PublishAssetPromptApp);
local v7 = require(script.Reducer);
local v8 = require(script.ConnectAssetServiceEvents);
local v9 = {};
v9.__index = v9;
v9.new = function()
    local v10 = setmetatable({}, v9);
    v10.store = v4.Store.new(v7, nil, {
        v4.thunkMiddleware
    });
    v10.root = v3.createElement(v5.StoreProvider, {
        store = v10.store
    }, {
        ThemeProvider = v2({
            PublishAssetPromptApp = v3.createElement(v6)
        })
    });
    v10.element = v3.mount(v10.root, l_CoreGui_0, "PublishAssetPrompt");
    v10.serviceConnections = v8(v10.store);
    return v10;
end;
return v9.new();
