local l_lib_0 = script.lib;
local l_src_0 = script.src;
local v2 = require(l_lib_0.html);
local v3 = require(l_src_0.request);
local v4 = require(l_src_0.session);
local v5 = require(l_src_0.form);
local v6 = require(l_src_0.ratelimit);
local v7 = require(l_src_0.util);
local v8 = require(l_src_0.fetch);
local v12 = {
    VERSION = "0.5.4", 
    Request = v3.new, 
    Session = v4.new, 
    FormData = v5.FormData.new, 
    File = v5.File.new, 
    cache = require(l_src_0.cache), 
    request = function(v9, v10, v11)
        return v3.new(v9, v10, v11 or {}):send();
    end
};
v12.send = v7.deprecate(v12.request, "0.5", "http.send");
v12.promise_request = function(v13, v14, v15)
    return v3.new(v13, v14, v15 or {}):send(true);
end;
v12.promise_send = v7.deprecate(v12.promise_request, "0.5", "http.promise_send");
v12.fetch = v8(v12.promise_request);
for _, v17 in pairs({
    "GET", 
    "POST", 
    "HEAD", 
    "OPTIONS", 
    "PUT", 
    "DELETE", 
    "PATCH"
}) do
    v12[v17:lower()] = function(v18, v19)
        return v12.request(v17, v18, v19);
    end;
    v12["promise_" .. v17:lower()] = function(v20, v21)
        return v12.promise_request(v17, v20, v21);
    end;
end;
v12.set_ratelimit = function(v22, v23)
    local v24 = v6.get("http", v22, v23);
    print("[http] RateLimiter settings changed: ", v24.rate, "reqs /", v24.window_size, "secs");
end;
v12.parse_html = function(v25, v26)
    return v2.parse(v25, 100000, v26);
end;
v12.parse_xml = v12.parse_html;
return v12;
