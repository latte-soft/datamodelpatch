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
v2.Truncate = function(v14, v15, v16, v17, v18)
    v18 = v18 or "";
    if v17 < v2.GetTextWidth(v14, v15, v16) then
        local v19 = "";
        for _, v21 in utf8.graphemes(v14) do
            local v22 = string.sub(v14, 1, v21) .. v18;
            if v17 < v2.GetTextWidth(v22, v15, v16) then
                return v19;
            else
                v19 = v22;
            end;
        end;
        return "";
    else
        return v14;
    end;
end;
v2.TruncateTextLabel = function(v23, v24)
    v23.Text = v2.Truncate(v23.Text, v23.Font, v23.TextSize, v23.AbsoluteSize.X, v24);
end;
v2.Trim = function(v25)
    if type(v25) ~= "string" then
        error(string.format("Text.Trim called on non-string type %s.", (type(v25))), 2);
    end;
    return (v25:gsub("^%s*(.-)%s*$", "%1"));
end;
v2.RightTrim = function(v26)
    if type(v26) ~= "string" then
        error(string.format("Text.RightTrim called on non-string type %s.", (type(v26))), 2);
    end;
    return (v26:gsub("%s+$", ""));
end;
v2.LeftTrim = function(v27)
    if type(v27) ~= "string" then
        error(string.format("Text.LeftTrim called on non-string type %s.", (type(v27))), 2);
    end;
    return (v27:gsub("^%s+", ""));
end;
v2.SpaceNormalize = function(v28)
    if type(v28) ~= "string" then
        error(string.format("Text.SpaceNormalize called on non-string type %s.", (type(v28))), 2);
    end;
    return (v28:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", ""));
end;
v2.Split = function(v29, v30)
    if type(v29) ~= "string" then
        error(string.format("Text.Split called on non-string type %s.", (type(v29))), 2);
    elseif type(v30) ~= "string" then
        error(string.format("Text.Split called with a pattern that is non-string type %s.", (type(v30))), 2);
    elseif v30 == "" then
        error("Text.Split called with an empty pattern.", 2);
    end;
    local v31 = {};
    local v32 = 1;
    while true do
        local v33, v34 = string.find(v29, v30, v32, true);
        if not (not v33 or not v34) then
            table.insert(v31, (string.sub(v29, v32, v33 - 1)));
            v32 = v34 + 1;
        else
            break;
        end;
    end;
    table.insert(v31, (string.sub(v29, v32, (string.len(v29)))));
    return v31;
end;
return v2;
