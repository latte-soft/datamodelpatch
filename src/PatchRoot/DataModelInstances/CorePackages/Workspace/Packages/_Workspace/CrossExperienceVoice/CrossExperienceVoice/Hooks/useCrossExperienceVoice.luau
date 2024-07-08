local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local l_useEffectOnce_0 = require(l_script_FirstAncestor_0.dependencies).RoactUtils.Hooks.useEffectOnce;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.CrossExperienceVoiceManager);
return function()
    local function _()
        v3.default:join({
            placeId = v2.DEFAULT_EXPERIENCE_PLACE_ID
        });
    end;
    local function v5()
        v3.default:disconnect();
    end;
    l_useEffectOnce_0(function()
        v3.default:join({
            placeId = v2.DEFAULT_EXPERIENCE_PLACE_ID
        });
    end, {});
    return {
        disconnect = v5
    };
end;
