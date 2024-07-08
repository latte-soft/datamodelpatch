local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local _ = l_Parent_0.src;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_lib_0.mimetypes);
local v5 = require(l_lib_0.b64);
local function v9(v6)
    local v7 = "";
    for _ = 1, v6 do
        v7 = v7 .. string.char(math.random(97, 122));
    end;
    return v7;
end;
local v10 = {};
v10.__index = v10;
v10.new = function(...)
    local v11 = setmetatable({}, v10);
    v11.__IsFile = true;
    v11.name = "unknown";
    v11.content = "";
    v11.content_type = nil;
    local v12 = {
        ...
    };
    if #v12 == 1 then
        v11.content = v12[1];
    elseif #v12 >= 2 then
        v11.name = v12[1];
        v11.content = v12[2];
        v11.content_type = v12[3];
    end;
    if not v11.content_type then
        local v13 = v11.name:split(".");
        v11.content_type = v4[v13[#v13]:lower()] or "text/plain";
    end;
    if type(v11.content) ~= "string" then
        error(("[http] Invalid file content for file %s"):format(v11.name));
    end;
    return v11;
end;
v10.__tostring = function(v14)
    return ("File('%s', '%s')"):format(v14.name, v14.content_type);
end;
local v15 = {};
v15.__index = v15;
v15.new = function(v16)
    local v17 = setmetatable({}, v15);
    v17.__FormData = true;
    v16 = v16 or {};
    v17.boundary = "--FormBoundary-" .. v9(28);
    v17.content_type = "application/x-www-form-urlencoded";
    v17.fields = {};
    for v18, v19 in pairs(v16) do
        v17:AddField(v18, v19);
    end;
    return v17;
end;
v15.AddField = function(v20, v21, v22)
    if v22.__IsFile then
        v20.content_type = "multipart/form-data; boundary=\"" .. v20.boundary .. "\"";
    end;
    table.insert(v20.fields, {
        Name = v21, 
        Value = v22
    });
end;
v15.build = function(v23)
    local v24 = "";
    if v23.content_type == "application/x-www-form-urlencoded" then
        for _, v26 in ipairs(v23.fields) do
            if v26.Value.__IsFile then
                error("[http] URL encoded forms cannot contain any files");
            end;
            if not (not v26.Name:find("=") and not v26.Name:find("&")) then
                error("[http] Form field names must not contain '=' or '&'");
            end;
            if type(v26.Value) == "table" then
                for _, v28 in ipairs(v26.Value) do
                    if #v24 > 0 then
                        v24 = v24 .. "&";
                    end;
                    v24 = v24 .. v26.Name .. "=" .. l_HttpService_0:UrlEncode(v28);
                end;
            else
                if #v24 > 0 then
                    v24 = v24 .. "&";
                end;
                v24 = v24 .. v26.Name .. "=" .. l_HttpService_0:UrlEncode(v26.Value);
            end;
        end;
        return v24;
    else
        for _, v30 in pairs(v23.fields) do
            v24 = v24 .. "--" .. v23.boundary .. "\r\n";
            local l_Value_0 = v30.Value;
            v24 = v24 .. ("Content-Disposition: form-data; name=\"%s\""):format(v30.Name);
            if v30.Value.__IsFile then
                l_Value_0 = v30.Value.content;
                v24 = v24 .. ("; filename=\"%s\""):format(v30.Value.name) .. "\r\nContent-Type: " .. v30.Value.content_type;
                if v30.Value.content_type:sub(1, 5) ~= "text/" then
                    l_Value_0 = v5.encode(l_Value_0);
                    v24 = v24 .. "\r\nContent-Transfer-Encoding: base64";
                end;
            end;
            v24 = v24 .. "\r\n\r\n" .. l_Value_0 .. "\r\n";
        end;
        return v24 .. "--" .. v23.boundary .. "--";
    end;
end;
return {
    FormData = v15, 
    File = v10
};
