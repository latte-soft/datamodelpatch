local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_RoundingBehaviour_0 = require(l_CorePackages_0.Workspace.Packages.Localization).RoundingBehaviour;
return function(v4)
    if v4 == nil then
        return "-";
    elseif type(v4) == "number" then
        if not (tostring(v4):len() >= 7) then
            return l_NumberLocalization_0.localize(v4, l_LocalizationService_0.RobloxLocaleId);
        else
            return l_NumberLocalization_0.abbreviate(v4, l_LocalizationService_0.RobloxLocaleId, l_RoundingBehaviour_0.Truncate);
        end;
    else
        return (tostring(v4));
    end;
end;
