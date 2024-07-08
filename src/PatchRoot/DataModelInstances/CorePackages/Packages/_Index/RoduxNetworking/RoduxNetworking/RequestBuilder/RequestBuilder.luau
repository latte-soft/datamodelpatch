local v0 = require(script.Parent.Cryo);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4)
    return (setmetatable({
        ids = v1.makeArray(v3), 
        delimiter = v4
    }, v2));
end;
v1.setIds = function(v5, v6)
    v5.ids = v1.makeArray(v6);
end;
v1.makeArray = function(v7)
    if type(v7) == "table" then
        return v7;
    else
        return {
            v7
        };
    end;
end;
v1.__tostring = function(v8)
    return table.concat(v8.ids, v8.delimiter);
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12)
    return (setmetatable({
        baseUrl = v11:gsub("/*$", ""), 
        keyMapper = nil, 
        args = {}, 
        pathElements = {}, 
        configurableIds = nil, 
        namedIds = {}, 
        idsDelimiter = ",", 
        options = {
            queryArgs = nil, 
            postBody = nil
        }, 
        useExpandedForm = {}, 
        statusIds = nil, 
        additionalData = v12 or {}
    }, v10));
end;
v9.path = function(v13, v14)
    table.insert(v13.pathElements, (v14:gsub("^/", ""):gsub("/$", "")));
    return v13;
end;
v9.id = function(v15, v16, v17)
    if not v17 and #v15.pathElements < 1 then
        warn("Cannot name id or ids because there is no leading path segment and no name is provided");
    end;
    v15.namedIds[v17 or v15.pathElements[#v15.pathElements]] = v16;
    v15.configurableIds = v1:new(v16, v15.idsDelimiter);
    table.insert(v15.pathElements, v15.configurableIds);
    return v15;
end;
v9.queryArgWithIds = function(v18, v19, v20)
    local v21 = v0.List.join(v20, v18.namedIds[v19] or {});
    v18.namedIds[v19] = v21;
    v18.configurableIds = v1:new(v21, v18.idsDelimiter);
    v18.args = v0.Dictionary.join(v18.args, {
        [v19] = v18.configurableIds
    });
    return v18;
end;
v9.expandedQueryArgsWithIds = function(v22, v23, v24)
    v22.useExpandedForm[v23] = true;
    v22:queryArgWithIds(v23, v24);
    return v22;
end;
v9.queryArgs = function(v25, v26)
    v25.args = v0.Dictionary.join(v25.args, v26);
    v25.options.queryArgs = v0.Dictionary.join(v26, v25.options.queryArgs or {});
    return v25;
end;
v9.body = function(v27, v28)
    v27.options.postBody = v28;
    return v27;
end;
v9.makeKeyMapper = function(v29)
    return function(v30)
        return not not v29:getStatusIds() and v29:makeStatusUrl(v30) or v29:makeNamedIdsUrl(v30);
    end;
end;
v9._normalize = function(_, v32)
    return v32:gsub("/+", "/");
end;
v9.makeUri = function(v33)
    local v34 = "";
    for _, v36 in ipairs(v33.pathElements) do
        v34 = v34 .. "/" .. tostring(v36);
    end;
    return v33:_normalize(v34);
end;
local function v37(v38, v39, v40, v41)
    if not v41 then
        local v42 = tostring(v39) .. "=" .. tostring(v40);
        if v38:len() > 1 then
            return v38 .. "&" .. v42;
        else
            return v42;
        end;
    else
        for _, v44 in pairs(v40.ids) do
            v38 = v37(v38, v39, v44);
        end;
        return v38;
    end;
end;
v9.makeQueryArgs = function(v45, v46, v47)
    v45:_plugInConfigurableIds(v46);
    local v48 = "";
    for v49, v50 in pairs(v45.args) do
        if not (not (v47 and v45.namedIds[v49]) and v47) then
            v48 = v37(v48, v49, v50, v45.useExpandedForm[v49]);
        end;
    end;
    if v48:len() > 1 then
        return "?" .. v48;
    else
        return "";
    end;
end;
v9.makeUrl = function(v51, v52, v53)
    v51:_plugInConfigurableIds(v52);
    return v51.baseUrl .. v51:makeUri() .. v51:makeQueryArgs(v52, v53);
end;
v9.makeStatusUrl = function(v54, v55)
    local v56 = v54.baseUrl .. v54:makeUri();
    if v55 then
        v55 = type(v55) == "table" and v55 or {
            v55
        };
        local v57 = "";
        for v58, v59 in pairs(v55) do
            v57 = v58 > 1 and v57 .. "&" .. v59 or v59;
        end;
        return v56 .. "?" .. v57;
    else
        return v56;
    end;
end;
v9.makeNamedIdsUrl = function(v60, v61)
    return v60:makeUrl(v61, true);
end;
v9.makeOptions = function(v62)
    return v62.options;
end;
v9._plugInConfigurableIds = function(v63, v64)
    if not (not (v64 ~= nil) or not v63.configurableIds) then
        v63.configurableIds:setIds(v64);
    end;
end;
v9.getIds = function(v65)
    if not v65.configurableIds or not v65.configurableIds.ids then
        if not v65.statusIds then
            return {};
        else
            return v65.statusIds;
        end;
    else
        return v65.configurableIds.ids;
    end;
end;
v9.getNamedIds = function(v66)
    return v66.namedIds;
end;
v9.setStatusIds = function(v67, v68)
    if not v67.configurableIds then
        v67.statusIds = v0.List.join(v67.statusIds or {}, v68);
        return v67;
    else
        warn("Cannot set statusIds because ids already provided in URl");
        return v67;
    end;
end;
v9.getStatusIds = function(v69)
    if not v69.configurableIds then
        return v69.statusIds;
    else
        return nil;
    end;
end;
v9.getAdditionalData = function(v70)
    return v70.additionalData or {};
end;
return v9;
