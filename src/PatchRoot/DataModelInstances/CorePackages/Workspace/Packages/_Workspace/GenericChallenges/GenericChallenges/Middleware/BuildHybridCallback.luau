local v0 = require(script:FindFirstAncestor("GenericChallenges").Types.JavascriptHybrid);
local l_HttpService_0 = game:GetService("HttpService");
return function(v2)
    return function(v3)
        local v4 = l_HttpService_0:JSONDecode(v3);
        if not (not (v4.moduleID == v0.Module.Navigation and v4.functionName == v0.Function.navigateToFeature) or not v4.params) and v4.params.params then
            local l_params_0 = v4.params.params;
            if l_params_0.feature == v0.Feature.ChallengeParsed and l_params_0.data.parsed == false then
                v2.OnChallengeLoadFailed(l_params_0);
                return ;
            elseif l_params_0.feature == v0.Feature.ChallengeInitialized and l_params_0.data.initialized == false then
                v2.OnChallengeLoadFailed(l_params_0);
                return ;
            else
                for _, v7 in v2.Hooks, nil, nil do
                    if v7(l_params_0) then
                        return ;
                    end;
                end;
                if l_params_0.feature == v0.Feature.ChallengeCompleted then
                    v2.OnChallengeCompleted(l_params_0);
                    return ;
                elseif l_params_0.feature == v0.Feature.ChallengeInvalidated then
                    v2.OnChallengeInvalidated(l_params_0);
                    return ;
                else
                    if v4.params.params.feature == v0.Feature.ChallengeDisplayed and v2.OnChallengeDisplayed ~= nil then
                        v2.OnChallengeDisplayed(l_params_0);
                    end;
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
end;
