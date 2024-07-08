local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_localizeStrings_0 = require(l_Parent_0.Localization).localizeStrings;
return function(v4)
    local v5 = "Feature.AccountSettings.Heading.Tab.Security";
    if v4 ~= nil then
        v5 = v4;
    end;
    return l_localizeStrings_0(l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId), {
        title = v5
    }).title;
end;
