local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.dependencies);
local v4 = require(l_Parent_0.ToastNotificationWrapper);
local l_React_0 = v3.React;
local l_ReactRoblox_0 = v3.ReactRoblox;
local _ = require(l_Parent_0.type);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_1.Style).StyleProviderWithDefaultTheme;
return function(v9)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "ToastNotification";
    l_Folder_0.Parent = l_CoreGui_0;
    l_ReactRoblox_0.createRoot(l_Folder_0):render((l_React_0.createElement(l_StyleProviderWithDefaultTheme_0, {
        withUiModeSupport = false, 
        withDarkTheme = true
    }, {
        ToastNotificationWrapper = l_React_0.createElement(v4, {
            displayOrder = 13, 
            renderLocation = v9.renderLocation
        })
    })));
end;
