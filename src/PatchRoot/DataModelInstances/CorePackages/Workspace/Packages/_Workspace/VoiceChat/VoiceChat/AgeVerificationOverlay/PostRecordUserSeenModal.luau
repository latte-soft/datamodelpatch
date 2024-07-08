local l_Url_0 = require(script:FindFirstAncestor("VoiceChat").Parent.Http).Url;
return function(v1)
    return v1(string.format("%s/v1/settings/record-user-seen-upsell-modal", l_Url_0.VOICE_URL), "POST", {
        postBody = "{}"
    });
end;
