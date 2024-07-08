local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_LuaApp_0 = l_CoreGui_0.RobloxGui.Modules.LuaApp;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_LuaApp_0.TestHelpers.mockServices);
local v6 = require(l_LuaApp_0.Components.Authentication.LoginView);
local function _(v7, v8, v9)
    return v5(v7, {
        includeThemeProvider = true, 
        includeAppPolicyProvider = true, 
        includeStoreProvider = true, 
        store = v8, 
        extraServices = v9
    });
end;
return function(v11, v12, v13)
    local v14 = v4.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        LoginView = v5({
            LoginView = v4.createElement(v6)
        }, {
            includeThemeProvider = true, 
            includeAppPolicyProvider = true, 
            includeStoreProvider = true, 
            store = v12, 
            extraServices = v13
        })
    });
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = l_HttpService_0:GenerateGUID();
    l_Folder_0.Parent = l_CoreGui_0;
    local v16 = v4.mount(v14, l_Folder_0, "TestRoot");
    local l_status_0, l_result_0 = pcall(function()
        v11(l_Folder_0:FindFirstChildOfClass("ScreenGui"):GetChildren()[1]);
    end);
    v4.unmount(v16);
    if not l_status_0 then
        error(l_result_0);
    end;
end;
