local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Promise);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Flags.GetFIntCanHideGuiGroupId);
return function(_, v4, _)
    return v1.new(function(v6, v7)
        if game:GetEngineFeature("GuiHidingApiSupport") then
            if v4 then
                local v8 = false;
                local l_status_0, l_result_0 = pcall(function()
                    v8 = v4:IsInGroup((v2()));
                end);
                if not l_status_0 then
                    v7(l_result_0);
                else
                    v6(v8);
                end;
                return ;
            else
                v7("Invalid local player");
                return ;
            end;
        else
            v6(false);
            return ;
        end;
    end);
end;
