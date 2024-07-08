local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.HttpError);
local v4 = require(l_Modules_0.LuaApp.Http.HttpResponse);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local function v16(v6, v7, v8)
    local v9 = tick();
    local l_status_0, l_result_0 = pcall(v7, unpack(v8));
    local v12 = (tick() - v9) * 1000;
    local v13 = nil;
    if not l_status_0 then
        v13 = l_StatusCodes_0.UNKNOWN_ERROR;
        local v14 = string.match(l_result_0, ".*%((.*)%)");
        if v14 then
            local v15 = string.find(v14, "%d%d%d");
            if v15 then
                v13 = tonumber((string.sub(v14, v15, v15 + 2)));
                l_result_0 = string.sub(v14, v15 + 4);
            end;
        end;
    else
        v13 = l_StatusCodes_0.OK;
    end;
    return v4.new(v6, l_result_0, v12, v13);
end;
local function _(v17)
    local l_Unknown_0 = v3.Kind.Unknown;
    local l_responseBody_0 = v17.responseBody;
    if v17.responseCode ~= l_StatusCodes_0.UNKNOWN_ERROR then
        local l_responseCode_0 = v17.responseCode;
        if l_responseCode_0 >= 500 then
            l_Unknown_0 = v3.Kind.RequireExternalRetry;
        else
            l_Unknown_0 = v3.Kind.RequestFailure;
            l_responseBody_0 = tostring(l_responseCode_0);
        end;
    end;
    return v3.new(v17.requestUrl, l_Unknown_0, l_responseBody_0);
end;
return function(v22)
    if not v22 then
        v22 = game;
    end;
    return function(v23, v24, v25)
        assert(type(v23) == "string", "Expected url to be a string");
        assert(type(v24) == "string", "Expected requestMethod to be a string");
        v24 = string.upper(v24);
        if v25 then
            assert(type(v25) == "table", "Expected extra args to be a table");
        end;
        if v24 == "POST" then
            assert(v25.postBody, "Expected a postBody to be specified with this request");
            if not v25.contentType then
                v25.contentType = "application/json";
            end;
        end;
        local v26 = nil;
        local v27 = nil;
        if v24 == "GET" then
            v26 = v22.HttpGetAsync;
            v27 = {
                v22, 
                v23
            };
        elseif v24 == "POST" then
            v26 = v22.HttpPostAsync;
            v27 = {
                v22, 
                v23, 
                v25.postBody, 
                v25.contentType
            };
        else
            error(string.format("Unsupported requestMethod : %s", v24 or "nil"));
        end;
        return (v2.new(function(v28, v29)
            spawn(function()
                local v30 = v16(v23, v26, v27);
                if v30.responseCode == l_StatusCodes_0.OK then
                    v28(v30);
                    return ;
                else
                    local l_Unknown_1 = v3.Kind.Unknown;
                    local l_responseBody_1 = v30.responseBody;
                    if v30.responseCode ~= l_StatusCodes_0.UNKNOWN_ERROR then
                        local l_responseCode_1 = v30.responseCode;
                        if l_responseCode_1 >= 500 then
                            l_Unknown_1 = v3.Kind.RequireExternalRetry;
                        else
                            l_Unknown_1 = v3.Kind.RequestFailure;
                            l_responseBody_1 = tostring(l_responseCode_1);
                        end;
                    end;
                    v29((v3.new(v30.requestUrl, l_Unknown_1, l_responseBody_1)));
                    return ;
                end;
            end);
        end));
    end;
end;
