local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common.renderWithCoreScriptsStyleProvider);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Rodux);
local v5 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.UIBlox);
local v7 = require(script.Components.AvatarEditorPromptsApp);
local v8 = require(script.Reducer);
local v9 = require(script.Thunks.GetGameName);
local v10 = require(script.AvatarEditorPromptsPolicy);
local v11 = require(script.RoactGlobalConfig);
local v12 = require(script.ConnectAvatarEditorServiceEvents);
local v13 = {};
v13.__index = v13;
v13.new = function()
    local v14 = setmetatable({}, v13);
    if v11.propValidation then
        v3.setGlobalConfig({
            propValidation = true
        });
    end;
    if v11.elementTracing then
        v3.setGlobalConfig({
            elementTracing = true
        });
    end;
    v14.store = v4.Store.new(v8, nil, {
        v4.thunkMiddleware
    });
    v14.store:dispatch(v9);
    v14.root = v3.createElement(v5.StoreProvider, {
        store = v14.store
    }, {
        PolicyProvider = v3.createElement(v10.Provider, {
            policy = {
                v10.Mapper
            }
        }, {
            ThemeProvider = v2({
                AvatarEditorPromptsApp = v3.createElement(v7)
            })
        })
    });
    v14.element = v3.mount(v14.root, l_CoreGui_0, "AvatarEditorPrompts");
    v14.serviceConnections = v12(v14.store);
    return v14;
end;
return v13.new();
