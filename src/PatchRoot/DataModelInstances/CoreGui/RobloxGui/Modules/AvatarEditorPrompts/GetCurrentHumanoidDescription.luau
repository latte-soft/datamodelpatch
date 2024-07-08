local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Promise);
return function()
    return v2.new(function(v3, v4)
        local l_status_0, l_result_0 = pcall(function()
            return l_Players_0:GetHumanoidDescriptionFromUserId(l_Players_0.LocalPlayer.UserId);
        end);
        if not l_status_0 then
            v4();
            return ;
        else
            v3(l_result_0);
            return ;
        end;
    end);
end;
