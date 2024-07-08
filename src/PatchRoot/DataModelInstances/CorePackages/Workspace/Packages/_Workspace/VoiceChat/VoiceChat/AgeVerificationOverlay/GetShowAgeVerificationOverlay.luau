local l_Url_0 = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url;
return function(v1, v2, v3)
    assert(type(v3) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string");
    assert(type(v2) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string");
    return v1(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s", l_Url_0.VOICE_URL, if v3 ~= "" and v3 ~= nil then v2 .. "?placeId=" .. v3 else v2), "GET");
end;
