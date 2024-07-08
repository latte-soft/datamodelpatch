local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_List_0 = require(l_script_FirstAncestor_0.Parent.llama).List;
local v3 = require(l_script_FirstAncestor_0.Flags.getTextChatServiceTextChatCommandAutocompleteVisible);
local function v7()
    local v4 = {};
    for _, v6 in ipairs((l_TextChatService_0:GetDescendants())) do
        if not v3() then
            if v6.ClassName == "TextChatCommand" and string.sub(v6.PrimaryAlias, 1, 1) == "/" then
                table.insert(v4, v6.PrimaryAlias);
            end;
        elseif not (not (v6.ClassName == "TextChatCommand") or not v6.AutocompleteVisible) and string.sub(v6.PrimaryAlias, 1, 1) == "/" then
            table.insert(v4, v6.PrimaryAlias);
        end;
    end;
    return v4;
end;
return function(v8)
    l_List_0.map(v7(), function(v9)
        v8.trie:insert(v9);
    end);
    return v8.trie;
end;
