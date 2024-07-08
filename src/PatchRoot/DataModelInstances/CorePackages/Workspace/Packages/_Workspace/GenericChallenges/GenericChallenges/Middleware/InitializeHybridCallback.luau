local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(script.Parent.BuildHybridCallback);
local _ = require(script.Parent.ChallengeWebView);
local v3 = require(script.Parent.ChallengeError);
local v4 = require(l_script_FirstAncestor_0.Utils.completionDataToRawHeaders);
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Types.ErrorKind);
return function(v7, v8, v9, v10, v11, v12, v13)
    return v1({
        Hooks = {}, 
        OnChallengeLoadFailed = function(_)
            if v11 ~= nil then
                v11();
            end;
            v13(v3.new(v6.LoadFailed, {
                challengeType = v8
            }));
            v9:close();
        end, 
        OnChallengeInvalidated = function(v15)
            if v11 ~= nil and v15.data ~= nil then
                v11(v15.data);
            end;
            v13(v3.new(v6.Invalidated, v15.data));
            v9:close();
        end, 
        OnChallengeCompleted = function(v16)
            if (v16.data ~= nil and v16.data.challengeType ~= nil) and v16.data.metadata ~= nil then
                v12(v10(v4({
                    challengeId = v7, 
                    challengeType = v16.data.challengeType, 
                    metadata = v16.data.metadata
                })));
            end;
            v9:close();
        end
    });
end;
