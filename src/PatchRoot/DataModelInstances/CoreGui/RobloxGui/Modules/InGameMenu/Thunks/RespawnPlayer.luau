local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Thunks.CloseMenu);
local v3 = require(l_Parent_0.Actions.SetRespawning);
local v4 = require(l_Parent_0.Utility.SendAnalytics);
local v5 = require(l_Parent_0.Resources.Constants);
return function(v6)
    local v7 = v6:getState();
    if v7.respawn.enabled then
        if not v7.respawn.customCallback then
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            if l_Character_0 ~= nil then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if not (not (l_Humanoid_0 ~= nil) or not l_Humanoid_0:IsA("Humanoid")) then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        else
            v7.respawn.customCallback:Fire();
        end;
    end;
    v6:dispatch(v3(false));
    v6:dispatch(v2);
    v4(v5.AnalyticsInGameMenuName, v5.AnalyticsRespawnCharacterName, {
        confirmed = v5.AnalyticsConfirmedName
    });
end;
