local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_llama_0 = require(l_script_FirstAncestor_0.Parent.LuaSocialLibrariesDeps).llama;
local v2 = require(l_script_FirstAncestor_0.Http.RoduxAliases);
local function v7(v3)
    local v4 = {};
    for _, v6 in ipairs(v3) do
        table.insert(v4, v2.Actions.AliasUpdated(tostring(v6.targetUserId), v6.targetUserTag));
    end;
    return v4;
end;
local v10 = {
    GetAliases_Success = function(v8)
        return (v7(v8.responseBody));
    end, 
    ReceivedAliases = function(v9)
        return (v7(v9.aliases));
    end
};
local v11 = v2.installReducer();
return function(v12, v13)
    v12 = v12 or {
        byUserId = {
            ShowUserAlias = true
        }
    };
    local v14 = {
        v13
    };
    local v15 = v10[v13.type];
    if v15 then
        v14 = v15(v13);
    end;
    return l_llama_0.List.reduce(v14, v11, v12);
end;
