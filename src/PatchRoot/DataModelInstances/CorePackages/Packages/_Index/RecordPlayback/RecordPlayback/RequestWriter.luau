local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Parent.HttpServiceMock);
local _ = require(l_Parent_0.Location);
local v3 = require(l_Parent_0.File);
local v4 = require(l_Parent_0.PathUtils);
local v5 = require(l_Parent_0.RequestFormatter);
local v6 = require(l_Parent_0.LuauModuleSerializer);
local v7 = require(l_Parent_0.UrlUtils);
local v8 = {};
local v9 = {
    __index = v8
};
v8.new = function(v10)
    return (setmetatable({
        _location = v10, 
        _createFile = v3.new, 
        _formatter = v5.new(), 
        _serializer = v6.new(), 
        _requestCounter = 0
    }, v9));
end;
v8.writeResponse = function(v11, v12, v13)
    v11:_writeObject(v11:_getRequestLocation(v12), {
        request = v11._formatter:formatRequest(v12), 
        response = v11._formatter:formatResponse(v13)
    });
end;
v8.writeError = function(v14, v15, v16)
    v14:_writeObject(v14:_getRequestLocation(v15), {
        request = v14._formatter:formatRequest(v15), 
        error = v16
    });
end;
v8._writeObject = function(v17, v18, v19)
    v17._createFile(v18):write((v17._serializer:serialize(v19)));
end;
v8._getRequestLocation = function(v20, v21)
    v20._requestCounter = v20._requestCounter + 1;
    local v22 = v7.parse(v21.Url);
    local l_host_0 = v22.host;
    local l_path_0 = v22.path;
    if l_host_0 == nil then
        local v25 = v22.path:find("/");
        if not v25 then
            l_host_0 = v22.path;
            l_path_0 = "";
        else
            l_host_0 = v22.path:sub(1, v25 - 1);
            l_path_0 = v22.path:sub(v25 + 1);
        end;
    end;
    local v26 = "";
    if l_path_0 ~= "/" and l_path_0 ~= "" then
        v26 = if l_path_0:sub(1, 1) == "/" then v26 .. l_path_0:sub(2) .. "-" else v26 .. l_path_0 .. "-";
    end;
    v26 = v26 .. v21.Method;
    if next(v22.query) ~= nil then
        v26 = v26 .. "-" .. v7.formatQuery(v22.query);
    end;
    return v20._location:join(v4.sanitizeFileName(l_host_0), v4.sanitizeFileName(v26) .. ("-%d.lua"):format(v20._requestCounter));
end;
return v8;
