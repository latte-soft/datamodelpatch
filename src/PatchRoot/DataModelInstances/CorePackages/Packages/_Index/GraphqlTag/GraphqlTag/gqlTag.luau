local l_Parent_0 = script.Parent.Parent;
local l_parse_0 = require(l_Parent_0.GraphQL).parse;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Map_0 = v2.Map;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local l_Object_0 = v2.Object;
local l_Array_0 = v2.Array;
local l_console_0 = v2.console;
local v9 = l_Map_0.new(nil);
local v10 = l_Map_0.new(nil);
local v11 = true;
local v12 = false;
local function v14(v13)
    return l_String_0.trim((v13:gsub(",+%s+", " ")));
end;
local function _(v15)
    return v14(v15.source.body:sub(v15.start, v15._end));
end;
local function v25(v17)
    local v18 = l_Set_0.new(nil);
    local v19 = {};
    for v20 = 1, #v17.definitions do
        local v21 = v17.definitions[v20];
        if v21.kind == "FragmentDefinition" then
            local l_value_0 = v21.name.value;
            local l_loc_0 = v21.loc;
            local v24 = l_String_0.trim((l_loc_0.source.body:sub(l_loc_0.start, l_loc_0._end):gsub(",+%s+", " ")));
            l_loc_0 = v10:get(l_value_0);
            if not l_loc_0 or l_loc_0:has(v24) then
                if not l_loc_0 then
                    l_loc_0 = l_Set_0.new();
                    v10:set(l_value_0, l_loc_0);
                end;
            elseif v11 then
                l_console_0.warn("Warning: fragment with name " .. l_value_0 .. " already exists.\n" .. "graphql-tag enforces all fragment names across your application to be unique; read more about\n" .. "this in the docs: http://dev.apollodata.com/core/fragments.html#unique-names");
            end;
            l_loc_0:add(v24);
            if not v18:has(v24) then
                v18:add(v24);
                table.insert(v19, v21);
            end;
        else
            table.insert(v19, v21);
        end;
    end;
    return l_Object_0.assign({}, v17, {
        definitions = v19
    });
end;
local function v33(v26)
    local v27 = l_Set_0.new(nil);
    for v28 = 1, #v27 do
        local v29 = v27[v28];
        if v29.loc then
            v27:delete(v29.loc);
        end;
        for v30 = 1, #l_Object_0.keys(v29) do
            local v31 = v29[tostring(l_Object_0.keys(v29)[v30])];
            if not (not (v31 and typeof(v31) == "table") or l_Array_0.isArray(v31)) then
                v27:add(v31);
            end;
        end;
    end;
    local l_loc_1 = v26.loc;
    if l_loc_1 then
        l_loc_1.startToken = nil;
        l_loc_1.endToken = nil;
    end;
    return v26;
end;
local function v37(v34)
    local v35 = l_String_0.trim((v34:gsub(",+%s+", " ")));
    if not v9:has(v35) then
        local v36 = l_parse_0(v34, {
            experimentalFragmentVariables = v12
        });
        if not v36 or v36.kind ~= "Document" then
            error("Not a valid GraphQL document.");
        end;
        v9:set(v35, (v33(v25(v36))));
    end;
    return (v9:get(v35));
end;
local function v39(v38)
    if typeof(v38) == "string" then
        return (v37(v38));
    else
        error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.");
        return ;
    end;
end;
resetCaches = function()
    v9:clear();
    v10:clear();
end;
disableFragmentWarnings = function()
    v11 = false;
end;
enableExperimentalFragmentVariables = function()
    v12 = true;
end;
disableExperimentalFragmentVariables = function()
    v12 = false;
end;
local v40 = {
    gql = v39, 
    resetCaches = resetCaches, 
    disableFragmentWarnings = disableFragmentWarnings, 
    enableExperimentalFragmentVariables = enableExperimentalFragmentVariables, 
    disableExperimentalFragmentVariables = disableExperimentalFragmentVariables
};
return {
    default = v39, 
    gql = v39, 
    resetCaches = v40.resetCaches, 
    disableFragmentWarnings = v40.disableFragmentWarnings, 
    enableExperimentalFragmentVariables = v40.enableExperimentalFragmentVariables, 
    disableExperimentalFragmentVariables = v40.disableExperimentalFragmentVariables
};
