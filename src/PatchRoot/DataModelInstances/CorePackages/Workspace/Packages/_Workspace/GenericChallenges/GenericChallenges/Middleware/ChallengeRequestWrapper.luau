local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(script.Parent.IsChallengeHttpResponse);
local v4 = require(script.Parent.InterceptChallenge);
local _ = require(l_Parent_0.Http);
return function(v6, v7)
    local l_v4_0 = v4;
    if v7 ~= nil then
        l_v4_0 = v7;
    end;
    return function(v9, v10, v11)
        local v12, v13 = v6(v9, v10, v11);
        return v12:andThen(function(v14)
            return v1.resolve(v14);
        end):catch(function(v15)
            if not (v15.StatusCode ~= nil and v15.Headers ~= nil) or not v3(v15.StatusCode, v15.Headers) then
                return v1.reject(v15);
            else
                return l_v4_0({
                    retryRequestCallback = function(v16)
                        return v6(v9, v10, v2.Dictionary.join(v11, {
                            headers = v16
                        }));
                    end, 
                    rawResponseHeaders = v15.Headers
                });
            end;
        end), v13;
    end;
end;
