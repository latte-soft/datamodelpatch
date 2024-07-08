local l_script_FirstAncestor_0 = script:FindFirstAncestor("DsaIllegalContentReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Constants);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Utility.isInDSAFeaturesOverrideList);
local l_GetFFlagDSAIllegalContentReporting_0 = v3.GetFFlagDSAIllegalContentReporting;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local v8 = false;
if l_GetFFlagDSAIllegalContentReporting_0() then
    task.spawn(function()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        local l_status_0, l_result_0 = pcall(l_LocalizationService_0.GetCountryRegionForPlayerAsync, l_LocalizationService_0, l_LocalPlayer_0);
        if l_status_0 then
            for _, v13 in ipairs(v2.ELIGIBLE_COUNTRY_REGION_CODES) do
                if l_result_0 == v13 then
                    v8 = true;
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end);
end;
isShowEUDSAIllegalContentReportingLink = function()
    if not v4() then
        return l_GetFFlagDSAIllegalContentReporting_0() and v8;
    else
        return true;
    end;
end;
return isShowEUDSAIllegalContentReportingLink;
