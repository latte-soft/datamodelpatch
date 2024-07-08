local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Experiment.useUserExperiment);
local v6 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v7 = require(l_CorePackages_0.Packages.React);
local l_GetFFlagEnableNewExperienceMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNewExperienceMenuLayer;
local l_GetFFlagEnableInGameMenuChromeABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInGameMenuChromeABTest;
local l_GetFFlagEnableMenuModernizationABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMenuModernizationABTest;
game:DefineFastFlag("EnableV3MenuABTest3", false);
game:DefineFastFlag("EnableMenuControlsABTest", false);
local function v11()
    return game:GetEngineFeature("ExperienceMenuABTest") and (((game:GetFastFlag("EnableV3MenuABTest3") or game:GetFastFlag("EnableMenuControlsABTest")) or l_GetFFlagEnableMenuModernizationABTest_0()) or l_GetFFlagEnableInGameMenuChromeABTest_0());
end;
local function _(v12)
    pcall(function()
        if v12 ~= l_AppStorageService_0:GetItem("ExperienceMenuVersion") then
            l_AppStorageService_0:SetItem("ExperienceMenuVersion", v12 or "");
            l_AppStorageService_0:Flush();
        end;
    end);
end;
ExperienceMenuIXPPreload = function(_)
    if v11() then
        local v15 = nil;
        v15 = if not l_GetFFlagEnableNewExperienceMenuLayer_0() then v5({
            v6.ExperienceMenuLayer
        }, function(v16)
            return not not v16[v6.ExperienceMenuLayer] and v16[v6.ExperienceMenuLayer].menuVersion or "";
        end) else v5({
            v6.ExperienceMenuLayer, 
            v6.ConsoleExperienceMenuLayer
        }, function(v17)
            if not v17[v6.ExperienceMenuLayer] or not v17[v6.ExperienceMenuLayer].menuVersion then
                if not v17[v6.ConsoleExperienceMenuLayer] or not v17[v6.ConsoleExperienceMenuLayer].menuVersion then
                    return "";
                else
                    return v17[v6.ConsoleExperienceMenuLayer].menuVersion;
                end;
            else
                return v17[v6.ExperienceMenuLayer].menuVersion;
            end;
        end);
        do
            local l_v15_0 = v15;
            v7.useEffect(function()
                local l_l_v15_0_0 = l_v15_0;
                pcall(function()
                    if l_l_v15_0_0 ~= l_AppStorageService_0:GetItem("ExperienceMenuVersion") then
                        l_AppStorageService_0:SetItem("ExperienceMenuVersion", l_l_v15_0_0 or "");
                        l_AppStorageService_0:Flush();
                    end;
                end);
            end, {
                l_v15_0
            });
        end;
    end;
    return nil;
end;
return ExperienceMenuIXPPreload;
