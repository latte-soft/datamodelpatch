local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout);
return function()
    return not not (v6() and v7((l_useLocalUserId_0()))) and l_useSelector_0((v2.useCallback(function(v8)
        return v8.AccountSecurityPrompt and v8.AccountSecurityPrompt.promptType;
    end, {}))) ~= nil or v5();
end;
