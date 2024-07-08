local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.GetShowAgeVerificationOverlay);
local v2 = require(l_script_FirstAncestor_0.AgeVerificationOverlay.SetShowAgeVerificationOverlay);
local v3 = require(l_script_FirstAncestor_0.Flags.GetFFlagLogExposureForExperienceUpsell);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v8 = require(game:GetService("CorePackages").Logging);
return {
    KeyMapper = function(v9)
        return "luaapp.showageverificationoverlay." .. v9;
    end, 
    Fetch = function(v10, v11, v12)
        if type(v11) ~= "string" then
            error("ApiFetchShowAgeVerificationOverlay thunk expects universeId to be a string");
        end;
        v12 = v12 or "";
        if type(v12) ~= "string" then
            error("ApiFetchShowAgeVerificationOverlay thunk expects placeId to be a string");
        end;
        return l_PerformFetch_0.Single("luaapp.showageverificationoverlay." .. v11, function(v13)
            return v1(v10, v11, v12):andThen(function(v14)
                local l_responseBody_0 = v14.responseBody;
                local v16 = false;
                if l_responseBody_0.voiceSettings ~= nil then
                    v16 = l_responseBody_0.voiceSettings.isVoiceEnabled;
                end;
                if l_responseBody_0.showAgeVerificationOverlay then
                    l_mutedError_0((("showAgeVerificationOverlay is deprecated but was truthy for universe %*"):format(v11)));
                end;
                if (l_responseBody_0 ~= nil and l_responseBody_0.showAgeVerificationOverlay ~= nil) and l_responseBody_0.universePlaceVoiceEnabledSettings ~= nil then
                    v13:dispatch(v2(v11, l_responseBody_0.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice, l_responseBody_0.universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice, v16, l_responseBody_0.showVoiceOptInOverlay, l_responseBody_0.universePlaceVoiceEnabledSettings.isUniverseEnabledForAvatarVideo, if not v3() then nil else l_responseBody_0.elegibleToSeeVoiceUpsell));
                    return v5.resolve(v14);
                else
                    v8.warn("Response from GetShowAgeVerificationOverlay is malformed");
                    return v5.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v17, v18)
        return l_PerformFetch_0.GetStatus(v17, "luaapp.showageverificationoverlay." .. v18);
    end
};
