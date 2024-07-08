local l_Players_0 = game:GetService("Players");
local l_ChatSettings_0 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local v2 = {
    ChattingToSelf = 1, 
    NoMatches = 2, 
    MultipleMatches = 3
};
return {
    CommandErrorCodes = v2, 
    getUserNameFromChattedName = function(v3, v4, v5)
        if v4 == v3 then
            return v4, v2.ChattingToSelf;
        else
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            for _, v8 in pairs(l_l_Players_0_Players_0) do
                if string.lower(v8.Name) == string.lower(v3) then
                    return v8.Name, nil;
                end;
            end;
            local v9 = 0;
            local v10 = nil;
            if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                for _, v12 in pairs(l_l_Players_0_Players_0) do
                    if v12.Name ~= v4 and string.lower(v12.DisplayName) == string.lower(v3) then
                        v9 = v9 + 1;
                        v10 = v12.Name;
                    end;
                end;
            end;
            if v9 == 1 then
                return v10, nil;
            elseif v9 == 0 then
                if v5 == v3 then
                    return v5, v2.ChattingToSelf;
                else
                    return v3, v2.NoMatches;
                end;
            elseif v9 >= 2 then
                return v3, v2.MultipleMatches;
            else
                return ;
            end;
        end;
    end, 
    getUsersWithDisplayNameString = function(v13, v14)
        local v15 = {};
        local v16 = "";
        for _, v18 in pairs((l_Players_0:GetPlayers())) do
            if v18.Name ~= v14 and string.lower(v18.DisplayName) == string.lower(v13) then
                table.insert(v15, v18.Name);
            end;
        end;
        for v19, v20 in pairs(v15) do
            if v19 ~= #v15 then
                v16 = v16 .. "@" .. v20 .. ", ";
            else
                v16 = v16 .. "@" .. v20;
            end;
        end;
        return v16;
    end
};
