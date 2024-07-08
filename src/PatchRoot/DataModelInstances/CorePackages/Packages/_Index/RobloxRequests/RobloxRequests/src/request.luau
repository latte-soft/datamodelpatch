local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_lib_0.url);
local v6 = require(l_Parent_1.Promise);
local v7 = require(l_src_0.json);
local v8 = require(l_src_0.response);
local v9 = require(l_src_0.cookies);
local v10 = require(l_src_0.ratelimit);
local v11 = require(l_src_0.util);
local v12 = require(l_src_0.cache);
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15, v16)
    local v17 = setmetatable({}, v13);
    v16 = v16 or {};
    local v18 = v5.parse(v15);
    local v19 = v16.headers or {};
    v17.method = v14:upper();
    v17.url = v18;
    v17.input_url = v15;
    v17.headers = v19;
    v17.query = {};
    v17.data = nil;
    v17._ratelimits = {
        v10.get("http", 250, 30)
    };
    v17.ignore_ratelimit = v16.ignore_ratelimit or false;
    if v16.data then
        v17:set_data(v16.data);
    end;
    v17:set_query(v16.query or {});
    local v20 = v16.cookies or {};
    if not v20.__cookiejar then
        local v21 = v9.new();
        if v20 then
            for v22, v23 in pairs(v20) do
                v21:insert(v22, v23);
            end;
        end;
        v20 = v21;
    end;
    v17.cookies = v20;
    v17.headers.Cookie = v20:string(v15);
    v17._callback = nil;
    v17._log = v16.log == nil and true or v16.log;
    return v17;
end;
v13.set_headers = function(v24, v25)
    for v26, v27 in pairs(v25) do
        v24.headers[v26] = v27;
    end;
    return v24;
end;
v13.update_headers = v11.deprecate(v13.set_headers, "0.5", "update_headers");
v13.set_query = function(v28, v29)
    for v30, v31 in pairs(v29) do
        v28.query[v30] = v31;
    end;
    v28.url:setQuery(v28.query);
    return v28;
end;
v13.update_query = v11.deprecate(v13.set_headers, "0.5", "update_query");
v13.set_data = function(v32, v33)
    if type(v33) == "table" then
        if not v33.__FormData then
            v33 = v7.enc(v33);
            v32.headers["Content-Type"] = "application/json";
        else
            v32.headers["Content-Type"] = v33.content_type;
            v33 = v33:build();
        end;
    end;
    v32.data = v33;
    return v32;
end;
v13._ratelimit = function(v34)
    for _, v36 in ipairs(v34._ratelimits) do
        if not v36:request() then
            return false;
        end;
    end;
    return true;
end;
v13._send = function(v37)
    local v38 = {
        Url = v37.url:build(), 
        Method = v37.method, 
        Headers = v37.headers
    };
    if v37.data ~= nil then
        v38.Body = v37.data;
    end;
    local v39 = ("Request_%s_%s_%s"):format(v37.method, v38.Url:sub(-1, -1) == "/" and v38.Url:sub(1, -2) or v38.Url, v38.Body or "");
    if not (not (v37.method:upper() == "GET") or not v12.is_cached(v38.Url, v39)) then
        local v40 = tick();
        local v41, v42 = v12.get_cached(v38.Url, v39);
        if v40 - v41.timestamp <= v12.get_expire(v38.Url) then
            local v43 = v8.new(v37, v41, tick() - v40);
            v43.from_cache = true;
            print("[http]", v42:upper(), "CACHE |", v43.method, v43.url);
            return v43;
        end;
    end;
    local v44 = 0;
    local v45 = false;
    local v46 = nil;
    local v47 = nil;
    while v44 < 5 do
        if not v37.ignore_ratelimit and not v37:_ratelimit() then
            warn("[http] Rate limit exceeded. Retrying in 5 seconds");
            v44 = v44 + 1;
            wait(5);
        else
            local v48 = tick();
            v47 = l_HttpService_0:RequestAsync(v38);
            v46 = v8.new(v37, v47, tick() - v48);
            v37.timestamp = v48;
            v45 = true;
            break;
        end;
    end;
    if not v45 then
        error("[http] Rate limit still exceeded after 5 attempts");
    end;
    if v37._log then
        print("[http]", v46.code, v46.message, "|", v46.method, v46.url, "(", tostring(math.floor(v37._ratelimits[#v37._ratelimits]:consumption() * 1000) * 0.1) .. "%", "ratelimit )");
    end;
    if v37._callback then
        v37._callback(v46);
    end;
    if not ((not (v37.method:upper() == "GET") or not v46.ok) or not v12.should_cache(v38.Url)) then
        v12.update_cache(v38.Url, v39, v47);
    end;
    return v46;
end;
v13.send = function(v49, v50)
    if not v50 then
        return v49:_send();
    else
        return v6.new(function(v51, v52)
            local l_status_0, l_result_0 = pcall(v49._send, v49);
            if not (l_status_0 and l_result_0.ok) then
                if not l_status_0 then
                    v52({
                        request_sent = false, 
                        error = l_result_0
                    });
                    return ;
                else
                    v52({
                        request_sent = true, 
                        response = l_result_0
                    });
                    return ;
                end;
            else
                v51(l_result_0);
                return ;
            end;
        end);
    end;
end;
v13.promise = function(v55)
    return v55:send(true);
end;
return v13;
