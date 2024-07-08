local function _(v0)
    if v0 < 513 then
        return 3;
    elseif v0 < 852 then
        return 4;
    elseif v0 < 1012 then
        return 5;
    elseif v0 < 1172 then
        return 6;
    elseif v0 < 1332 then
        return 7;
    else
        return 8;
    end;
end;
local function _()
    return 70;
end;
return function(v3, v4, v5, v6)
    assert(type(v3) == "number", "containerWidth (argument 1) must be a number");
    assert(type(v5) == "number", "cardPadding (argument 2) must be a number");
    assert(type(v6) == "number", "trailingCardFraction (argument 3) must be a number");
    local v7 = v3 + v4;
    local v8 = (v7 < 513 and 3 or (v7 < 852 and 4 or (v7 < 1012 and 5 or (v7 < 1172 and 6 or (v7 < 1332 and 7 or 8))))) + v6;
    v7 = math.floor((v3 - v5 * (math.ceil(v8) - 1)) / v8);
    local v9 = math.floor(v7 + 70);
    if v7 <= 0 then
        return Vector2.new(1, 1), 1;
    else
        return Vector2.new(v7, v9), v8;
    end;
end;
