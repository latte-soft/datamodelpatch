local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Locales_0 = l_Shell_0.Locales;
local v5 = require(l_Locales_0:FindFirstChild("en-us"));
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages:FindFirstChild("RobloxAppLocales")).Localization;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("LocalizationService").RobloxLocaleId;
end);
v8 = l_status_0;
v9 = l_result_0;
l_status_0 = {
    GetLocale = function(_)
        local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v9);
        if not (not v8 or not l_l_Locales_0_FirstChild_0) then
            v7 = require(l_l_Locales_0_FirstChild_0);
        end;
        if v7 == nil then
            v7 = v5;
        end;
        return v7;
    end, 
    LocString = function(v15, v16)
        local v17 = not not v7 and v7 or v15:GetLocale();
        local v18 = v17 and v17[v16];
        if not v18 then
            l_Utility_0.DebugLog("LocalizedString: Could not find string for:", v16, "using locale:", v17);
            v18 = v5[v16] or v16;
        end;
        return v18;
    end
};
l_status_0.LocalizedString = function(_, v20)
    return l_status_0:LocString("Xbox.Old." .. v20);
end;
l_status_0.LocStringUA = function(_, v22)
    if not v8 or v10 then
        v10 = l_Localization_0.new("en-us");
    else
        v10 = l_Localization_0.new(v9);
    end;
    local v23 = v10.localizationContext:getString(v9, v22);
    if not v23 then
        l_Utility_0.DebugLog("LocalizedStringUA: Could not find string for:", v22, "using locale:", v9);
        v23 = v22;
    end;
    return v23;
end;
return l_status_0;
