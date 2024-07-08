local v0 = {
    XSmall = "XSmall", 
    Small = "Small", 
    Medium = "Medium", 
    Large = "Large", 
    XLarge = "XLarge", 
    X2Large = "X2Large", 
    Landscape = "Landscape", 
    Portrait = "Portrait"
};
local v1 = {
    [v0.XSmall] = {
        Key = v0.XSmall, 
        size = v0.XSmall, 
        minWidth = 320, 
        maxWidth = 360
    }, 
    [v0.Small] = {
        Key = v0.Small, 
        size = v0.Small, 
        minWidth = 361, 
        maxWidth = 600
    }, 
    [v0.Medium] = {
        Key = v0.Medium, 
        size = v0.Medium, 
        minWidth = 601, 
        maxWidth = 1140
    }, 
    [v0.Large] = {
        Key = v0.Large, 
        size = v0.Large, 
        minWidth = 1141, 
        maxWidth = 1520
    }, 
    [v0.XLarge] = {
        Key = v0.XLarge, 
        size = v0.XLarge, 
        minWidth = 1521, 
        maxWidth = 1920
    }, 
    [v0.X2Large] = {
        Key = v0.X2Large, 
        size = v0.X2Large, 
        minWidth = 1920, 
        maxWidth = 4096
    }
};
local v2 = {
    [v0.XSmall] = {
        Key = v0.XSmall, 
        size = v0.XSmall, 
        maxWidth = 360
    }, 
    [v0.Small] = {
        Key = v0.Small, 
        size = v0.Small, 
        maxWidth = 600
    }, 
    [v0.Medium] = {
        Key = v0.Medium, 
        size = v0.Medium, 
        maxWidth = 1140
    }, 
    [v0.Large] = {
        Key = v0.Large, 
        size = v0.Large, 
        maxWidth = 1520
    }, 
    [v0.XLarge] = {
        Key = v0.XLarge, 
        size = v0.XLarge, 
        maxWidth = 1920
    }, 
    [v0.X2Large] = {
        Key = v0.X2Large, 
        size = v0.X2Large, 
        maxWidth = 4096
    }
};
local v3 = {
    [v0.XSmall] = {
        Key = v0.XSmall, 
        size = v0.XSmall, 
        minHeight = 320, 
        maxHeight = 360
    }, 
    [v0.Small] = {
        Key = v0.Small, 
        size = v0.Small, 
        minHeight = 361, 
        maxHeight = 600
    }, 
    [v0.Medium] = {
        Key = v0.Medium, 
        size = v0.Medium, 
        minHeight = 601, 
        maxHeight = 1140
    }, 
    [v0.Large] = {
        Key = v0.Large, 
        size = v0.Large, 
        minHeight = 1141, 
        maxHeight = 1520
    }, 
    [v0.XLarge] = {
        Key = v0.XLarge, 
        size = v0.XLarge, 
        minHeight = 1521, 
        maxHeight = 1920
    }, 
    [v0.X2Large] = {
        Key = v0.X2Large, 
        size = v0.X2Large, 
        minHeight = 1920, 
        maxHeight = 4096
    }
};
local v4 = {
    [v0.XSmall] = {
        Key = v0.XSmall, 
        size = v0.XSmall, 
        maxHeight = 360
    }, 
    [v0.Small] = {
        Key = v0.Small, 
        size = v0.Small, 
        maxHeight = 600
    }, 
    [v0.Medium] = {
        Key = v0.Medium, 
        size = v0.Medium, 
        maxHeight = 1140
    }, 
    [v0.Large] = {
        Key = v0.Large, 
        size = v0.Large, 
        maxHeight = 1520
    }, 
    [v0.XLarge] = {
        Key = v0.XLarge, 
        size = v0.XLarge, 
        maxHeight = 1920
    }, 
    [v0.X2Large] = {
        Key = v0.X2Large, 
        size = v0.X2Large, 
        maxHeight = 4096
    }
};
local v5 = {
    {
        Key = v0.Landscape, 
        minRatio = 1
    }, 
    {
        Key = v0.Portrait, 
        minRatio = 0
    }
};
local v6 = {
    v2[v0.XSmall], 
    v2[v0.Small], 
    v2[v0.Medium], 
    v2[v0.Large], 
    v2[v0.XLarge], 
    v2[v0.X2Large]
};
local v7 = {
    v4[v0.XSmall], 
    v4[v0.Small], 
    v4[v0.Medium], 
    v4[v0.Large], 
    v4[v0.XLarge], 
    v4[v0.X2Large]
};
local v8 = {};
for v9, v10 in v6, nil, nil do
    v8[v10.Key] = v9;
end;
return {
    Enum = v0, 
    sizes = v2, 
    sizesMinMax = v1, 
    sizesY = v4, 
    sizesMinMaxY = v3, 
    rules = {
        default = v6, 
        Y = v7, 
        Orientation = v5
    }, 
    keyIndex = v8, 
    getMinWidthFor = function(v11)
        local v12 = v1[v11];
        if v12 == nil then
            return 0;
        else
            return v12.minWidth;
        end;
    end, 
    getMinHeightFor = function(v13)
        local v14 = v3[v13];
        if v14 == nil then
            return 0;
        else
            return v14.minHeight;
        end;
    end
};
