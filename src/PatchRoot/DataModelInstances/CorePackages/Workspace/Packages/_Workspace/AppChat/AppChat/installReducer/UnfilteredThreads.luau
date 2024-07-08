local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = {
    eligibility = {}
};
local v5 = {
    age_failure = "isAgeEligible", 
    phone_verification_failure = "isPhoneVerificationEligible", 
    ixp_failure = "isIXPEligible", 
    rollout_failure = "isRolloutEligible"
};
return v2.createReducer(v4, {
    [v3.rodux.GetUnfilteredThreadEligibility.Succeeded.name] = function(v6, v7)
        local l_responseBody_0 = v7.responseBody;
        local v9 = {
            isFullyEligible = l_responseBody_0.is_fully_eligible, 
            isAgeEligible = true, 
            isPhoneVerificationEligible = true, 
            isIXPEligible = true, 
            isRolloutEligible = true
        };
        if not l_responseBody_0.is_fully_eligible then
            for _, v11 in ipairs(l_responseBody_0.failure_reasons) do
                local v12 = v5[v11];
                if v12 then
                    v9[v12] = false;
                end;
            end;
        end;
        return v1.Dictionary.join(v6, {
            eligibility = v9
        });
    end, 
    [v3.rodux.GetUnfilteredThreadsFtuxModal.Succeeded.name] = function(v13, v14)
        return v1.Dictionary.join(v13, {
            ftuxModalVariant = v14.responseBody.modal_variant
        });
    end
});
