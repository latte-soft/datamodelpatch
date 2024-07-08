local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local v3 = require(l_lib_0.nocasetable);
local v4 = require(l_lib_0.html);
local v5 = require(l_src_0.json);
local v6 = require(l_src_0.cookies);
local v7 = {
    "text/html", 
    "application/xhtml+xml"
};
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10, v11)
    local v12 = setmetatable({}, v8);
    v12.request = v9;
    v12.response_time = v11;
    v12.timestamp = v12.request.timestamp;
    v12.url = v9.url;
    v12.method = v9.method;
    v12.code = v10.StatusCode;
    v12.status_code = v10.StatusCode;
    v12.success = v10.Success;
    local v13 = false;
    if v12.status_code >= 200 then
        v13 = v12.status_code < 300;
    end;
    v12.ok = v13;
    v12.message = v10.StatusMessage;
    v12.headers = v3(v10.Headers);
    v12.content = v10.Body;
    v12.text = v10.Body;
    v12.headers["content-type"] = v12.headers["content-type"] or "text/plain";
    v12.from_cache = false;
    v13 = v12.headers["content-type"]:split(";");
    v12.content_type = v13[1]:lower();
    v12.encoding = not not v13[2] and v13[2]:split("=")[2] or "";
    v12.content_length = #v12.text;
    v12.cookies = v6.new();
    if v12.headers["set-cookie"] then
        v12.cookies:SetCookie(v12.headers["set-cookie"]);
    end;
    return v12;
end;
v8.expand = function(_)
end;
v8.__tostring = function(v15)
    return v15.text;
end;
v8.json = function(v16)
    local l_status_0, l_result_0 = pcall(function()
        return v5.dec(v16.text);
    end);
    if not l_status_0 then
        error(("[http] Failed to convert response content to JSON:\n%s"):format(v16.text));
    end;
    return l_result_0;
end;
v8.html = function(v19, v20)
    if not v20 and not table.find(v7, v19.content_type) then
        error("[http] Response is not specified as HTML.");
        return ;
    else
        return v4.parse(v19.text, 100000, (tostring(v19.url)));
    end;
end;
v8.xml = function(v21, v22)
    if not (v22 or v21.content_type:find("+xml")) and not v21.content_type:find("/xml") then
        error("[http] Response is not specified as XML.");
        return ;
    else
        return v4.parse(v21.text, 100000);
    end;
end;
return v8;
