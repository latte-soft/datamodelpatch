local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Promise);
local v3 = require(l_CorePackages_0.Packages.Dash);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Logging);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTopics);
local function _(v12, v13, v14)
    return v8.GetTopicsKey .. v9.getTopicRequestKey(v12, v13, v14);
end;
return function(v16, v17, v18, v19)
    return l_PerformFetch_0.Single(v8.GetTopicsKey .. v9.getTopicRequestKey(v17, v18, v19), function(v20)
        return (if not (#v17 == 0) or v19 then v7.GetTopics(v16, v17, v19) else v7.GetInitialTopics(v16, v18 or {})):andThen(function(v21)
            local v23 = v3.map((v21.responseBody or {}).topics or {}, function(v22)
                return string.lower(v22.displayName);
            end);
            v20:dispatch(v11(v17, v18, v19, v23));
            return v2.resolve(v23);
        end, function(v24)
            v5.warn("FetchTopics failure: " .. tostring(v24));
        end);
    end);
end;
