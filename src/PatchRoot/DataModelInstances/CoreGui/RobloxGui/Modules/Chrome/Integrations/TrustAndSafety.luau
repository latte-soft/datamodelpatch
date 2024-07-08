local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(script.Parent.Parent.Service);
local v4 = require(script.Parent.CommonIcon);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_MappedSignal_0 = require(script.Parent.Parent.Service.ChromeUtils).MappedSignal;
local v7 = false;
local v8 = l_Signal_0.new();
local v9 = l_MappedSignal_0.new(v8, function()
    return v7;
end);
task.defer(function()
    local v10 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v10.CurrentPageSignal:connect(function(v11)
        v7 = v11 == v10.Instance.ReportAbusePage.Page.Name;
        v8:fire();
    end);
end);
return v3:register({
    initialAvailability = v3.AvailabilitySignal.Available, 
    id = "trust_and_safety", 
    label = "CoreScripts.InGameMenu.QuickActions.Report", 
    activated = function(_)
        local v13 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        if not v13:GetVisibility() then
            v13:SetVisibility(true, false, v13.Instance.ReportAbusePage);
            return ;
        elseif not v7 then
            v13:SwitchToPage(v13.Instance.ReportAbusePage, true);
            return ;
        else
            v13:SetVisibility(false);
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v4("icons/menu/safety_off", "icons/menu/safety_on", v9);
        end
    }
});
