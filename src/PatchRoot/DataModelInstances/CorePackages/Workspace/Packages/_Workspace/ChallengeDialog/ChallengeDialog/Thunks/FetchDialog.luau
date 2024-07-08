local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Requests.FetchDialog);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
return function(v4)
    return l_PerformFetch_0.Single("FetchDialog", function(_)
        return v2(v4):andThen(function(v6)
            return v6.responseBody;
        end);
    end);
end;
