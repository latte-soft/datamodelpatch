local l_AdService_0 = game:GetService("AdService");
local v1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Ads.AdTeleportPromptHandler);
local v2 = nil;
onPortalPrompt = function(v3, v4, v5)
    if not v2 or not v2.hasActiveWindow then
        v2 = v1.new(v4, v3);
        if v2 == nil then
            error("Error in instantiating handler for adteleportprompt.");
            return ;
        else
            assert(v2 ~= nil, "Appeasing the type checking");
            local l_status_0, l_result_0 = pcall(function()
                return v2:fetchTitle();
            end);
            if not l_status_0 or l_result_0 == nil then
                v2:rejectPrompt(false, false);
                error("Error: Marketplace service failed to get placename for ad portal prompt.");
                return ;
            else
                v2:instantiatePrompt(l_result_0, v5);
                v2:updateCreateTime();
                return ;
            end;
        end;
    else
        return ;
    end;
end;
l_AdService_0.PortalPrompt:Connect(onPortalPrompt);
