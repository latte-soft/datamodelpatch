game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1", false);
game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll", false);
game:DefineFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled", false);
game:DefineFastInt("SelfViewProfileDiscoverabilityUpsellRolloutEnabled", 0);
local v0 = require(script:FindFirstAncestor("DiscoverabilityModal").dependencies);
local l_rolloutByApplicationId_0 = v0.rolloutByApplicationId;
local l_getFStringSocialProfileLayer_0 = v0.getFStringSocialProfileLayer;
local function v3()
    return game:GetFastInt("SelfViewProfileDiscoverabilityUpsellRolloutEnabled");
end;
local function v4()
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1");
end;
local function _()
    return l_rolloutByApplicationId_0(v3)();
end;
local function _()
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled");
end;
local function _()
    return game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll");
end;
return {
    SetupEnabled = v4, 
    experimentOrRolloutEnabled = function(v8)
        if not game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPSetupEnabled_v1") then
            return false;
        else
            local v9 = v8[l_getFStringSocialProfileLayer_0()] or {
                show_discoverability_upsell_profile_view = "False"
            };
            local v10;
            if game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellIXPEnabled") then
                v10 = true;
                if not (v9.show_discoverability_upsell_profile_view ~= "True") then
                    goto label0;
                end;
            end;
            v10 = l_rolloutByApplicationId_0(v3)() or game:GetFastFlag("SelfViewProfileDiscoverabilityUpsellEnabledForAll");
            ::label0::;
            return v10;
        end;
    end
};
