local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_instanceof_0 = v2.instanceof;
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local v8 = require(l_Parent_0.luaUtils.isCallable);
local v9 = require(l_Parent_0.luaUtils.objectKeysForEach);
local l_dep_0 = require(l_Parent_0.optimism).dep;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v12 = require(l_Parent_0.jsutils.equal);
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v14 = require(script.Parent.Parent.Parent.utilities);
local l_isReference_0 = v14.isReference;
local l_makeReference_0 = v14.makeReference;
local l_DeepMerger_0 = v14.DeepMerger;
local l_maybeDeepFreeze_0 = v14.maybeDeepFreeze;
local l_canUseWeakMap_0 = v14.canUseWeakMap;
local l_isNonNullObject_0 = v14.isNonNullObject;
local _ = require(script.Parent.types);
local v22 = require(script.Parent.helpers);
local l_hasOwn_0 = v22.hasOwn;
local l_fieldNameFromStoreName_0 = v22.fieldNameFromStoreName;
local _ = require(script.Parent.policies);
local _ = require(script.Parent.Parent.core.types.Cache);
local _ = require(script.Parent.Parent.core.types.common);
local v28 = {};
local v29 = nil;
v29 = function()
    return v28;
end;
local v30 = {};
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = {};
v36.__index = v36;
v36.new = function(v37, v38)
    local v39 = setmetatable({}, v36);
    v39.policies = v37;
    v39.group = v38;
    v39.data = {};
    v39.rootIds = {};
    v39.refs = {};
    v39.getFieldValue = function(_, v41, v42)
        return (l_maybeDeepFreeze_0(if not l_isReference_0(v41) then v41 and v41[v42] else v39:get(v41.__ref, v42)));
    end;
    v39.canRead = function(_, v44)
        if not l_isReference_0(v44) then
            return typeof(v44) == "table";
        else
            return v39:has(v44.__ref);
        end;
    end;
    v39.toReference = function(_, v46, v47)
        if type(v46) == "string" then
            return l_makeReference_0(v46);
        elseif not l_isReference_0(v46) then
            local v48 = table.unpack(v39.policies:identify(v46), 1, 1);
            if not v48 then
                return ;
            else
                local v49 = l_makeReference_0(v48);
                if v47 then
                    v39:merge(v48, v46);
                end;
                return v49;
            end;
        else
            return v46;
        end;
    end;
    return v39;
end;
v36.addLayer = function(_, _, _)
    error("not implemented abstract method");
end;
v36.removeLayer = function(_, _)
    error("not implemented abstract method");
end;
v36.toObject = function(v55)
    return table.clone(v55.data);
end;
v36.has = function(v56, v57)
    return v56:lookup(v57, true) ~= nil;
end;
v36.get = function(v58, v59, v60)
    v58.group:depend(v59, v60);
    if l_hasOwn_0(v58.data, v59) then
        local v61 = v58.data[v59];
        if not (not l_Boolean_0.toJSBoolean(v61) or not l_hasOwn_0(v61, v60)) then
            return v61[v60];
        end;
    end;
    if not (v60 == "__typename") or not l_hasOwn_0(v58.policies.rootTypenamesById, v59) then
        if not l_instanceof_0(v58, v31) then
            return nil;
        else
            return v58.parent:get(v59, v60);
        end;
    else
        return v58.policies.rootTypenamesById[v59];
    end;
end;
v36.lookup = function(v62, v63, v64)
    if v64 then
        v62.group:depend(v63, "__exists");
    end;
    if not l_hasOwn_0(v62.data, v63) then
        if not l_instanceof_0(v62, v31) then
            if not v62.policies.rootTypenamesById[v63] then
                return nil;
            else
                return {};
            end;
        else
            return v62.parent:lookup(v63, v64);
        end;
    else
        return v62.data[v63];
    end;
end;
v36.merge = function(v65, v66, v67)
    local v68 = nil;
    if l_isReference_0(v66) then
        v66 = v66.__ref;
    end;
    if l_isReference_0(v67) then
        v67 = v67.__ref;
    end;
    local v69 = nil;
    if type(v66) == "string" then
        v68 = v66;
        v69 = v65:lookup(v68);
    else
        v69 = v66;
    end;
    local v70 = nil;
    if type(v67) == "string" then
        v68 = v67;
        v70 = v65:lookup(v68);
    else
        v70 = v67;
    end;
    if v70 then
        l_invariant_0(typeof(v68) == "string", "store.merge expects a string ID");
        local v71 = l_DeepMerger_0.new(v34):merge(v69, v70);
        v65.data[v68] = v71;
        if v71 ~= v69 then
            v65.refs[v68] = nil;
            if v65.group.caching then
                local v72 = {};
                if not v69 then
                    v72.__exists = 1;
                end;
                v9(v70, function(v73)
                    if not v69 or v69[v73] ~= v71[v73] then
                        v72[v73] = 1;
                        local v74 = l_fieldNameFromStoreName_0(v73);
                        if not (not (v74 ~= v73) or v65.policies:hasKeyArgs(v71.__typename, v74)) then
                            v72[v74] = 1;
                        end;
                        if not (not (v71[v73] == nil) or l_instanceof_0(v65, v31)) then
                            v71[v73] = nil;
                        end;
                    end;
                end);
                if not (not v72.__typename or v69 and v69.__typename) and v65.policies.rootTypenamesById[v68] == v71.__typename then
                    v72.__typename = nil;
                end;
                v9(v72, function(v75)
                    return v65.group:dirty(v68, v75);
                end);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v36.modify = function(v76, v77, v78)
    local v79 = v76:lookup(v77);
    if v79 then
        local v80 = {};
        local v81 = false;
        local v82 = true;
        local v87 = {
            DELETE = v28, 
            INVALIDATE = v30, 
            isReference = function(_, ...)
                return l_isReference_0(...);
            end, 
            toReference = v76.toReference, 
            canRead = v76.canRead, 
            readField = function(_, v85, v86)
                return v76.policies:readField(typeof(v85) == "string" and {
                    fieldName = v85, 
                    from = v86 or l_makeReference_0(v77)
                } or v85, {
                    store = v76
                });
            end
        };
        v9(v79, function(v88)
            local v89 = l_fieldNameFromStoreName_0(v88);
            local v90 = v79[v88];
            if v90 == nil then
                return ;
            else
                local v91 = nil;
                if not v8(v78) then
                    local l_v78_0 = v78;
                    v91 = l_v78_0[v88] or l_v78_0[v89];
                else
                    v91 = v78;
                end;
                if v91 then
                    local v93 = nil;
                    v93 = if v91 == v29 then v28 else v91(not v8(v78) and v78 or nil, l_maybeDeepFreeze_0(v90), l_Object_0.assign(table.clone(v87), {
                        fieldName = v89, 
                        storeFieldName = v88, 
                        storage = v76:getStorage(v77, v88)
                    }));
                    if v93 == v30 then
                        v76.group:dirty(v77, v88);
                    else
                        if v93 == v28 then
                            v93 = l_DeepMerger_0.None;
                        end;
                        if v93 ~= v90 then
                            v80[v88] = v93;
                            v81 = true;
                            v90 = v93;
                        end;
                    end;
                end;
                if v90 ~= nil and v90 ~= l_DeepMerger_0.None then
                    v82 = false;
                end;
                return ;
            end;
        end);
        if not v81 then
            --[[ close >= 5 ]]
        else
            v76:merge(v77, v80);
            if v82 then
                if not l_instanceof_0(v76, v31) then
                    v76.data[v77] = nil;
                else
                    v76.data[v77] = nil;
                end;
                v76.group:dirty(v77, "__exists");
            end;
            return true;
        end;
    end;
    return false;
end;
v36.delete = function(v94, v95, v96, v97)
    local v98 = v94:lookup(v95);
    if not v98 then
        return false;
    else
        local v99 = v94:getFieldValue(v98, "__typename");
        local v100 = nil;
        v100 = if not not v96 and v97 then v94.policies:getStoreFieldName({
            typename = v99, 
            fieldName = v96, 
            args = v97
        }) else v96;
        return v94:modify(v95, if not v100 then v29 else {
            [v100] = v29
        });
    end;
end;
v36.evict = function(v101, v102)
    local v103 = false;
    if v102.id then
        if l_hasOwn_0(v101.data, v102.id) then
            v103 = v101:delete(v102.id, v102.fieldName, v102.args);
        end;
        if l_instanceof_0(v101, v31) then
            v103 = v101.parent:evict(v102) or v103;
        end;
        if not (not v102.fieldName and not v103) then
            v101.group:dirty(v102.id, v102.fieldName or "__exists");
        end;
    end;
    return v103;
end;
v36.clear = function(v104)
    v104:replace(nil);
end;
v36.extract = function(v105)
    local v106 = v105:toObject();
    local v107 = {};
    v105:getRootIdSet():forEach(function(v108)
        if not l_hasOwn_0(v105.policies.rootTypenamesById, v108) then
            table.insert(v107, v108);
        end;
    end);
    if #v107 > 0 then
        v106.__META = {
            extraRootIds = l_Array_0.sort(v107)
        };
    end;
    return v106;
end;
v36.replace = function(v109, v110)
    v9(v109.data, function(v111)
        if not (v110 and l_hasOwn_0(v110, v111)) then
            v109:delete(v111);
        end;
    end);
    if v110 ~= nil then
        local l___META_0 = v110.__META;
        local v113 = l_Object_0.assign(table.clone(v110), {
            __META = l_Object_0.None
        });
        v9(v113, function(v114)
            v109:merge(v114, v113[v114]);
        end);
        if l___META_0 ~= nil then
            l_Array_0.forEach(l___META_0.extraRootIds, v109.retain, v109);
        end;
    end;
end;
v36.getStorage = function(_, _, ...)
    error("not implemented abstract method");
end;
v36.retain = function(v117, v118)
    v117.rootIds[v118] = (not l_Boolean_0.toJSBoolean(v117.rootIds[v118]) and 0 or v117.rootIds[v118]) + 1;
    return v117.rootIds[v118];
end;
v36.release = function(v119, v120)
    if v119.rootIds[v120] > 0 then
        local l_rootIds_0 = v119.rootIds;
        l_rootIds_0[v120] = l_rootIds_0[v120] - 1;
        l_rootIds_0 = v119.rootIds[v120];
        if not l_Boolean_0.toJSBoolean(l_rootIds_0) then
            v119.rootIds[v120] = nil;
        end;
        return l_rootIds_0;
    else
        return 0;
    end;
end;
v36.getRootIdSet = function(v122, v123)
    local l_v123_0 = v123;
    if v123 == nil then
        l_v123_0 = l_Set_0.new();
    end;
    l_Array_0.forEach(l_Object_0.keys(v122.rootIds), l_v123_0.add, l_v123_0);
    if not l_instanceof_0(v122, v31) then
        l_Array_0.forEach(l_Object_0.keys(v122.policies.rootTypenamesById), l_v123_0.add, l_v123_0);
        return l_v123_0;
    else
        v122.parent:getRootIdSet(l_v123_0);
        return l_v123_0;
    end;
end;
v36.gc = function(v125)
    local v126 = v125:getRootIdSet();
    local v127 = v125:toObject();
    for _, v129 in v126, nil, nil do
        if l_hasOwn_0(v127, v129) then
            l_Array_0.forEach(l_Object_0.keys(v125:findChildRefIds(v129)), v126.add, v126);
            v127[v129] = nil;
        end;
    end;
    local v130 = l_Object_0.keys(v127);
    if l_Boolean_0.toJSBoolean(#v130) then
        local l_v125_0 = v125;
        while l_instanceof_0(l_v125_0, v31) do
            l_v125_0 = l_v125_0.parent;
        end;
        do
            local l_l_v125_0_0 = l_v125_0;
            l_Array_0.forEach(v130, function(v133)
                return l_l_v125_0_0:delete(v133);
            end);
        end;
    end;
    return v130;
end;
v36.findChildRefIds = function(v134, v135)
    if not l_hasOwn_0(v134.refs, v135) then
        v134.refs[v135] = {};
        local v136 = v134.refs[v135];
        local v137 = v134.data[v135];
        if v137 then
            local v138 = l_Set_0.new({
                v137
            });
            for _, v140 in v138, nil, nil do
                if l_isReference_0(v140) then
                    v136[v140.__ref] = true;
                end;
                if l_isNonNullObject_0(v140) then
                    v9(v140, function(v141)
                        local v142 = v140[v141];
                        if l_isNonNullObject_0(v142) then
                            v138:add(v142);
                        end;
                    end);
                end;
            end;
        else
            return v136;
        end;
    end;
    return v134.refs[v135];
end;
v36.makeCacheKey = function(v143, ...)
    return v143.group.keyMaker:lookupArray({
        ...
    });
end;
v0.EntityStore = v36;
local v144 = {};
v144.__index = v144;
v144.new = function(v145, v146)
    local v147 = setmetatable({}, v144);
    v147.caching = v145;
    v147.parent = v146;
    v147.d = nil;
    v147:resetCaching();
    return v147;
end;
v144.resetCaching = function(v148)
    v148.d = if not v148.caching then nil else l_dep_0();
    v148.keyMaker = l_Trie_0.new(l_canUseWeakMap_0);
end;
v144.depend = function(v149, v150, v151)
    if v149.d then
        v149.d(v33(v150, v151));
        local v152 = l_fieldNameFromStoreName_0(v151);
        if v152 ~= v151 then
            v149.d(v33(v150, v152));
        end;
        if v149.parent then
            v149.parent:depend(v150, v151);
        end;
    end;
end;
v144.dirty = function(v153, v154, v155)
    if v153.d then
        v153.d:dirty(v33(v154, v155), v155 == "__exists" and "forget" or "setDirty");
    end;
end;
v33 = function(v156, v157)
    return v157 .. "#" .. v156;
end;
v0.maybeDependOnExistenceOfEntity = function(v158, v159)
    if v35(v158) then
        v158.group:depend(v159, "__exists");
    end;
end;
local v160 = setmetatable({}, {
    __index = v36
});
v160.__index = v160;
v160.new = function(v161)
    local l_policies_0 = v161.policies;
    local l_resultCaching_0 = v161.resultCaching;
    local l_seed_0 = v161.seed;
    if v161.resultCaching == nil then
        l_resultCaching_0 = true;
    end;
    local v165 = setmetatable(v36.new(l_policies_0, v144.new(l_resultCaching_0)), v160);
    v165.stump = v32.new(v165);
    v165.storageTrie = l_Trie_0.new(l_canUseWeakMap_0);
    if l_seed_0 then
        v165:replace(l_seed_0);
    end;
    return v165;
end;
v160.addLayer = function(v166, v167, v168)
    return v166.stump:addLayer(v167, v168);
end;
v160.removeLayer = function(v169)
    return v169;
end;
v160.getStorage = function(v170, ...)
    return v170.storageTrie:lookupArray({
        ...
    });
end;
v0.EntityStore_Root = v160;
v31 = setmetatable({}, {
    __index = v36
});
v31.__index = v31;
v31.new = function(v171, v172, v173, v174)
    local v175 = setmetatable(v36.new(v172.policies, v174), v31);
    v175.id = v171;
    v175.parent = v172;
    v175.replay = v173;
    v175.group = v174;
    v173(v175, v175);
    return v175;
end;
v31.addLayer = function(v176, v177, v178)
    return v31.new(v177, v176, v178, v176.group);
end;
v31.removeLayer = function(v179, v180)
    local v181 = v179.parent:removeLayer(v180);
    if v180 == v179.id then
        if v179.group.caching then
            v9(v179.data, function(v182)
                local v183 = v179.data[v182];
                local v184 = v181.lookup(v181, v182);
                if v184 then
                    if v183 then
                        if v183 ~= v184 then
                            v9(v183, function(v185)
                                if not v12(v183[v185], v184[v185]) then
                                    v179.group:dirty(v182, v185);
                                end;
                            end);
                        end;
                        return ;
                    else
                        v179.group:dirty(v182, "__exists");
                        v9(v184, function(v186)
                            v179.group:dirty(v182, v186);
                        end);
                        return ;
                    end;
                else
                    v179:delete(v182);
                    return ;
                end;
            end);
        end;
        return v181;
    elseif v181 == v179.parent then
        return v179;
    else
        return v181:addLayer(v179.id, v179.replay);
    end;
end;
v31.toObject = function(v187)
    return l_Object_0.assign({}, v187.parent:toObject(), v187.data);
end;
v31.findChildRefIds = function(v188, v189)
    local v190 = v188.parent:findChildRefIds(v189);
    return not not l_hasOwn_0(v188.data, v189) and l_Object_0.assign({}, v190, getmetatable((getmetatable(v188))).__index.findChildRefIds(v188, v189)) or v190;
end;
v31.getStorage = function(v191, ...)
    local l_parent_0 = v191.parent;
    while l_parent_0.parent do
        l_parent_0 = l_parent_0.parent;
    end;
    return l_parent_0:getStorage(...);
end;
v32 = setmetatable({}, {
    __index = v31
});
v32.__index = v32;
v32.new = function(v193)
    return (setmetatable(v31.new("EntityStore.Stump", v193, function()
    end, v144.new(v193.group.caching, v193.group)), v32));
end;
v32.removeLayer = function(v194)
    return v194;
end;
v32.merge = function(v195, ...)
    return v195.parent:merge(...);
end;
v34 = function(_, v197, v198, v199)
    local v200 = v197[v199];
    local v201 = v198[v199];
    if not v12(v200, v201) then
        return v201;
    else
        return v200;
    end;
end;
v35 = function(v202)
    local v203 = false;
    if type(v202) == "table" then
        v203 = false;
        if type(v202.group) == "table" then
            v203 = v202.group.caching == true;
        end;
    end;
    return v203;
end;
v0.supportsResultCaching = v35;
return v0;
