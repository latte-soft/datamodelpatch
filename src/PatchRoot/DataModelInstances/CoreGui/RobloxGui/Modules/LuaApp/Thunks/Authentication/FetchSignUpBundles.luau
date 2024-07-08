local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_Modules_0.LuaApp.Thunks.Networking.Util.Retry);
local v6 = require(l_Modules_0.LuaApp.Models.Authentication.SignUpBundle);
local v7 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBundles);
local v8 = require(l_Modules_0.LuaApp.Http.Requests.GetSignUpBundles);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.FetchHumanoidDescriptionProperties);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpMaxRetries);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier);
local v12 = math.max(0, v10());
local v13 = math.max(0, v11());
local v14 = {};
local v15 = v2.array(v2.optional(v2.interface({
    bundleId = v2.number, 
    userOutfitId = v2.number
})));
v14._fetchSignUpBundles = function(v16)
    return v8(v16):andThen(function(v17)
        local v18 = (v17 and v17.responseBody) and v17.responseBody.bundles;
        if not v15(v18) then
            return v4.resolve();
        else
            return v4.resolve(v18);
        end;
    end);
end;
v14._fetchSignUpBundlesWithRetry = function(v19)
    local function v20()
        return v14._fetchSignUpBundles(v19);
    end;
    return v14._fetchSignUpBundles(v19):andThen(function(v21)
        return v5({
            retryCount = v12, 
            retryTimeMultiplier = v13, 
            retryCallback = v20, 
            previousResult = v21, 
            isResolveConditionMet = function(v22)
                return v22 ~= nil;
            end
        });
    end);
end;
v14.Fetch = function(v23)
    return l_PerformFetch_0.Single("signUpBundles", function(v24)
        return v14._fetchSignUpBundlesWithRetry(v23):andThen(function(v25)
            local v26 = {};
            if not v15(v25) then
                return v4.reject();
            else
                for _, v28 in ipairs(v25) do
                    table.insert(v26, v6.fromData(v28));
                end;
                v24:dispatch(v7(v26));
                return v4.resolve(v26);
            end;
        end):andThen(function(v29)
            local v30 = {};
            for _, v32 in pairs(v29) do
                table.insert(v30, v32.userOutfitId);
            end;
            return v24:dispatch(v9.Fetch(v23, v30));
        end);
    end);
end;
v14.GetFetchingStatus = function(v33)
    return l_PerformFetch_0.GetStatus(v33, "signUpBundles");
end;
return v14;
