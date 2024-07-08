local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Packages.Promise);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v4 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
return function()
    v3:showPrompt(v4.None);
    v1.delay(0.016666666666666666):andThen(function()
        v3:showPrompt(v4.VideoNoPermission);
    end);
end;
