local l_Players_0 = game:GetService("Players");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager);
game:DefineFastInt("EnableNewInviteMenuStyleRollout", 0);
game:DefineFastFlag("EnableNewInviteMenuStyle", false);
return function()
    if l_Players_0.LocalPlayer then
        if not game:GetFastFlag("EnableNewInviteMenuStyle") then
            if l_Players_0.LocalPlayer.UserId % 100 < game:GetFastInt("EnableNewInviteMenuStyleRollout") then
                return true;
            else
                return v1.default:getStyleEnabled();
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
