local v0 = {};
v0.__index = v0;
v0.getBaseLanguage = function(v1)
    return v1:match("^(%w+)[-_]");
end;
v0.new = function(v2)
    local v3 = {
        _translations = v2
    };
    setmetatable(v3, v0);
    return v3;
end;
v0.addTranslations = function(v4, v5)
    v4._translations = v5;
end;
v0.getRelevantLanguages = function(v6)
    local v7 = {};
    table.insert(v7, v6);
    local v8 = v0.getBaseLanguage(v6);
    if v8 then
        table.insert(v7, v8);
    end;
    table.insert(v7, "en-us");
    return v7;
end;
v0._getSourceString = function(v9, v10, v11)
    local v12 = v9._translations[v10];
    if v12 then
        return v12[v11];
    else
        return nil;
    end;
end;
v0.getString = function(v13, v14, v15, v16)
    local v17 = v13:_getSourceString(v14, v15);
    local v18 = v0.getBaseLanguage(v14);
    local v19 = nil;
    if v18 then
        v19 = v13:_getSourceString(v18, v15);
    end;
    local v20 = (v17 or v19) or v13:_getSourceString("en-us", v15);
    if not v20 then
        error(("Couldn't find value for translation key %q %s, %s, %s"):format(v15, v14, v18, "en-us"), 2);
    end;
    if not v16 then
        return v20;
    else
        return (v20:gsub("{(.-)}", v16));
    end;
end;
return v0;
