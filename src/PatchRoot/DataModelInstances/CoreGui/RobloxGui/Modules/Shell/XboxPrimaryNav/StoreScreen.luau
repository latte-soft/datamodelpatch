local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_StoreScreenBase_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("StoreScreenBase"));
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local _ = game:GetService("UserInputService");
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function()
    local v7 = l_BaseScreen_0(true);
    local function _()
        return l_StoreScreenBase_0(v7);
    end;
    v7.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("StoreScreenId")
        };
    end;
    v7.GetDefaultSelectionObject = function(_)
        return v7.view and v7.view:GetDefaultSelectionObject();
    end;
    v7.GetId = function(_)
        return l_Analytics_0.TabNames("StoreId");
    end;
    v7.view = l_StoreScreenBase_0(v7);
    v7:SetTitle(l_LocalizedStrings_0:LocalizedString("CatalogWord"));
    return v7;
end;
