local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v7 = require(l_Modules_0.LuaApp.Actions.SetAgeRecommendation);
local v8 = require(l_Modules_0.LuaApp.Http.Requests.GetAgeRecommendation);
local v9 = {};
local function _(v10)
    return "luaapp.experience_guidelines.get-age-guidelines" .. v10;
end;
v9.Fetch = function(v12, v13)
    return l_PerformFetch_0.Single("luaapp.experience_guidelines.get-age-guidelines" .. v13, function(v14)
        return v8(v12, v13):andThen(function(v15)
            local l_responseBody_0 = v15.responseBody;
            if l_responseBody_0 ~= nil then
                local v17, v18 = v4.fromJsonData(l_responseBody_0.ageRecommendationDetails):unwrap();
                if v17 == false then
                    v2.warn("Failed to parse AgeRecommendationDetails for `" .. v13 .. "`");
                    return v3.reject(v15);
                else
                    v14:dispatch(v7(v13, v18));
                    return v3.resolve(v15);
                end;
            else
                v2.warn("Response from GetAgeRecommendation is malformed");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v19)
            v14:dispatch(v6(v19));
            return v3.reject(v19);
        end);
    end);
end;
v9.GetFetchingStatus = function(v20, v21)
    return l_PerformFetch_0.GetStatus(v20, "luaapp.experience_guidelines.get-age-guidelines" .. v21);
end;
return v9;
