local v0 = require(script.Parent.Parent.Parent.Parent.t);
local v1 = {
    minimumItemsPerRow = 2, 
    minimumItemWidth = 160
};
local v2 = {
    minimumItemsPerRow = 1, 
    minimumItemWidth = 332
};
local function _(v3, v4, v5)
    local v6 = math.max(v5.minimumItemsPerRow, (math.floor((v3 + v4) / (v5.minimumItemWidth + v4))));
    return {
        itemsPerRow = v6, 
        itemWidth = math.floor((v3 - (v6 - 1) * v4) / v6)
    };
end;
local v8 = {};
local v9 = v0.strictInterface({
    minimumItemsPerRow = v0.intersection(v0.integer, v0.numberMin(1)), 
    minimumItemWidth = v0.numberMin(0)
});
local v10 = v0.tuple(v0.numberMin(0), v0.number);
v8.makeCustomMetricsGetter = function(v11)
    assert(v9(v11));
    return function(v12, v13)
        assert(v10(v12, v13));
        local l_v11_0 = v11;
        local v15 = math.max(l_v11_0.minimumItemsPerRow, (math.floor((v12 + v13) / (l_v11_0.minimumItemWidth + v13))));
        return {
            itemsPerRow = v15, 
            itemWidth = math.floor((v12 - (v15 - 1) * v13) / v15)
        };
    end;
end;
v8.getLargeMetrics = v8.makeCustomMetricsGetter(v2);
v8.getMediumMetrics = v8.makeCustomMetricsGetter(v1);
v8.getSmallMetrics = function(v16, v17)
    local v18 = v8.getMediumMetrics(v16, v17).itemsPerRow + 1;
    return {
        itemsPerRow = v18, 
        itemWidth = math.floor((v16 - (v18 - 1) * v17) / v18)
    };
end;
v8.getMetricsForFixedColumns = function(v19, v20, v21)
    return {
        itemsPerRow = v21, 
        itemWidth = math.floor((v19 - (v21 - 1) * v20) / v21)
    };
end;
return v8;
