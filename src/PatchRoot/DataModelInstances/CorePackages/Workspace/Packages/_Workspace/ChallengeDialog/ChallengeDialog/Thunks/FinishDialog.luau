local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_script_FirstAncestor_0.Parent.Promise);
local v3 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v4 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogError);
local v5 = require(l_script_FirstAncestor_0.Requests.PostFinishDialog);
return function(v6, v7, v8)
    return function(_)
        return v5(v6, v7, v3.toRawValue(v8)):andThen(function(v10)
            return v10.responseBody;
        end):catch(function(v11)
            if v11.Body then
                return v2.reject(v4.fromRawValue(l_HttpService_0:JSONDecode(v11.Body).errors[1].code) or v4.Unknown);
            else
                return v2.reject(v4.Unknown);
            end;
        end);
    end;
end;
