local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
local l_TextService_0 = game:GetService("TextService");
local v2 = {
    _TEMP_PATCHED_PADDING = Vector2.new(0, 0)
};
if not l_game_EngineFeature_0 then
    v2._TEMP_PATCHED_PADDING = Vector2.new(2, 2);
end;
v2.GetTextBounds = function(v3, v4, v5, v6)
    return l_TextService_0:GetTextSize(v3, v5, v4, v6) + v2._TEMP_PATCHED_PADDING;
end;
v2.GetTextWidth = function(v7, v8, v9)
    return v2.GetTextBounds(v7, v8, v9, Vector2.new(10000, 10000)).X;
end;
v2.GetTextHeight = function(v10, v11, v12, v13)
    return v2.GetTextBounds(v10, v11, v12, Vector2.new(v13, 10000)).Y;
end;
return v2;
