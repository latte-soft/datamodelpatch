local v0 = require(script.Parent.ArgCheck);
local v1 = {
    minimumCardCount = 2, 
    minimumCardWidth = 160
};
local v2 = {
    minimumCardCount = 1, 
    minimumCardWidth = 330
};
local function v7(v3, v4, v5)
    v0.isNonNegativeNumber(v3, "GetGridLayoutSettings: containerWidth");
    v0.isNonNegativeNumber(v4, "GetGridLayoutSettings: cardPadding");
    v0.isType(v5, "table", "GetGridLayoutSettings: settingsTable");
    local v6 = math.max(v5.minimumCardCount, (math.floor((v3 + v4) / (v5.minimumCardWidth + v4))));
    return v6, (math.floor((v3 - (v6 - 1) * v4) / v6));
end;
return {
    Small = function(v8, v9)
        local v10, _ = v7(v8, v9, v1);
        v10 = v10 + 1;
        return v10, (math.floor((v8 - (v10 - 1) * v9) / v10));
    end, 
    Medium = function(v12, v13)
        return v7(v12, v13, v1);
    end, 
    Large = function(v14, v15)
        return v7(v14, v15, v2);
    end
};
