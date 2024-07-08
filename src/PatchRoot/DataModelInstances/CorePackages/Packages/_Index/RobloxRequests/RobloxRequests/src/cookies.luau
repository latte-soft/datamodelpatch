local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local v2 = require(l_Parent_0.src.json);
local v3 = require(l_lib_0.url);
local function _(v4)
    return tonumber(v4) or v4;
end;
local function v7(v6)
    v6 = v6 or "";
    while v6:sub(1, 1) == " " do
        v6 = v6:sub(2);
    end;
    while v6:sub(-1, -1) == " " do
        v6 = v6:sub(1, -2);
    end;
    return v6;
end;
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10, v11)
    local v12 = setmetatable({}, v8);
    v11 = v11 or {};
    v12.name = v9;
    v12.value = v10;
    v12.domain = v11.domain or "";
    v12.path = v11.path or "";
    return v12;
end;
v8.fromSet = function(v13)
    local v14 = {};
    local v15 = v13:split(";");
    local v16 = v15[1]:split("=");
    local v17 = v7(v16[1]);
    local v18 = v7(v16[2]);
    for v19 = 2, #v15 do
        local v20 = v15[v19]:split("=");
        v14[v7(v20[1]):lower()] = v7(v20[2]);
    end;
    return v8.new(v17, v18, v14);
end;
v8.matches = function(v21, v22)
    if v21.domain then
        local v23 = v3.parse(v22);
        if v21.domain:sub(1, 1) == "." then
            if v23.host:sub(-#v21.domain, -1) ~= v21.domain and v23.host ~= v21.domain:sub(2) then
                return false;
            end;
        elseif v23.host ~= v21.domain then
            return false;
        end;
        if v21.path and not v23.path:sub(1, #v21.path) == v21.path then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local v24 = {};
v24.__index = v24;
v24.new = function()
    local v25 = setmetatable({}, v24);
    v25.__cookiejar = true;
    v25.cookies = {};
    return v25;
end;
v24.insert = function(v26, v27, v28, v29)
    v26.cookies[v27] = v8.new(v27, v28, v29);
    return v26;
end;
v24.SetCookie = function(v30, v31)
    local v32 = v8.fromSet(v31);
    v30.cookies[v32.name] = v32;
end;
v24.delete = function(v33, v34)
    v33.cookies[v34] = nil;
end;
v24.string = function(v35, _)
    local v37 = "";
    for _, v39 in pairs(v35.cookies) do
        if v37 then
            v37 = v37 .. "; ";
        end;
        v37 = v37 .. ("%s=%s"):format(v39.name, v39.value);
    end;
    return v37;
end;
v24.__tostring = function(v40)
    return v2.enc(v40.domains);
end;
return v24;
