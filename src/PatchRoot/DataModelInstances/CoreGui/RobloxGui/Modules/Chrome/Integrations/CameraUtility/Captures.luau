local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(script.Parent.Parent.Parent.Service);
local v4 = require(script.Parent.Parent.CommonIcon);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_MappedSignal_0 = require(script.Parent.Parent.Parent.Service.ChromeUtils).MappedSignal;
local l_GetFFlagEnableScreenshotUtility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility;
local v8 = false;
local v9 = l_Signal_0.new();
local v10 = l_MappedSignal_0.new(v9, function()
    return v8;
end);
task.defer(function()
    local v11 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v11.CurrentPageSignal:connect(function(v12)
        v8 = v12 == v11.Instance.ShotsPage.Page.Name;
        v9:fire();
    end);
end);
return not not l_GetFFlagEnableScreenshotUtility_0() and v3:register({
    initialAvailability = v3.AvailabilitySignal.Available, 
    id = "captures", 
    label = "Feature.SettingsHub.Label.MyCaptures", 
    activated = function(_)
        local v14 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if not v14:GetVisibility() then
            v14:SetVisibility(true, false, v14.Instance.ShotsPage);
            return ;
        elseif not v8 then
            v14:SwitchToPage(v14.Instance.ShotsPage, true);
            return ;
        else
            v14:SetVisibility(false);
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v4("icons/common/image-off", "icons/common/image-on", v10);
        end
    }
}) or nil;
