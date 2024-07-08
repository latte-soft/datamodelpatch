if not game:GetEngineFeature("ExperienceServiceEnabled") then
    return nil;
else
    local l_ExperienceService_0 = game:GetService("ExperienceService");
    return {
        LaunchExperience = function(_, v2, v3, v4)
            if v3 ~= nil then
                if v4 ~= nil then
                    l_ExperienceService_0:LaunchExperienceFromSourceWithCallback(v2, v3, v4);
                    return ;
                else
                    l_ExperienceService_0:LaunchExperienceFromSource(v2, v3);
                    return ;
                end;
            elseif v4 ~= nil then
                l_ExperienceService_0:LaunchExperienceFromSourceWithCallback(v2, "", v4);
                return ;
            else
                l_ExperienceService_0:LaunchExperience(v2);
                return ;
            end;
        end, 
        RegisterForExperienceJoin = function(_, v6)
            l_ExperienceService_0:RegisterForExperienceJoin(v6);
        end, 
        RegisterForExperienceLeave = function(_, v8)
            l_ExperienceService_0:RegisterForExperienceLeave(v8);
        end, 
        GetPendingJoinAttempt = function(_)
            return l_ExperienceService_0:GetPendingJoinAttempt();
        end, 
        OnNewJoinAttempt = function(_)
            return l_ExperienceService_0.OnNewJoinAttempt;
        end
    };
end;
