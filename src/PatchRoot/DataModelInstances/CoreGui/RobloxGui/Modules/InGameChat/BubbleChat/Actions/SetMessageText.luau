local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.ExperienceChat);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_makeActionCreator_0 = require(l_CorePackages_0.Rodux).makeActionCreator;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(script.Parent.Parent.Helpers.maybeAssert);
local v6 = require(l_RobloxGui_0.Modules.Flags.GetFFlagConsolidateBubbleChat);
local v7 = v4.tuple(v4.string, v4.string);
return l_makeActionCreator_0(script.Name, function(v8, v9)
    v5(v7(v8, v9));
    if v6() then
        local l_Events_0 = v1.Events;
        if l_Events_0.LegacyBubbleTextUpdated ~= nil then
            l_Events_0.LegacyBubbleTextUpdated(v8, v9);
        end;
    end;
    return {
        messageId = v8, 
        newText = v9
    };
end);
