local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_coerceToMap_0 = v1.coerceToMap;
local v7 = require(l_Parent_0.luaUtils.null);
local v8 = l_Object_0.freeze({});
local l_isNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNillish;
local l_jsutils_0 = l_Parent_0.jsutils;
local _ = require(l_jsutils_0.ObjMap);
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_keyMap_0 = require(l_jsutils_0.keyMap).keyMap;
local l_toObjMap_0 = require(l_jsutils_0.toObjMap).toObjMap;
local l_keyValMap_0 = require(l_jsutils_0.keyValMap).keyValMap;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local v17 = require(l_jsutils_0.instanceOf);
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_identityFunc_0 = require(l_jsutils_0.identityFunc).identityFunc;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local _ = require(l_jsutils_0.PromiseOrValue);
local _ = require(l_jsutils_0.Path);
local l_mapValueOrdered_0 = require(l_Parent_0.luaUtils.mapValueOrdered).mapValueOrdered;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local _ = require(l_Parent_0.language.ast);
local l_valueFromASTUntyped_0 = require(l_Parent_0.utilities.valueFromASTUntyped).valueFromASTUntyped;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = {};
local v81 = {};
local v82 = {};
local v83 = {};
local v84 = {};
local v85 = {};
v31 = function(v86)
    return ((((((v33(v86) or v35(v86)) or v37(v86)) or v39(v86)) or v41(v86)) or v43(v86)) or v45(v86)) or v47(v86);
end;
v32 = function(v87)
    if not v31(v87) then
        error(l_Error_0.new(("Expected %s to be a GraphQL type."):format(l_inspect_0(v87))));
    end;
    return v87;
end;
v33 = function(v88)
    return v17(v88, v80);
end;
v34 = function(v89)
    if not v33(v89) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Scalar type."):format(l_inspect_0(v89))));
    end;
    return v89;
end;
v35 = function(v90)
    return v17(v90, v81);
end;
v36 = function(v91)
    if not v35(v91) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Object type."):format(l_inspect_0(v91))));
    end;
    return v91;
end;
v37 = function(v92)
    return v17(v92, v82);
end;
v38 = function(v93)
    if not v37(v93) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Interface type."):format(l_inspect_0(v93))));
    end;
    return v93;
end;
v39 = function(v94)
    return v17(v94, v83);
end;
v40 = function(v95)
    if not v39(v95) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Union type."):format(l_inspect_0(v95))));
    end;
    return v95;
end;
v41 = function(v96)
    return v17(v96, v84);
end;
v42 = function(v97)
    if not v41(v97) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Enum type."):format(l_inspect_0(v97))));
    end;
    return v97;
end;
v43 = function(v98)
    return v17(v98, v85);
end;
v44 = function(v99)
    if not v43(v99) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Input Object type."):format(l_inspect_0(v99))));
    end;
    return v99;
end;
v45 = function(v100)
    return v17(v100, v78);
end;
v46 = function(v101)
    if not v45(v101) then
        error(l_Error_0.new(("Expected %s to be a GraphQL List type."):format(l_inspect_0(v101))));
    end;
    return v101;
end;
v47 = function(v102)
    return v17(v102, v79);
end;
v48 = function(v103)
    if not v47(v103) then
        error(l_Error_0.new(("Expected %s to be a GraphQL Non-Null type."):format(l_inspect_0(v103))));
    end;
    return v103;
end;
v49 = function(v104)
    return ((v33(v104) or v41(v104)) or v43(v104)) or v59(v104) and v49(v104.ofType);
end;
v50 = function(v105)
    if not v49(v105) then
        error(l_Error_0.new(("Expected %s to be a GraphQL input type."):format(l_inspect_0(v105))));
    end;
    return v105;
end;
v51 = function(v106)
    return ((((v33(v106) or v35(v106)) or v37(v106)) or v39(v106)) or v41(v106)) or v59(v106) and v51(v106.ofType);
end;
v52 = function(v107)
    if not v51(v107) then
        error(l_Error_0.new(("Expected %s to be a GraphQL output type."):format(l_inspect_0(v107))));
    end;
    return v107;
end;
v53 = function(v108)
    return v33(v108) or v41(v108);
end;
v54 = function(v109)
    if not v53(v109) then
        error(l_Error_0.new(("Expected %s to be a GraphQL leaf type."):format(l_inspect_0(v109))));
    end;
    return v109;
end;
v55 = function(v110)
    return (v35(v110) or v37(v110)) or v39(v110);
end;
v56 = function(v111)
    if not v55(v111) then
        error(l_Error_0.new(("Expected %s to be a GraphQL composite type."):format(l_inspect_0(v111))));
    end;
    return v111;
end;
v57 = function(v112)
    return v37(v112) or v39(v112);
end;
v58 = function(v113)
    if not v57(v113) then
        error(l_Error_0.new(("Expected %s to be a GraphQL abstract type."):format(l_inspect_0(v113))));
    end;
    return v113;
end;
v78 = {};
v78.__index = v78;
v78.new = function(v114)
    local v115 = {};
    l_devAssert_0(v31(v114), ("Expected %s to be a GraphQL type."):format(l_inspect_0(v114)));
    v115.ofType = v114;
    return (setmetatable(v115, v78));
end;
v78.__tostring = function(v116)
    return v116:toString();
end;
v78.toString = function(v117)
    return "[" .. tostring(v117.ofType) .. "]";
end;
v78.toJSON = function(v118)
    return v118:toString();
end;
v79 = {};
v79.__index = v79;
v79.new = function(v119)
    local v120 = {};
    l_devAssert_0(v61(v119), ("Expected %s to be a GraphQL nullable type."):format(l_inspect_0(v119)));
    v120.ofType = v119;
    return (setmetatable(v120, v79));
end;
v79.__tostring = function(v121)
    return v121:toString();
end;
v79.toString = function(v122)
    return tostring(v122.ofType) .. "";
end;
v79.toJSON = function(v123)
    return v123:toString();
end;
v59 = function(v124)
    return v45(v124) or v47(v124);
end;
v60 = function(v125)
    if not v59(v125) then
        error(l_Error_0.new(("Expected %s to be a GraphQL wrapping type."):format(l_inspect_0(v125))));
    end;
    return v125;
end;
v61 = function(v126)
    return v31(v126) and not v47(v126);
end;
v62 = function(v127)
    if not v61(v127) then
        error(l_Error_0.new(("Expected %s to be a GraphQL nullable type."):format(l_inspect_0(v127))));
    end;
    return v127;
end;
v63 = function(v128)
    if not v128 then
        return nil;
    elseif not v47(v128) then
        return v128;
    else
        return v128.ofType;
    end;
end;
v64 = function(v129)
    return ((((v33(v129) or v35(v129)) or v37(v129)) or v39(v129)) or v41(v129)) or v43(v129);
end;
v65 = function(v130)
    if not v64(v130) then
        error(l_Error_0.new(("Expected %s to be a GraphQL named type."):format(l_inspect_0(v130))));
    end;
    return v130;
end;
v66 = function(v131)
    if not v131 then
        return nil;
    else
        local l_v131_0 = v131;
        while v59(l_v131_0) do
            l_v131_0 = l_v131_0.ofType;
        end;
        return l_v131_0;
    end;
end;
local function _(v133)
    if typeof(v133) == "function" then
        return (v133());
    else
        return v133;
    end;
end;
local function _(v135)
    if v135 and #v135 > 0 then
        return v135;
    else
        return nil;
    end;
end;
v80.__index = v80;
v80.new = function(v137)
    local v138 = {};
    local v139 = if not v137.parseValue then l_identityFunc_0 else v137.parseValue;
    v138.name = v137.name;
    v138.description = v137.description;
    v138.specifiedByUrl = v137.specifiedByUrl;
    local v140 = if not v137.serialize then l_identityFunc_0 else v137.serialize;
    v138.serialize = function(_, ...)
        return v140(...);
    end;
    v138.parseValue = function(_, ...)
        return v139(...);
    end;
    local v145 = not v137.parseLiteral and function(v143, v144)
        return v139(l_valueFromASTUntyped_0(v143, v144));
    end or v137.parseLiteral;
    v138.parseLiteral = function(_, ...)
        return v145(...);
    end;
    v138.extensions = if not v137.extensions then nil else l_toObjMap_0(v137.extensions);
    v138.astNode = v137.astNode;
    local l_extensionASTNodes_0 = v137.extensionASTNodes;
    v138.extensionASTNodes = if not not l_extensionASTNodes_0 and #l_extensionASTNodes_0 > 0 then l_extensionASTNodes_0 else nil;
    l_devAssert_0(typeof(v137.name) == "string", "Must provide name.");
    l_devAssert_0(l_isNillish_0(v137.specifiedByUrl) or typeof(v137.specifiedByUrl) == "string", ("%s must provide \"specifiedByUrl\" as a string, "):format(v138.name) .. ("but got: %s."):format(l_inspect_0(v137.specifiedByUrl)));
    local l_l_devAssert_0_0 = l_devAssert_0;
    l_extensionASTNodes_0 = true;
    if v137.serialize ~= nil then
        l_extensionASTNodes_0 = typeof(v137.serialize) == "function";
    end;
    l_l_devAssert_0_0(l_extensionASTNodes_0, ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(v138.name));
    if v137.parseLiteral then
        l_l_devAssert_0_0 = l_devAssert_0;
        l_extensionASTNodes_0 = false;
        if typeof(v137.parseValue) == "function" then
            l_extensionASTNodes_0 = typeof(v137.parseLiteral) == "function";
        end;
        l_l_devAssert_0_0(l_extensionASTNodes_0, ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(v138.name));
    end;
    return (setmetatable(v138, v80));
end;
v80.toConfig = function(v149)
    return {
        name = v149.name, 
        description = v149.description, 
        specifiedByUrl = v149.specifiedByUrl, 
        serialize = v149.serialize, 
        parseValue = v149.parseValue, 
        parseLiteral = v149.parseLiteral, 
        extensions = v149.extensions, 
        astNode = v149.astNode, 
        extensionASTNodes = if not v149.extensionASTNodes then {} else v149.extensionASTNodes
    };
end;
v80.__tostring = function(v150)
    return v150:toString();
end;
v80.toString = function(v151)
    return v151.name;
end;
v80.toJSON = function(v152)
    return v152:toString();
end;
v81.__index = v81;
v81.new = function(v153)
    local v154 = {
        name = v153.name, 
        description = v153.description, 
        isTypeOf = v153.isTypeOf, 
        extensions = if not v153.extensions then nil else l_toObjMap_0(v153.extensions), 
        astNode = v153.astNode
    };
    local l_extensionASTNodes_1 = v153.extensionASTNodes;
    v154.extensionASTNodes = if not not l_extensionASTNodes_1 and #l_extensionASTNodes_1 > 0 then l_extensionASTNodes_1 else nil;
    v154._fields = function()
        return v77(v153);
    end;
    v154._interfaces = function()
        return v76(v153);
    end;
    l_devAssert_0(typeof(v153.name) == "string", "Must provide name.");
    local l_l_devAssert_0_1 = l_devAssert_0;
    l_extensionASTNodes_1 = true;
    if v153.isTypeOf ~= nil then
        l_extensionASTNodes_1 = typeof(v153.isTypeOf) == "function";
    end;
    l_l_devAssert_0_1(l_extensionASTNodes_1, ("%s must provide \"isTypeOf\" as a function, " .. "but got: %s."):format(v154.name, l_inspect_0(v153.isTypeOf)));
    return (setmetatable(v154, v81));
end;
v81.getFields = function(v157)
    if typeof(v157._fields) == "function" then
        v157._fields = v157._fields();
    end;
    return v157._fields;
end;
v81.getInterfaces = function(v158)
    if typeof(v158._interfaces) == "function" then
        v158._interfaces = v158._interfaces();
    end;
    return v158._interfaces;
end;
v81.toConfig = function(v159)
    return {
        name = v159.name, 
        description = v159.description, 
        interfaces = v159:getInterfaces(), 
        fields = v75(v159:getFields()), 
        isTypeOf = v159.isTypeOf, 
        extensions = v159.extensions, 
        astNode = v159.astNode, 
        extensionASTNodes = v159.extensionASTNodes or {}
    };
end;
v81.__tostring = function(v160)
    return v160:toString();
end;
v81.toString = function(v161)
    return v161.name;
end;
v81.toJSON = function(v162)
    return v162:toString();
end;
v76 = function(v163)
    local l_interfaces_0 = v163.interfaces;
    l_interfaces_0 = if typeof(l_interfaces_0) == "function" then l_interfaces_0() else l_interfaces_0 or {};
    l_devAssert_0(l_Array_0.isArray(l_interfaces_0), ("%s interfaces must be an Array or a function which returns an Array."):format(v163.name));
    return l_interfaces_0;
end;
v77 = function(v165)
    local l_fields_0 = v165.fields;
    local v167 = if typeof(l_fields_0) == "function" then l_fields_0() else l_fields_0;
    l_devAssert_0(v72(v167) or v17(v167, l_Map_0), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(v165.name));
    return l_mapValueOrdered_0(l_coerceToMap_0(v167), function(v168, v169)
        l_devAssert_0(v72(v168), ("%s.%s field config must be an object."):format(v165.name, v169));
        local l_l_devAssert_0_2 = l_devAssert_0;
        local v171 = true;
        if v168.resolve ~= nil then
            v171 = typeof(v168.resolve) == "function";
        end;
        l_l_devAssert_0_2(v171, ("%s.%s field resolver must be a function if "):format(v165.name, v169) .. ("provided, but got: %s."):format(l_inspect_0(v168.resolve)));
        l_l_devAssert_0_2 = if not v168.args then {} else v168.args;
        l_devAssert_0(v72(l_l_devAssert_0_2) or v17(l_l_devAssert_0_2, l_Map_0), ("%s.%s args must be an object with argument names as keys."):format(v165.name, v169));
        return {
            name = v169, 
            description = v168.description, 
            type = v168.type, 
            args = l_Array_0.map(l_coerceToMap_0(l_l_devAssert_0_2):entries(), function(v172)
                local v173 = v172[1];
                local v174 = v172[2];
                return {
                    name = v173, 
                    description = v174.description, 
                    type = v174.type, 
                    defaultValue = v174.defaultValue, 
                    deprecationReason = v174.deprecationReason, 
                    extensions = if not v174.extensions then nil else l_toObjMap_0(v174.extensions), 
                    astNode = v174.astNode
                };
            end), 
            resolve = v168.resolve, 
            subscribe = v168.subscribe, 
            deprecationReason = v168.deprecationReason, 
            extensions = if not v168.extensions then nil else l_toObjMap_0(v168.extensions), 
            astNode = v168.astNode
        };
    end);
end;
v72 = function(v175)
    local v176 = false;
    if v175 ~= v7 then
        v176 = l_isObjectLike_0(v175) and (not l_Array_0.isArray(v175) or next(v175) == nil);
    end;
    return v176;
end;
v75 = function(v177)
    return l_mapValueOrdered_0(v177, function(v178)
        return {
            description = v178.description, 
            type = v178.type, 
            args = v67(v178.args), 
            resolve = v178.resolve, 
            subscribe = v178.subscribe, 
            deprecationReason = v178.deprecationReason, 
            extensions = v178.extensions, 
            astNode = v178.astNode
        };
    end);
end;
v67 = function(v179)
    return l_keyValMap_0(v179, function(v180)
        return v180.name;
    end, function(v181)
        return {
            description = v181.description, 
            type = v181.type, 
            defaultValue = v181.defaultValue, 
            deprecationReason = v181.deprecationReason, 
            extensions = v181.extensions, 
            astNode = v181.astNode
        };
    end);
end;
v68 = function(v182)
    return v47(v182.type) and v182.defaultValue == nil;
end;
v82.__index = v82;
v82.new = function(v183)
    local v184 = {
        name = v183.name, 
        description = v183.description, 
        resolveType = v183.resolveType, 
        extensions = if not v183.extensions then nil else l_toObjMap_0(v183.extensions), 
        astNode = v183.astNode
    };
    local l_extensionASTNodes_2 = v183.extensionASTNodes;
    v184.extensionASTNodes = if not not l_extensionASTNodes_2 and #l_extensionASTNodes_2 > 0 then l_extensionASTNodes_2 else nil;
    v184._fields = function()
        return v77(v183);
    end;
    v184._interfaces = function()
        return v76(v183);
    end;
    l_devAssert_0(typeof(v183.name) == "string", "Must provide name.");
    local l_l_devAssert_0_3 = l_devAssert_0;
    l_extensionASTNodes_2 = true;
    if v183.resolveType ~= nil then
        l_extensionASTNodes_2 = typeof(v183.resolveType) == "function";
    end;
    l_l_devAssert_0_3(l_extensionASTNodes_2, ("%s must provide \"resolveType\" as a function, " .. "but got: %s."):format(v184.name, l_inspect_0(v183.resolveType)));
    return (setmetatable(v184, v82));
end;
v82.getFields = function(v187)
    if typeof(v187._fields) == "function" then
        v187._fields = v187._fields();
    end;
    return v187._fields;
end;
v82.getInterfaces = function(v188)
    if typeof(v188._interfaces) == "function" then
        v188._interfaces = v188._interfaces();
    end;
    return v188._interfaces;
end;
v82.toConfig = function(v189)
    return {
        name = v189.name, 
        description = v189.description, 
        interfaces = v189:getInterfaces(), 
        fields = v75(v189:getFields()), 
        resolveType = v189.resolveType, 
        extensions = v189.extensions, 
        astNode = v189.astNode, 
        extensionASTNodes = v189.extensionASTNodes or {}
    };
end;
v82.__tostring = function(v190)
    return v190:toString();
end;
v82.toString = function(v191)
    return v191.name;
end;
v82.toJSON = function(v192)
    return v192:toString();
end;
v83.__index = v83;
v83.new = function(v193)
    local v194 = {
        name = v193.name, 
        description = v193.description, 
        resolveType = v193.resolveType, 
        extensions = if not v193.extensions then nil else l_toObjMap_0(v193.extensions), 
        astNode = v193.astNode
    };
    local l_extensionASTNodes_3 = v193.extensionASTNodes;
    v194.extensionASTNodes = if not not l_extensionASTNodes_3 and #l_extensionASTNodes_3 > 0 then l_extensionASTNodes_3 else nil;
    v194._types = function()
        return v71(v193);
    end;
    l_devAssert_0(typeof(v193.name) == "string", "Must provide name.");
    local l_l_devAssert_0_4 = l_devAssert_0;
    l_extensionASTNodes_3 = true;
    if v193.resolveType ~= nil then
        l_extensionASTNodes_3 = typeof(v193.resolveType) == "function";
    end;
    l_l_devAssert_0_4(l_extensionASTNodes_3, ("%s must provide \"resolveType\" as a function, " .. "but got: %s."):format(v194.name, l_inspect_0(v193.resolveType)));
    return (setmetatable(v194, v83));
end;
v83.getTypes = function(v197)
    if typeof(v197._types) == "function" then
        v197._types = v197._types();
    end;
    return v197._types;
end;
v83.toConfig = function(v198)
    return {
        name = v198.name, 
        description = v198.description, 
        types = v198:getTypes(), 
        resolveType = v198.resolveType, 
        extensions = v198.extensions, 
        astNode = v198.astNode, 
        extensionASTNodes = v198.extensionASTNodes or {}
    };
end;
v83.__tostring = function(v199)
    return v199:toString();
end;
v83.toString = function(v200)
    return v200.name;
end;
v83.toJSON = function(v201)
    return v201:toString();
end;
v71 = function(v202)
    local l_types_0 = v202.types;
    local v204 = if typeof(l_types_0) == "function" then l_types_0() else l_types_0;
    l_devAssert_0(l_Array_0.isArray(v204), ("Must provide Array of types or a function which returns such an array for Union %s."):format(v202.name));
    return v204;
end;
v84.__index = v84;
v84.new = function(v205)
    local v206 = {
        name = v205.name, 
        description = v205.description, 
        extensions = if not v205.extensions then nil else l_toObjMap_0(v205.extensions), 
        astNode = v205.astNode
    };
    local l_extensionASTNodes_4 = v205.extensionASTNodes;
    v206.extensionASTNodes = if not not l_extensionASTNodes_4 and #l_extensionASTNodes_4 > 0 then l_extensionASTNodes_4 else nil;
    v206._values = v74(v206.name, v205.values);
    v206._valueLookup = {};
    l_Array_0.forEach(v206._values, function(v208)
        if v208.value == v208.value then
            v206._valueLookup[v208.value] = v208;
            return ;
        else
            v206._valueLookup[v8] = v208;
            return ;
        end;
    end);
    v206._nameLookup = l_keyMap_0(v206._values, function(v209)
        return v209.name;
    end);
    l_devAssert_0(typeof(v205.name) == "string", "Must provide name.");
    return (setmetatable(v206, v84));
end;
v84.getValues = function(v210)
    return v210._values;
end;
v84.getValue = function(v211, v212)
    return v211._nameLookup[v212];
end;
v84.serialize = function(v213, v214)
    local v215 = nil;
    v215 = if v214 == v214 then v213._valueLookup[v214] else v213._valueLookup[v8];
    if v215 == nil then
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent value: %s"):format(v213.name, l_inspect_0(v214))));
    end;
    return v215.name;
end;
v84.parseValue = function(v216, v217)
    if typeof(v217) ~= "string" then
        local v218 = l_inspect_0(v217);
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent non-string value: %s." .. v73(v216, v218)):format(v216.name, v218)));
    end;
    local v219 = v216:getValue(v217);
    if v219 == nil then
        error(l_GraphQLError_0.new(("Value \"%s\" does not exist in \"%s\" enum."):format(v217, v216.name) .. v73(v216, v217)));
    end;
    return v219.value;
end;
v84.parseLiteral = function(v220, v221, _)
    if v221.kind ~= l_Kind_0.ENUM then
        local v223 = l_print_0(v221);
        error(l_GraphQLError_0.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(v220.name, v223) .. v73(v220, v223), v221));
    end;
    local v224 = v220:getValue(v221.value);
    if v224 == nil then
        local v225 = l_print_0(v221);
        error(l_GraphQLError_0.new(("Value \"%s\" does not exist in \"%s\" enum."):format(v225, v220.name) .. v73(v220, v225), v221));
    end;
    return v224.value;
end;
v84.toConfig = function(v226)
    return {
        name = v226.name, 
        description = v226.description, 
        values = l_keyValMap_0(v226:getValues(), function(v227)
            return v227.name;
        end, function(v228)
            return {
                description = v228.description, 
                value = v228.value, 
                deprecationReason = v228.deprecationReason, 
                extensions = v228.extensions, 
                astNode = v228.astNode
            };
        end), 
        extensions = v226.extensions, 
        astNode = v226.astNode, 
        extensionASTNodes = v226.extensionASTNodes or {}
    };
end;
v84.__tostring = function(v229)
    return v229:toString();
end;
v84.toString = function(v230)
    return v230.name;
end;
v84.toJSON = function(v231)
    return v231:toString();
end;
v73 = function(v232, v233)
    return l_didYouMean_0("the enum value", (l_suggestionList_0(v233, (l_Array_0.map(v232:getValues(), function(v234)
        return v234.name;
    end)))));
end;
v74 = function(v235, v236)
    l_devAssert_0(v72(v236) or v17(v236, l_Map_0), ("%s values must be an object with value names as keys."):format((tostring(v235))));
    return l_Array_0.map(l_coerceToMap_0(v236):entries(), function(v237)
        local v238 = v237[1];
        local v239 = v237[2];
        l_devAssert_0(v72(v239), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(v235), (tostring(v238))) .. ("representing an internal value but got: %s."):format(l_inspect_0(v239)));
        return {
            name = tostring(v238), 
            description = v239.description, 
            value = if v239.value ~= nil then v239.value else v238, 
            deprecationReason = v239.deprecationReason, 
            extensions = if not v239.extensions then nil else l_toObjMap_0(v239.extensions), 
            astNode = v239.astNode
        };
    end);
end;
v85.__index = v85;
v85.new = function(v240)
    local v241 = {
        name = v240.name, 
        description = v240.description, 
        extensions = if not v240.extensions then nil else l_toObjMap_0(v240.extensions), 
        astNode = v240.astNode
    };
    local l_extensionASTNodes_5 = v240.extensionASTNodes;
    v241.extensionASTNodes = if not not l_extensionASTNodes_5 and #l_extensionASTNodes_5 > 0 then l_extensionASTNodes_5 else nil;
    v241._fields = function()
        return v70(v240);
    end;
    l_devAssert_0(typeof(v240.name) == "string", "Must provide name.");
    return (setmetatable(v241, v85));
end;
v85.getFields = function(v243)
    if typeof(v243._fields) == "function" then
        v243._fields = v243._fields();
    end;
    return v243._fields;
end;
v85.toConfig = function(v244)
    return {
        name = v244.name, 
        description = v244.description, 
        fields = l_mapValueOrdered_0(v244:getFields(), function(v245)
            return {
                description = v245.description, 
                type = v245.type, 
                defaultValue = v245.defaultValue, 
                extensions = v245.extensions, 
                astNode = v245.astNode
            };
        end), 
        extensions = v244.extensions, 
        astNode = v244.astNode, 
        extensionASTNodes = v244.extensionASTNodes or {}
    };
end;
v85.__tostring = function(v246)
    return v246:toString();
end;
v85.toString = function(v247)
    return v247.name;
end;
v85.toJSON = function(v248)
    return v248:toString();
end;
v70 = function(v249)
    local l_fields_1 = v249.fields;
    local v251 = if typeof(l_fields_1) == "function" then l_fields_1() else l_fields_1;
    l_devAssert_0(v72(v251) or v17(v251, l_Map_0), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(v249.name));
    return l_mapValueOrdered_0(l_coerceToMap_0(v251), function(v252, v253)
        l_devAssert_0(v252.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(v249.name, v253));
        return {
            name = v253, 
            description = v252.description, 
            type = v252.type, 
            defaultValue = v252.defaultValue, 
            deprecationReason = v252.deprecationReason, 
            extensions = if not v252.extensions then nil else l_toObjMap_0(v252.extensions), 
            astNode = v252.astNode
        };
    end);
end;
v69 = function(v254)
    return v47(v254.type) and v254.defaultValue == nil;
end;
local _ = {
    new = function()
        return {};
    end
};
return {
    GraphQLList = v78, 
    GraphQLNonNull = v79, 
    GraphQLScalarType = v80, 
    GraphQLObjectType = v81, 
    GraphQLInterfaceType = v82, 
    GraphQLUnionType = v83, 
    GraphQLEnumType = v84, 
    GraphQLInputObjectType = v85, 
    isType = v31, 
    assertType = v32, 
    isScalarType = v33, 
    assertScalarType = v34, 
    isObjectType = v35, 
    assertObjectType = v36, 
    isInterfaceType = v37, 
    assertInterfaceType = v38, 
    isUnionType = v39, 
    assertUnionType = v40, 
    isEnumType = v41, 
    assertEnumType = v42, 
    isInputObjectType = v43, 
    assertInputObjectType = v44, 
    isListType = v45, 
    assertListType = v46, 
    isNonNullType = v47, 
    assertNonNullType = v48, 
    isInputType = v49, 
    assertInputType = v50, 
    isOutputType = v51, 
    assertOutputType = v52, 
    isLeafType = v53, 
    assertLeafType = v54, 
    isCompositeType = v55, 
    assertCompositeType = v56, 
    isAbstractType = v57, 
    assertAbstractType = v58, 
    isWrappingType = v59, 
    assertWrappingType = v60, 
    isNullableType = v61, 
    assertNullableType = v62, 
    getNullableType = v63, 
    isNamedType = v64, 
    assertNamedType = v65, 
    getNamedType = v66, 
    argsToArgsConfig = v67, 
    isRequiredArgument = v68, 
    isRequiredInputField = v69, 
    NULL = v7
};
