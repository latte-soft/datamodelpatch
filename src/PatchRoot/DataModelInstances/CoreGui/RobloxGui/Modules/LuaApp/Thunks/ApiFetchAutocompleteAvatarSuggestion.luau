local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.AutocompleteAvatarSuggest);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion);
local function _(v8)
    return "luaapp.autocomplete.avatar.suggestion." .. v8;
end;
return {
    Fetch = function(v10, v11)
        return l_PerformFetch_0.Single("luaapp.autocomplete.avatar.suggestion." .. v11, function(v12)
            return v6(v10, v11):andThen(function(v13)
                if not v13 or not v13.responseBody then
                    return v3.reject();
                else
                    local l_responseBody_0 = v13.responseBody;
                    local v15 = nil;
                    if l_responseBody_0.Args ~= nil and v11 == l_responseBody_0.Args.Prefix then
                        v15 = v5.fromJsonDataAvatar(l_responseBody_0);
                    end;
                    if not v15 then
                        v2.warn("Response from AutocompleteAvatarSuggest is malformed");
                        return v3.reject({
                            HttpError = Enum.HttpError.OK
                        });
                    else
                        v15:match(function(v16)
                            v12:dispatch(v7(v11, v16));
                        end):matchError(function(v17)
                            warn(v17);
                        end);
                        return v3.resolve(v13);
                    end;
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v18, v19)
        return l_PerformFetch_0.GetStatus(v18, "luaapp.autocomplete.avatar.suggestion." .. v19);
    end
};
