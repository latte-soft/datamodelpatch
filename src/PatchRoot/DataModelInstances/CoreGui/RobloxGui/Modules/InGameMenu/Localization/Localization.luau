local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Locales_0 = script.Parent.Locales;
local v3 = require(script.Parent.LocalizationContext);
if not require(l_RobloxGui_0.Modules.Flags.GetFFlagSwitchInExpTranslationsPackage)() then
    local function v10(v4)
        local v5 = v3.getRelevantLanguages(v4);
        local v6 = {};
        for _, v8 in ipairs(v5) do
            local l_l_Locales_0_FirstChild_0 = l_Locales_0:FindFirstChild(v8);
            if l_l_Locales_0_FirstChild_0 then
                v6[v8] = require(l_l_Locales_0_FirstChild_0);
            end;
        end;
        return v6;
    end;
    local v11 = {};
    v11.__index = v11;
    v11.new = function(v12)
        local v13 = {
            locale = v12
        };
        setmetatable(v13, {
            __index = v11
        });
        v13.localizationContext = v3.new((v10(v12)));
        return v13;
    end;
    v11.mock = function()
        return v11.new("en-us");
    end;
    v11.SetLocale = function(v14, v15)
        v14.locale = v15;
        v14.localizationContext:addTranslations((v10(v15)));
    end;
    v11.GetLocale = function(v16)
        return v16.locale;
    end;
    v11.Format = function(v17, v18, v19)
        if not v18 then
            error("ERROR: NO STRING FOR KEY");
        end;
        return v17.localizationContext:getString(v17.locale, v18, v19);
    end;
    return v11;
else
    return require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
end;
