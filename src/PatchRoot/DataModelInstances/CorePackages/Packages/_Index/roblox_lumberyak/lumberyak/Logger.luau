local v0 = require(script.Parent.Parent.Cryo);
local v1 = {};
v1.__index = v1;
v1.Levels = {
    Error = "Error", 
    Warning = "Warning", 
    Info = "Info", 
    Debug = "Debug", 
    Trace = "Trace"
};
local v2 = {
    v1.Levels.Error, 
    v1.Levels.Warning, 
    v1.Levels.Info, 
    v1.Levels.Debug, 
    v1.Levels.Trace
};
local v3 = {};
for v4, v5 in pairs(v2) do
    v3[v5] = v4;
end;
v1.Levels.fromString = function(v6)
    if type(v6) ~= "string" then
        return nil;
    else
        for _, v8 in pairs(v2) do
            if string.lower(v8) == string.lower(v6) then
                return v8;
            end;
        end;
        return nil;
    end;
end;
v1.new = function(v9, v10)
    local v11 = {
        name = v10, 
        sinks = {}, 
        children = {}, 
        parent = v9, 
        context = {}, 
        dirty = true, 
        active = {}, 
        cache = {
            sinks = {}, 
            context = {}
        }
    };
    for v12, _ in pairs(v1.Levels) do
        if not v9 then
            v11.active[v12] = false;
        else
            v11.active[v12] = v9.active[v12];
        end;
    end;
    if v9 then
        v9.children[v11] = true;
    end;
    setmetatable(v11, v1);
    return v11;
end;
local function v14(v15, v16)
    local v17 = v3[v15];
    if v17 then
        for v18 = 1, v17 do
            v16.active[v2[v18]] = true;
        end;
        for v19, _ in pairs(v16.children) do
            v14(v15, v19);
        end;
    end;
end;
local function v21(v22)
    v22.dirty = true;
    for v23, _ in pairs(v22.children) do
        v21(v23);
    end;
end;
local function v25(v26)
    if v26.dirty then
        if v26.parent then
            v25(v26.parent);
            v26.cache.context = v0.Dictionary.join(v26.parent.cache.context, v26.context);
            if not (not v26.parent.cache.context.prefix or not v26.context.prefix) then
                v26.cache.context.prefix = v26.parent.cache.context.prefix .. v26.context.prefix;
            end;
            v26.cache.sinks = v0.List.join(v26.parent.cache.sinks, v26.sinks);
            v26.dirty = false;
            return ;
        else
            v26.cache.context = v26.context;
            v26.cache.sinks = v26.sinks;
            v26.dirty = false;
            return ;
        end;
    else
        return ;
    end;
end;
v1.setParent = function(v27, v28)
    if v27.parent then
        v27.parent.children[v27] = nil;
    end;
    v25(v28);
    v27.parent = v28;
    v27.parent.children[v27] = true;
    local v29 = -1;
    for _, v31 in pairs(v28.cache.sinks) do
        if v3[v31.maxLevel] then
            v29 = math.max(v29, v3[v31.maxLevel]);
        end;
    end;
    if v29 > -1 then
        v14(v2[v29], v27);
    end;
    v27.dirty = true;
    for v32, _ in pairs(v27.children) do
        v21(v32);
    end;
end;
v1.addSink = function(v34, v35)
    v14(v35.maxLevel, v34);
    table.insert(v34.sinks, v35);
    v34.dirty = true;
    for v36, _ in pairs(v34.children) do
        v21(v36);
    end;
end;
v1.setContext = function(v38, v39)
    v38.context = v39;
    v38.dirty = true;
    for v40, _ in pairs(v38.children) do
        v21(v40);
    end;
end;
local function v57(v42, v43, v44)
    if v43.dirty then
        v25(v43);
    end;
    local v45 = {
        level = v42, 
        rawMessage = v44, 
        loggerName = v43.name
    };
    for v46, v47 in pairs(v43.cache.context) do
        if type(v47) == "function" and v46 ~= "tostring" then
            v45[v46] = v47();
        else
            v45[v46] = v47;
        end;
    end;
    local v48 = v45.tostring or tostring;
    local v49 = nil;
    v49 = v44.n == 0 and "LUMBERYAK INTERNAL: No log message given" or v44[1];
    if v45.prefix then
        v49 = v45.prefix .. v49;
    end;
    if not v49:find("{") then
        if v44.n > 1 then
            v49 = v49 .. "\nLUMBERYAK INTERNAL: Too many arguments given for format string";
        end;
    else
        local v50 = 1;
        do
            local l_v50_0 = v50;
            v49 = v49:gsub("{(.-)}", function(v52)
                if v52 == "" then
                    l_v50_0 = l_v50_0 + 1;
                    return v48(v44[l_v50_0]);
                else
                    local v53 = v45[v52];
                    return v53 and v48(v53);
                end;
            end);
            if l_v50_0 < v44.n then
                v49 = v49 .. "\nLUMBERYAK INTERNAL: Too many arguments given for format string";
            elseif v44.n < l_v50_0 then
                v49 = v49 .. "\nLUMBERYAK INTERNAL: Too few arguments given for format string";
            end;
        end;
    end;
    local v54 = v3[v42];
    for _, v56 in pairs(v43.cache.sinks) do
        if v3[v56.maxLevel] and v54 <= v3[v56.maxLevel] then
            v56:log(v49, v45);
        end;
    end;
end;
v1.error = function(v58, ...)
    if v58.active[v1.Levels.Error] then
        v57(v1.Levels.Error, v58, table.pack(...));
        return ;
    else
        return ;
    end;
end;
v1.warning = function(v59, ...)
    if v59.active[v1.Levels.Warning] then
        v57(v1.Levels.Warning, v59, table.pack(...));
        return ;
    else
        return ;
    end;
end;
v1.info = function(v60, ...)
    if v60.active[v1.Levels.Info] then
        v57(v1.Levels.Info, v60, table.pack(...));
        return ;
    else
        return ;
    end;
end;
v1.debug = function(v61, ...)
    if v61.active[v1.Levels.Debug] then
        v57(v1.Levels.Debug, v61, table.pack(...));
        return ;
    else
        return ;
    end;
end;
v1.trace = function(v62, ...)
    if v62.active[v1.Levels.Trace] then
        v57(v1.Levels.Trace, v62, table.pack(...));
        return ;
    else
        return ;
    end;
end;
return v1;
