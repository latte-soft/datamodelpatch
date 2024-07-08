local function _(v0)
    return v0:match("^(%w+)[-_]");
end;
local v2 = {};
v2.__index = v2;
v2.new = function(v3)
    local v4 = {
        _translations = v3
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.addTranslations = function(v5, v6)
    v5._translations = v6;
end;
v2.getRelevantLanguages = function(v7)
    local v8 = {};
    table.insert(v8, v7);
    local v9 = v7:match("^(%w+)[-_]");
    if v9 then
        table.insert(v8, v9);
    end;
    table.insert(v8, "en-us");
    return v8;
end;
v2._getSourceString = function(v10, v11, v12)
    local v13 = v10._translations[v11];
    if v13 then
        return v13[v12];
    else
        return nil;
    end;
end;
v2.getString = function(v14, v15, v16, v17)
    local v18 = v14:_getSourceString(v15, v16);
    local v19 = v15:match("^(%w+)[-_]");
    local v20 = nil;
    if v19 then
        v20 = v14:_getSourceString(v19, v16);
    end;
    local v21 = (v18 or v20) or v14:_getSourceString("en-us", v16);
    if not v21 then
        error(("Couldn't find value for translation key %q %s, %s, %s"):format(v16, v15, v19, "en-us"), 2);
    end;
    if not v17 then
        return v21;
    else
        return (v21:gsub("{(.-)}", v17));
    end;
end;
return v2;
