local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.React);
local l_Toast_0 = require(l_Parent_0.UIBlox).App.Dialog.Toast;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v8 = nil;
local function v10(v9)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        StyleProvider = v2.createElement(l_StyleProviderWithDefaultTheme_0, {}, {
            ToastWrapper = v2.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                ResetOnSpawn = false, 
                DisplayOrder = 7
            }, {
                Toast = v2.createElement(l_Toast_0, {
                    duration = 3, 
                    toastContent = v9
                })
            })
        })
    });
end;
return function(v11)
    if not v8 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "UIBloxToast";
        l_Folder_0.Parent = game.CoreGui;
        v8 = v1.createRoot(l_Folder_0);
    end;
    v8:render(v2.createElement(v10, v11));
end;
