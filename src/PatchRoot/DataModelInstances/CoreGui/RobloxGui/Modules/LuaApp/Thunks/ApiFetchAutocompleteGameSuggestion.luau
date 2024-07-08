local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteGameGetSuggestion);
local v7 = require(l_Modules_0.LuaApp.Actions.AddAutocompleteSuggestion);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local function _(v9)
    return "luaapp.autocomplete.game.suggestion." .. v9;
end;
return {
    Fetch = function(v11, v12, v13)
        return l_PerformFetch_0.Single("luaapp.autocomplete.game.suggestion." .. v12, function(v14)
            return v6(v11, v12, v13):andThen(function(v15)
                if not v15 or not v15.responseBody then
                    return v3.reject();
                else
                    local l_responseBody_0 = v15.responseBody;
                    local v17 = nil;
                    if v12 == l_responseBody_0.prefix then
                        v17 = v5.fromJsonData(l_responseBody_0);
                    end;
                    if not v17 then
                        v2.warn("Response from AutocompleteGameGetSuggestion is malformed");
                        return v3.reject({
                            HttpError = Enum.HttpError.OK
                        });
                    else
                        v17:match(function(v18)
                            v14:dispatch(v7(v12, v18));
                            local v19 = {};
                            for v20 = 1, #v18.entries do
                                local v21 = v18.entries[v20];
                                if v21.type == v5.EntryType.Rich then
                                    table.insert(v19, v21.universeId);
                                end;
                            end;
                            if #v19 > 0 then
                                v14:dispatch(l_ApiFetchGameIcons_0(v11, v19));
                            end;
                        end):matchError(function(v22)
                            warn(v22);
                        end);
                        return v3.resolve(v15);
                    end;
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v23, v24)
        return l_PerformFetch_0.GetStatus(v23, "luaapp.autocomplete.game.suggestion." .. v24);
    end
};
