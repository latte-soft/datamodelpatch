local l_Parent_0 = script.Parent.Parent;
local _ = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local v3 = require(l_src_0.request);
local v4 = require(l_src_0.cookies);
local v5 = require(l_src_0.ratelimit);
local v6 = require(l_src_0.util);
local function v10(v7)
    local v8 = "";
    for _ = 1, v7 do
        v8 = v8 .. string.char(math.random(97, 122));
    end;
    return v8;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12)
    local v13 = setmetatable({}, v11);
    v13.headers = {};
    v13.cookies = v4.new();
    v13.base_url = v12 or "";
    v13._ratelimit = nil;
    v13.ignore_ratelimit = false;
    v13.before_request = nil;
    v13.after_request = nil;
    v13.no_stats = false;
    v13.log = true;
    return v13;
end;
v11.set_ratelimit = function(v14, v15, v16)
    if not v15 then
        v14:disable_ratelimit();
    end;
    v16 = v16 or 60;
    if v14._ratelimit then
        v5.ratelimit[v14._ratelimit.id] = nil;
    end;
    v14._ratelimit = v5.get("http.session-" .. v10(12), v15, v16);
end;
v11.disable_ratelimit = function(v17)
    if v17._ratelimit then
        v5.ratelimit[v17._ratelimit.id] = nil;
        v17._ratelimit = nil;
    end;
end;
v11.set_headers = function(v18, v19)
    for v20, v21 in pairs(v19) do
        v18.headers[v20] = v21;
    end;
    return v18;
end;
v11.Request = function(v22, v23, v24, v25)
    v25 = v25 or {};
    if v24:sub(1, 7) ~= "http://" and v24:sub(1, 8) ~= "https://" then
        v24 = v22.base_url .. v24;
    end;
    local l_log_0 = v22.log;
    if v25.log ~= nil then
        l_log_0 = v25.log;
    end;
    local v27 = v3.new(v23, v24, {
        headers = v22.headers, 
        query = v25.query, 
        data = v25.data, 
        log = l_log_0, 
        cookies = v25.cookies or v22.cookies, 
        ignore_ratelimit = v25.ignore_ratelimit or v22.ignore_ratelimit, 
        no_stats = v22.no_stats or false
    });
    if v22._ratelimit then
        table.insert(v27._ratelimits, v22._ratelimit);
    end;
    v27:set_headers(v25.headers or {});
    v27._callback = function(v28)
        for _, v30 in ipairs(v28.cookies.cookies) do
            table.insert(v22.cookies.cookies, v30);
        end;
    end;
    return v27;
end;
v11.request = function(v31, v32, v33, v34)
    return v31:Request(v32, v33, v34 or {}):send();
end;
v11.send = v6.deprecate(v11.request, "0.5", "Session:send");
v11.promise_request = function(v35, v36, v37, v38)
    return v35:Request(v36, v37, v38 or {}):send(true);
end;
v11.promise_send = v6.deprecate(v11.promise_request, "0.5", "Session:promise_send");
for _, v40 in pairs({
    "GET", 
    "POST", 
    "HEAD", 
    "OPTIONS", 
    "PUT", 
    "DELETE", 
    "PATCH"
}) do
    v11[v40:lower()] = function(v41, v42, v43)
        return v41:send(v40, v42, v43);
    end;
    v11["promise_" .. v40:lower()] = function(v44, v45, v46)
        return v44:promise_send(v40, v45, v46);
    end;
end;
return v11;
