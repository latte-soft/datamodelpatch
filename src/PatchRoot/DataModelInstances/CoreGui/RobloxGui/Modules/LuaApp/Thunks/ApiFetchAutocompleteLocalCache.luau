local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch;
local v2 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestionTable);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteGetLocalCache);
local v4 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestionTable);
local v5 = require(l_Modules_0.LuaApp.Promise);
local function _(v6, v7)
    return "luaapp.autocomplete.getlocalcache." .. v6 .. "." .. (v7 or "none");
end;
local v9 = {};
v9.Fetch = function(v10, v11, v12, v13)
    return l_PerformFetch_0.Single("luaapp.autocomplete.getlocalcache." .. v11 .. "." .. (v12 or "none"), function(v14)
        return v3(v10, v11, v12, v13):andThen(function(v15)
            if not v15 or not v15.responseBody then
                return v5.reject();
            else
                local l_responseBody_0 = v15.responseBody;
                v2.fromJsonData(l_responseBody_0):match(function(v17)
                    v14:dispatch(v4(v17));
                end):matchError(function(v18)
                    warn(v18);
                end);
                if not (not l_responseBody_0.hasNextPage or not l_responseBody_0.pageNumber) then
                    v14:dispatch(v9.Fetch(v10, l_responseBody_0.pageNumber + 1, v12, v13));
                end;
                return v5.resolve();
            end;
        end, function(v19)
            return v5.reject(v19);
        end);
    end);
end;
return v9;
