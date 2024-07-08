local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.IXPServiceWrapper);
local l_Players_0 = game:GetService("Players");
local v2 = {
    enabled = true, 
    inSortingExperiment = false, 
    inEntryExperiment = false
};
if game:DefineFastFlag("EnableReportAbuseMenuLayerOnV3", false) then
    local v3 = game:DefineFastString("ReportAbuseMenuLayerOnV3Layer", "Social.VoiceAbuseReport.ReportAbuseMenu.V1");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v5 = 0;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        v5 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
    end;
    v0:InitializeAsync(v5, v3);
    local l_v0_LayerData_0 = v0:GetLayerData(v3);
    if not l_v0_LayerData_0 then
        v2.enabled = false;
    else
        v2.inSortingExperiment = l_v0_LayerData_0.VoiceAbuseReportProximitySort;
        v2.inEntryExperiment = l_v0_LayerData_0.VoiceAbuseReportSmartEntry;
        v2.enabled = not l_v0_LayerData_0.VoiceAbuseReportDisabled;
        return v2;
    end;
end;
return v2;
