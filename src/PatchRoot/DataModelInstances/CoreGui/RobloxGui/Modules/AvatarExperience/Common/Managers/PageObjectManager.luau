local v0 = {};
v0.__index = v0;
v0.new = function()
    local v1 = {
        pageObjectMap = {}
    };
    setmetatable(v1, v0);
    return v1;
end;
v0.storePageObject = function(v2, v3, v4)
    v2.pageObjectMap[v3] = v4;
end;
v0.getPageObject = function(v5, v6)
    return v5.pageObjectMap[v6];
end;
return v0;
