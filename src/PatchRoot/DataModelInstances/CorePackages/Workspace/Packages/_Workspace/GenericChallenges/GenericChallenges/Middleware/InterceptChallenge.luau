local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(l_script_FirstAncestor_0.Utils.constants);
local v2 = require(l_script_FirstAncestor_0.Utils.getLocalizedTitle);
local v3 = require(script.Parent.ChallengeWebView);
local v4 = require(script.Parent.InitializeHybridCallback);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
return function(v8)
    return v6.new(function(v9, v10)
        local v11 = v3.new({
            title = v2(v8.title), 
            rawResponseHeaders = v8.rawResponseHeaders
        });
        v11:setHybridCallback(v4(v8.rawResponseHeaders[v1.challengeIdHeader], v8.rawResponseHeaders[v1.challengeTypeHeader], v11, v8.retryRequestCallback, v8.challengeErrorCallback, v9, v10));
        v11:open();
    end);
end;
