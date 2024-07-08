local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.LuaApp.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v6 = {};
local function v12(v7, v8)
    local v9 = {};
    for v10, v11 in pairs(v7) do
        v9[v10] = v8(v11, v10);
    end;
    return v9;
end;
local function _(v13, v14)
    if type(v14._collectionFormat) ~= "table" then
        return v13;
    else
        return (v12(v13, function(v15, v16)
            if v14._collectionFormat[v16] == "csv" then
                return table.concat(v15, ",");
            else
                return v15;
            end;
        end));
    end;
end;
local function v23(v18, v19)
    local v20 = nil;
    if type(v19) == "table" then
        v20 = {};
        for _, v22 in ipairs(v19) do
            v20[v22] = v18[v22];
            if v20[v22] == nil then
                v20[v22] = "##NULL##TOKEN##";
            end;
        end;
    elseif type(v19) == "string" then
        v20 = v18[v19];
    else
        return nil;
    end;
    return (string.gsub(l_HttpService_0:JSONEncode(v20), "\"" .. "##NULL##TOKEN##" .. "\"", "null"));
end;
v6.endpoint = function(v24, v25)
    return function(v26, v27)
        v4.matchesInterface(v27, v24.input, "input", v25);
        local l_v27_0 = v27;
        local l_input_0 = v24.input;
        local l_l_input_0_0 = l_input_0 --[[ copy: 3 -> 4 ]];
        v27 = if type(l_input_0._collectionFormat) ~= "table" then l_v27_0 else v12(l_v27_0, function(v31, v32)
            if l_l_input_0_0._collectionFormat[v32] == "csv" then
                return table.concat(v31, ",");
            else
                return v31;
            end;
        end);
        l_v27_0 = v5.fromString(v24.url)(v27);
        l_input_0 = {};
        if v24.body then
            l_input_0.postBody = v23(v27, v24.body);
        end;
        return v26(l_v27_0, v24.method, l_input_0):andThen(function(v33)
            v4.matchesInterface(v33.responseBody, v24.output, "output", v25);
            return v33;
        end);
    end;
end;
v6.new = function(v34)
    local l_definitions_0 = v34.definitions;
    return (v12(v34.endpoints, function(v36)
        return v6.endpoint(v36, l_definitions_0);
    end));
end;
return v6;
