local l_CorePackages_0 = game:GetService("CorePackages");
local l_Promise_0 = require(l_CorePackages_0.InGameMenuDependencies).Promise;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Network.PostFeedback);
local v5 = require(l_Parent_0.Actions.IncrementFeedbackSubmissionAttempts);
return function(v6, v7, v8, v9, v10, v11, v12)
    return l_PerformFetch_0.Single("PostFeedbackRequest", function(v13)
        return v4(v6, v7, v8, v9, v10, v11):andThen(function(v14)
            v13:dispatch(v5(v12));
            return l_Promise_0.resolve(v14);
        end, function(v15)
            return l_Promise_0.reject(v15);
        end);
    end);
end;
