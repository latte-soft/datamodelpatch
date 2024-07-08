local l_Parent_0 = script.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_HttpService_0 = game:GetService("HttpService");
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local _ = require(l_language_0.ast);
local _ = require(l_language_0.source);
local l_getLocation_0 = require(l_language_0.location).getLocation;
local v11 = require(l_language_0.printLocation);
local l_printLocation_0 = v11.printLocation;
local l_printSourceLocation_0 = v11.printSourceLocation;
local v14 = nil;
local v15 = nil;
local v16 = setmetatable({}, {
    __index = l_Error_0
});
v16.__index = v16;
v16.__tostring = function(v17)
    return v14(v17);
end;
v16.new = function(v18, v19, v20, v21, v22, v23, v24)
    local v25 = l_Error_0.new(v18);
    v25.name = "GraphQLError";
    v25.originalError = v23;
    v25.nodes = v15(if not l_Array_0.isArray(v19) then if v19 then {
        v19
    } else nil else v19);
    local v26 = {};
    if v25.nodes then
        for _, v28 in ipairs(v25.nodes) do
            local l_loc_0 = v28.loc;
            if l_loc_0 ~= nil then
                table.insert(v26, l_loc_0);
            end;
        end;
    end;
    v26 = v15(v26);
    v25.source = if not v20 then if v26 == nil then nil else v26[1].source else v20;
    v25.positions = if not v21 then if v26 then l_Array_0.map(v26, function(v30)
        return v30.start;
    end) else nil else v21;
    v25.locations = if not not v21 and v20 then l_Array_0.map(v21, function(v31)
        return l_getLocation_0(v20, v31);
    end) else if v26 then l_Array_0.map(v26, function(v32)
        return l_getLocation_0(v32.source, v32.start);
    end) else nil;
    v25.path = v22 or nil;
    local v33 = if v23 then v23.extensions else nil;
    if not (v24 == nil) or not l_isObjectLike_0(v33) then
        v25.extensions = v24 or nil;
    else
        v25.extensions = l_Object_0.assign({}, v33);
    end;
    if not (not v23 or not v23.stack) then
        v25.stack = v23.stack;
    end;
    return (setmetatable(v25, v16));
end;
v16.toString = function(v34)
    return v14(v34);
end;
v16.toJSON = function(v35)
    local v36 = {
        "message"
    };
    if v35.locations ~= nil then
        table.insert(v36, "locations");
    end;
    if v35.path ~= nil then
        table.insert(v36, "path");
    end;
    if v35.extensions ~= nil then
        table.insert(v36, "extensions");
    end;
    return "{" .. l_Array_0.join(l_Array_0.map(v36, function(v37)
        return l_HttpService_0:JSONEncode(v37) .. ":" .. l_HttpService_0:JSONEncode(v35[v37]);
    end), ",") .. "}";
end;
v15 = function(v38)
    if not (v38 ~= nil) or #v38 == 0 then
        return nil;
    else
        return v38;
    end;
end;
v14 = function(v39)
    local l_message_0 = v39.message;
    if v39.nodes ~= nil then
        for v41 = 1, #v39.nodes do
            local v42 = v39.nodes[v41];
            if v42.loc ~= nil then
                l_message_0 = l_message_0 .. "\n\n" .. l_printLocation_0(v42.loc);
            end;
        end;
        return l_message_0;
    else
        if v39.source ~= nil and v39.locations ~= nil then
            for v43 = 1, #v39.locations do
                l_message_0 = l_message_0 .. "\n\n" .. l_printSourceLocation_0(v39.source, v39.locations[v43]);
            end;
        end;
        return l_message_0;
    end;
end;
return {
    printError = v14, 
    GraphQLError = v16
};
