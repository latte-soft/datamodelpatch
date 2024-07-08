local function v1(v0)
    if v0 == "/" then
        return v0;
    else
        return v0:sub(1, v0:sub(-1, -1) == "/" and -2 or nil);
    end;
end;
return {
    SEPARATOR = "/", 
    join = function(v2, ...)
        local v3 = table.pack(...);
        local v4 = {
            v1(v2)
        };
        for v5 = 1, v3.n do
            if v5 == v3.n then
                v4[v5 + 1] = v3[v5];
            else
                local v6 = v5 + 1;
                local v7 = v3[v5];
                v4[v6] = v7:sub(v7:sub(1, 1) == "/" and 2 or 1, v7:sub(-1, -1) == "/" and -2 or nil);
            end;
        end;
        return table.concat(v4, "/");
    end, 
    parent = function(v8)
        if not (v8 ~= "") or v8 == "/" then
            return nil;
        else
            local v9 = v8:sub(v8:sub(1, 1) == "/" and 2 or 1, v8:sub(-1, -1) == "/" and -2 or nil):split("/");
            table.remove(v9);
            if v8:sub(1, 1) == "/" then
                return "/" .. table.concat(v9, "/");
            else
                return table.concat(v9, "/");
            end;
        end;
    end, 
    fileName = function(v10)
        local v11 = v10:sub(v10:sub(1, 1) == "/" and 2 or 1, v10:sub(-1, -1) == "/" and -2 or nil):split("/");
        local v12 = v11[#v11];
        if not (((v12 ~= nil and v12 ~= "") and v12 ~= "/") and v12 ~= ".") or v12 == ".." then
            return nil;
        else
            return v12;
        end;
    end, 
    fileStem = function(v13)
        local v14 = v13:sub(v13:sub(1, 1) == "/" and 2 or 1, v13:sub(-1, -1) == "/" and -2 or nil):split("/");
        local v15 = v14[#v14];
        local v16 = if not (((v15 ~= nil and v15 ~= "") and v15 ~= "/") and v15 ~= ".") or v15 == ".." then nil else v15;
        if v16 == nil then
            return nil;
        else
            v14 = v16:split(".");
            if not (#v14 ~= 1) or #v14 == 2 and v14[1] == "" then
                return v16;
            else
                table.remove(v14);
                return table.concat(v14, ".");
            end;
        end;
    end, 
    trimSeparators = function(v17)
        return v17:sub(v17:sub(1, 1) == "/" and 2 or 1, v17:sub(-1, -1) == "/" and -2 or nil);
    end, 
    trimEndSeparator = v1, 
    getComponents = function(v18)
        return v18:sub(v18:sub(1, 1) == "/" and 2 or 1, v18:sub(-1, -1) == "/" and -2 or nil):split("/");
    end, 
    sanitizeFileName = function(v19)
        return v19:gsub("[^%a%d%.%-]", "_"):sub(1, 50);
    end
};
