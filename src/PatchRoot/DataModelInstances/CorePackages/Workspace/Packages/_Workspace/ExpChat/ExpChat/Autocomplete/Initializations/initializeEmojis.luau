local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v2 = require(l_Parent_0.llama).Dictionary.keys((require(l_Parent_0.EmojiList)));
return function(v3)
    l_List_0.map(v2, function(v4)
        v3.trie:insert(v4);
    end);
    return v3.trie;
end;
