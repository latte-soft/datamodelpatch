local _ = require(script.Parent.Parent.LuauPolyfill);
local l_Headers_0 = require(script.Parent.Headers).Headers;
local l_Body_0 = require(script.Parent.Body).Body;
local v3 = setmetatable({}, {
    __index = l_Body_0
});
v3.__index = v3;
v3.new = function(v4, v5)
    local v6 = v5 or {};
    local v7 = setmetatable(l_Body_0.new(v4), v3);
    v7.status = v6.status or 200;
    v7.statusText = v6.statusText or "";
    v7.headers = l_Headers_0.new(v6.headers or {});
    v7.headers.guard = "response";
    v7.type = "text";
    v7.url = "";
    v7.redirected = false;
    local v8 = false;
    if v7.status >= 200 then
        v8 = v7.status < 300;
    end;
    v7.ok = v8;
    return v7;
end;
v3.error = function()
    local v9 = v3.new(nil, {
        status = 0
    });
    v9.type = "error";
    return v9;
end;
v3.redirect = function(_, _)
    error("Response.redirect not implemented");
end;
v3.STATIC_json = function(_, _)
    error("Response.json static method not implemented");
end;
v3.clone = function(v14)
    return v3.new(v14.body, {
        status = v14.status, 
        statusText = v14.statusText, 
        headers = v14.headers.headerList
    });
end;
return {
    Response = v3
};
