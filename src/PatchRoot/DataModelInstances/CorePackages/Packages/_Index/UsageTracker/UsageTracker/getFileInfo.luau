local l_CoreScriptSyncService_0 = game:GetService("CoreScriptSyncService");
return function(v1, v2, v3)
    local l_game_0 = game;
    for _, v6 in string.split(v1, ".") do
        if not (l_game_0 == nil) then
            l_game_0 = l_game_0:FindFirstChild(v6);
        else
            break;
        end;
    end;
    if not (typeof(l_game_0) == "Instance" and l_game_0:IsA("ModuleScript")) then
        warn("path led to non-ModuleScript:", v1, l_game_0.ClassName);
        l_game_0 = nil;
    end;
    local v7 = nil;
    if l_game_0 then
        v7 = l_CoreScriptSyncService_0:GetScriptFilePath(l_game_0);
        if v2 then
            local v8, v9 = string.find(v7, v2, 1, true);
            if v8 then
                v7 = string.sub(v7, if not v3 then v9 + 1 else v8);
            end;
        end;
    end;
    return l_game_0, v7;
end;
