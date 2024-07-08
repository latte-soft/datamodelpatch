local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagLuaAppFetchPlayabilityKillSwitch);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_OpenAgeVerificationModal_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.OpenAgeVerificationModal;
return function(v11, v12, v13)
    local v14 = l_useRoactService_0(l_RoactNetworking_0);
    local v15 = l_useDispatch_0();
    return (v4.useCallback(function(v16)
        if not v11 then
            v13(v16);
            return ;
        elseif not (v11.playabilityStatus == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser) or v2() then
            v13(v16);
            return ;
        else
            v15(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v14, v12)):andThen(function(v17)
                if not (v17 == l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser) then
                    v13(v16);
                    return ;
                else
                    v15(l_OpenAgeVerificationModal_0(v12));
                    return ;
                end;
            end):catch(function()
                v13(v16);
            end);
            return ;
        end;
    end, {
        v14, 
        v12, 
        v11, 
        v13
    }));
end;
