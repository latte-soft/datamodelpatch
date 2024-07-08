local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(game.CoreGui.RobloxGui.Modules.LuaApp.TestHelpers.mockServices);
local function v7(v8, v9)
    v9 = v9 or "";
    if v8 == nil then
        print(v9 .. "[nil Instance]");
        return ;
    else
        print(v9 .. v8.Name);
        v9 = v9 .. "  ";
        for _, v11 in ipairs(v8:GetChildren()) do
            v7(v11, v9);
        end;
        return ;
    end;
end;
return function(v12, v13, v14, v15, v16, v17)
    v15 = v15 or {};
    local v18 = {
        includeStoreProvider = true, 
        includeThemeProvider = true, 
        includeDesignTokenProvider = true, 
        includeStyleProvider = true, 
        includeAppPolicyProvider = true, 
        initialStoreState = v14, 
        extraServices = v16
    };
    if v17 then
        v18 = v5.Dictionary.join(v18, v17);
    end;
    local v19 = v4.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        [tostring(v13)] = v6({
            Root = v4.createElement(v13, v15)
        }, v18)
    });
    local v20 = "Test-" .. l_HttpService_0:GenerateGUID(false);
    local v21 = v4.mount(v19, l_CoreGui_0, v20);
    local v22 = ("game.CoreGui.%s.*"):format(v20);
    if v18.includeFocusControllerProvider then
        v22 = v22 .. ".*";
    end;
    local l_status_0, l_result_0 = pcall(function()
        v12(v22);
    end);
    if not l_status_0 then
        print("Test instance tree:\n");
        v7(l_CoreGui_0:FindFirstChild(v20));
        print();
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if l_SelectedCoreObject_0 then
            print("SelectedCoreObject: " .. l_SelectedCoreObject_0:GetFullName() .. "\n\n");
        end;
    end;
    v4.unmount(v21);
    if not l_status_0 then
        error(l_result_0);
    end;
end;
