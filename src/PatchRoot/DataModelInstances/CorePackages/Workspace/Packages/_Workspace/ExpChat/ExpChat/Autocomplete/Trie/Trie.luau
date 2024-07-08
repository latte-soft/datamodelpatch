local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Autocomplete");
local l_List_0 = require(l_Parent_0.llama).List;
local v3 = require(l_script_FirstAncestor_0.Trie.TrieNode);
local v4 = {};
v4.__index = v4;
v4.new = function()
    local v5 = {};
    setmetatable(v5, v4);
    v5.root = v3.new("");
    return v5;
end;
v4.insert = function(v6, v7)
    local l_root_0 = v6.root;
    for v9 = 1, #v7 do
        local v10 = string.sub(v7, v9, v9);
        if not l_root_0.children[v10] then
            l_root_0.children[v10] = v3.new(v10);
        end;
        l_root_0 = l_root_0.children[v10];
    end;
    l_root_0.isEndOfWord = true;
end;
v4.autocomplete = function(v11, v12)
    local v13 = {};
    local l_root_1 = v11.root;
    for v15 = 1, #v12 do
        local v16 = string.sub(v12, v15, v15);
        if not l_root_1.children[v16] then
            return v13;
        else
            l_root_1 = l_root_1.children[v16];
        end;
    end;
    return (v11:helper(l_root_1, v13, (string.sub(v12, 1, #v12 - 1))));
end;
v4.helper = function(v17, v18, v19, v20)
    if v18.isEndOfWord then
        v19 = l_List_0.push(v19, v20 .. v18.data);
    end;
    for _, v22 in pairs(v18.children) do
        v19 = v17:helper(v22, v19, v20 .. v18.data);
    end;
    return v19;
end;
return v4;
