local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v6 = require(l_Modules_0.LuaApp.Actions.SetAssetTextFilterSettings);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetAssetTextFilterSettings);
local v8 = {};
local function _(v9)
    return "luaapp.asset-text-filter-settings.get-settings" .. v9;
end;
v8.Fetch = function(v11, v12)
    return l_PerformFetch_0.Single("luaapp.asset-text-filter-settings.get-settings" .. v12, function(v13)
        return v7(v11, v12):andThen(function(v14)
            local l_responseBody_0 = v14.responseBody;
            if l_responseBody_0 ~= nil then
                local v16 = false;
                if l_responseBody_0.Profanity ~= nil then
                    v16 = l_responseBody_0.Profanity;
                    v13:dispatch(v6(v12, v16));
                    return v3.resolve(v16);
                else
                    v2.warn("Failed to parse GetAssetTextFilterSettings for `" .. v12 .. "`");
                    return v3.reject(false);
                end;
            else
                v13:dispatch(v6(v12, false));
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v17)
            v13:dispatch(v6(v12, false));
            v13:dispatch(v5(v17));
            return v3.reject(v17);
        end);
    end);
end;
v8.GetFetchingStatus = function(v18, v19)
    return l_PerformFetch_0.GetStatus(v18, "luaapp.asset-text-filter-settings.get-settings" .. v19);
end;
return v8;
