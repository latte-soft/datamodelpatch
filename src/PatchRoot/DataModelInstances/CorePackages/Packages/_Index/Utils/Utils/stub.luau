local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local v3 = require(l_Parent_0.GraphQL);
local l_GraphQLObjectType_0 = v3.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v3.GraphQLInterfaceType;
local l_GraphQLInputObjectType_0 = v3.GraphQLInputObjectType;
local l_GraphQLString_0 = v3.GraphQLString;
local l_GraphQLInt_0 = v3.GraphQLInt;
local l_GraphQLFloat_0 = v3.GraphQLFloat;
local l_GraphQLBoolean_0 = v3.GraphQLBoolean;
local l_GraphQLID_0 = v3.GraphQLID;
local l_Kind_0 = v3.Kind;
local l_GraphQLList_0 = v3.GraphQLList;
local l_GraphQLNonNull_0 = v3.GraphQLNonNull;
local function v18(v15, v16)
    local _ = nil;
    return (if v16 == "object" then l_GraphQLObjectType_0 else if v16 == "interface" then l_GraphQLInterfaceType_0 else l_GraphQLInputObjectType_0).new({
        name = v15, 
        fields = {
            _fake = {
                type = l_GraphQLString_0
            }
        }
    });
end;
v2.createNamedStub = v18;
local function v19(v20, v21)
    local l_kind_0 = v20.kind;
    if l_kind_0 == l_Kind_0.LIST_TYPE then
        return l_GraphQLList_0.new(v19(v20.type, v21));
    elseif l_kind_0 == l_Kind_0.NON_NULL_TYPE then
        return l_GraphQLNonNull_0.new(v19(v20.type, v21));
    elseif v21 == "output" then
        return v18(v20.name.value, "object");
    else
        return v18(v20.name.value, "input");
    end;
end;
v2.createStub = v19;
v2.isNamedStub = function(v23)
    if v23.getFields ~= nil then
        local v24 = v23:getFields();
        for _, v26 in v24, nil, nil do
            return v24[tostring((table.unpack(v26)))].name == "_fake";
        end;
    end;
    return false;
end;
v2.getBuiltInForStub = function(v27)
    local l_name_0 = v27.name;
    if l_name_0 == l_GraphQLInt_0.name then
        return l_GraphQLInt_0;
    elseif l_name_0 == l_GraphQLFloat_0.name then
        return l_GraphQLFloat_0;
    elseif l_name_0 == l_GraphQLString_0.name then
        return l_GraphQLString_0;
    elseif l_name_0 == l_GraphQLBoolean_0.name then
        return l_GraphQLBoolean_0;
    elseif l_name_0 == l_GraphQLID_0.name then
        return l_GraphQLID_0;
    else
        return v27;
    end;
end;
return v2;
