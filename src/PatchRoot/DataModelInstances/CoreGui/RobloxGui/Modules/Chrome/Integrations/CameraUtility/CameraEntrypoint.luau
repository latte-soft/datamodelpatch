local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = require(script.Parent.Parent.Parent.Service);
local v3 = require(script.Parent.Parent.CommonIcon);
local v4 = require(script.Parent.Parent.Parent.Service.ChromeUtils);
local v5 = require(script.Parent.Parent.Parent.Flags.GetFFlagChromeCapturesToggle);
local v8 = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableScreenshotUtility() and v2:register({
    initialAvailability = v2.AvailabilitySignal.Available, 
    id = "camera_entrypoint", 
    label = "Feature.SettingsHub.Label.Captures", 
    activated = function(_)
        v2:toggleCompactUtility("camera_utility");
    end, 
    components = {
        Icon = function(_)
            return v3("icons/controls/cameraOff");
        end
    }
}) or nil;
if v5() then
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v9, _)
        if not (v9 ~= Enum.CoreGuiType.All) or v9 == Enum.CoreGuiType.Captures then
            local l_v8_0 = v8;
            if l_v8_0 == nil then
                return ;
            else
                v4.setCoreGuiAvailability(l_v8_0, v9, function(v12)
                    local l_availability_0 = l_v8_0.availability;
                    if not v12 then
                        if v2:getCurrentUtility():get() == "camera_utility" then
                            v2:toggleCompactUtility("camera_utility");
                        end;
                        l_availability_0:unavailable();
                        return ;
                    else
                        l_availability_0:available();
                        return ;
                    end;
                end);
            end;
        end;
    end);
end;
return v8;
