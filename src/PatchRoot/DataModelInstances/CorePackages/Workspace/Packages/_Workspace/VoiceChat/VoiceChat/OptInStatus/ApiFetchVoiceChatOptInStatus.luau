local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.OptInStatus.GetVoiceChatOptInStatus);
local v2 = require(l_script_FirstAncestor_0.OptInStatus.SetVoiceChatOptInStatus);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v6 = require(game:GetService("CorePackages").Logging);
return {
    KeyMapper = "luaapp.voicechatoptinstatus", 
    Fetch = function(v7)
        return l_PerformFetch_0.Single("luaapp.voicechatoptinstatus", function(v8)
            return v1(v7):andThen(function(v9)
                local l_responseBody_0 = v9.responseBody;
                if l_responseBody_0 ~= nil and l_responseBody_0.isUserOptIn ~= nil then
                    v8:dispatch(v2(l_responseBody_0.isUserOptIn));
                    return v4.resolve(v9);
                else
                    v6.warn("Response from GetVoiceChatOptInStatus is malformed");
                    return v4.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v11)
        return l_PerformFetch_0.GetStatus(v11, "luaapp.voicechatoptinstatus");
    end
};
