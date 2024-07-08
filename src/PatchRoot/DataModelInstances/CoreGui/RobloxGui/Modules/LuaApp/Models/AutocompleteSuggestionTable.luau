local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Result);
local v4 = require(script.Parent.AutocompleteSuggestion);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteCacheValidityHours);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixAutocompleteEntryDups);
local function _(v7, v8)
    return tostring(v7.universeId or "_") .. (v7.canonicalTitle or "_") .. (v7.searchQuery or "_") .. "_" .. tostring(v8) .. "_" .. tostring(v7.type);
end;
local v10 = {
    new = function()
        return {};
    end
};
v10.fromJsonData = function(v11)
    local v12 = v6();
    local v13 = v10.new();
    local l_algorithmName_0 = v11.algorithmName;
    local l_entries_0 = v11.entries;
    if type(l_algorithmName_0) ~= "string" then
        return v3.error("AutocompleteSuggestionTable expects algorithmName to be a string");
    elseif type(l_entries_0) ~= "table" then
        return v3.error("AutocompleteSuggestionTable expects entries to be a table");
    else
        local v16 = tick() + (v5() * 60) * 60;
        for v17 = 1, #l_entries_0 do
            local v18 = l_entries_0[v17];
            local l_matchedPrefixes_0 = v18.matchedPrefixes;
            if l_matchedPrefixes_0 and #l_matchedPrefixes_0 > 0 then
                if type(v18.type) ~= "number" then
                    return v3.error("AutocompleteSuggestionTable expects dataEntry.type to be a number");
                else
                    local v20 = nil;
                    if v18.type == v4.EntryType.Keyword then
                        if type(v18.searchQuery) ~= "string" then
                            return v3.error("AutocompleteSuggestionTable expects dataEntry.searchQuery to be a string");
                        else
                            v20 = {
                                type = v18.type, 
                                searchQuery = v18.searchQuery
                            };
                        end;
                    elseif v18.type == v4.EntryType.Rich then
                        if type(v18.universeId) ~= "number" and type(v18.universeId) ~= "string" then
                            return v3.error("AutocompleteSuggestionTable expects dataEntry.universeId to be a number or string");
                        elseif type(v18.canonicalTitle) ~= "string" then
                            return v3.error("AutocompleteSuggestionTable expects dataEntry.canonicalTitle to be a string");
                        else
                            v20 = {
                                type = v18.type, 
                                universeId = tostring(v18.universeId), 
                                canonicalTitle = v18.canonicalTitle
                            };
                        end;
                    else
                        return v3.error("AutocompleteSuggestionTable dataEntry.type is unknown");
                    end;
                    for v21 = 1, #l_matchedPrefixes_0 do
                        local v22 = l_matchedPrefixes_0[v21];
                        if type(v22.prefix) ~= "string" then
                            return v3.error("AutocompleteSuggestionTable expects prefixEntry.prefix to be a string");
                        elseif type(v22.position) ~= "number" then
                            return v3.error("AutocompleteSuggestionTable expects prefixEntry.position to be a number");
                        else
                            local v23 = v13[v22.prefix];
                            if v23 == nil then
                                v23 = {
                                    prefix = v22.prefix, 
                                    algorithmName = l_algorithmName_0, 
                                    preloadedCache = true, 
                                    expirationTime = v16, 
                                    entries = {}
                                };
                                v13[v22.prefix] = v23;
                            end;
                            local v24 = nil;
                            if not v12 then
                                v24 = v2.Dictionary.join(v20, {
                                    position = v22.position
                                });
                            else
                                local l_join_0 = v2.Dictionary.join;
                                local l_v20_0 = v20;
                                local v27 = {
                                    position = v22.position
                                };
                                local l_v20_1 = v20;
                                v27.hash = tostring(l_v20_1.universeId or "_") .. (l_v20_1.canonicalTitle or "_") .. (l_v20_1.searchQuery or "_") .. "_" .. tostring(v22.position) .. "_" .. tostring(l_v20_1.type);
                                v24 = l_join_0(l_v20_0, v27);
                            end;
                            table.insert(v23.entries, v24);
                        end;
                    end;
                end;
            end;
        end;
        return v3.success(v13);
    end;
end;
return v10;
