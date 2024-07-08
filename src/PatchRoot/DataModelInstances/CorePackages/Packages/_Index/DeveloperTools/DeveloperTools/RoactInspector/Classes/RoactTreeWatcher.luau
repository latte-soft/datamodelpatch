local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.RoactInspector.Utils.getSymbol);
local v3 = require(l_Parent_0.RoactInspector.Utils.getChildAtKey);
local v4 = require(l_Parent_1.Dash);
local l_append_0 = v4.append;
local l_class_0 = v4.class;
local l_collectArray_0 = v4.collectArray;
local l_pick_0 = v4.pick;
local l_keys_0 = v4.keys;
local l_last_0 = v4.last;
local l_map_0 = v4.map;
local l_mapOne_0 = v4.mapOne;
local l_reduce_0 = v4.reduce;
local l_reverse_0 = v4.reverse;
local l_slice_0 = v4.slice;
local l_insert_0 = table.insert;
local v20 = l_class_0("RoactTreeWatcher", function(v17, v18, v19)
    return {
        debugInterface = v17, 
        tree = v18, 
        onPathChanged = v19, 
        cachedRoot = {
            branchData = {}, 
            childNodes = {}
        }
    };
end);
v20._init = function(v21)
    v21.onPoll = function()
        if v21.tree then
            v21:_checkNodes();
            delay(0.25, v21.onPoll);
        end;
    end;
end;
v20.getRootNode = function(v22)
    return v2(v22.tree, "InternalData").rootNode;
end;
v20.monitor = function(v23)
    spawn(v23.onPoll);
end;
v20._checkNodes = function(v24)
    v24:_checkNode(v24:getRootNode(), v24.cachedRoot, {});
end;
v20._checkNode = function(v25, v26, v27, v28)
    local v33 = l_collectArray_0(v25:_getBranchNodes(v26), function(v29, v30)
        local v31 = v27.branchData[v29];
        local v32 = v30.instance or v30.currentElement;
        if not (v31 and v32.props == v31.props) or v32.state ~= v31.state then
            v27.branchData[v29] = {
                props = v32.props, 
                state = v32.state
            };
            return v29;
        else
            return nil;
        end;
    end);
    if #v33 > 0 then
        v25.onPathChanged(v28, v33);
    end;
    local v34 = v25:getHostNode(v26);
    v27.childNodes = l_pick_0(v27.childNodes, function(v35, v36)
        local v37 = l_append_0({}, v28, {
            v36
        });
        local v38 = v3(v34.children, v36);
        if not v38 then
            return false;
        else
            v25:_checkNode(v38, v35, v37);
            return true;
        end;
    end);
end;
v20.getNode = function(v39, v40)
    return l_reduce_0(v40, function(v41, v42)
        if not v41 or not v41.children then
            return nil;
        else
            local v43 = v3(v41.children, v42);
            return not not v43 and v39:getHostNode(v43) or nil;
        end;
    end, (v39:getHostNode((v39:getRootNode()))));
end;
v20.watchPath = function(v44, v45)
    local v46 = v44:getRootNode();
    local l_cachedRoot_0 = v44.cachedRoot;
    l_cachedRoot_0.branchData = v44:_getBranchData(v46);
    l_reduce_0(v45, function(v48, v49)
        if v48 then
            l_cachedRoot_0.childNodes[v49] = l_cachedRoot_0.childNodes[v49] or {
                childNodes = {}
            };
            l_cachedRoot_0 = l_cachedRoot_0.childNodes[v49];
            local v50 = v3(v48.children, v49);
            if v50 then
                l_cachedRoot_0.branchData = v44:_getBranchData(v50);
                return v44:getHostNode(v50);
            else
                return nil;
            end;
        else
            return nil;
        end;
    end, v44:getHostNode(v46));
end;
v20._getBranchData = function(v51, v52)
    return l_map_0(v51:_getBranchNodes(v52), function(v53)
        local v54 = v53.instance or v53.currentElement;
        return {
            props = v54.props, 
            state = v54.state
        };
    end);
end;
v20.getChildren = function(v55, v56, v57, v58)
    if v58 == 0 then
        return nil;
    else
        local v59 = v55:getHostNode(v57);
        if v59 then
            return (l_map_0(v59.children, function(v60, v61)
                local v62 = l_append_0({}, v56, {
                    v61
                });
                local l_hostObject_0 = v55:getHostNode(v60).hostObject;
                return {
                    Name = typeof(v61) == "number" and v61 or tostring(v61), 
                    Icon = not not l_hostObject_0 and l_hostObject_0.ClassName or "Branch", 
                    Children = v55:getChildren(v62, v60, v58 - 1), 
                    Path = v62
                };
            end));
        else
            return nil;
        end;
    end;
end;
v20.getHostNode = function(v64, v65, v66)
    local v67 = v2(v65.children, "UseParentKey");
    while v67 do
        v65 = v67;
        v67 = v2(v65.children, "UseParentKey");
        if not (v67 or not v66) then
            if not v64:isFragment(v65) then
                if v64:isPortal(v65) then
                    v67 = l_mapOne_0(v65.children);
                end;
            else
                v67 = v65.children[1];
            end;
        end;
    end;
    return v65;
end;
v20.getRootPath = function(v68)
    local v69 = v2(v68:getRootNode().children, "UseParentKey");
    local v70 = {};
    while v69 do
        local l_v69_0 = v69;
        v69 = v2(l_v69_0.children, "UseParentKey");
        if not v69 then
            if not v68:isFragment(l_v69_0) then
                if v68:isPortal(l_v69_0) then
                    local v72 = l_keys_0(l_v69_0.children);
                    l_insert_0(v70, v72[1]);
                    v69 = l_v69_0.children[v72[1]];
                end;
            else
                v69 = l_v69_0.children[1];
                l_insert_0(v70, 1);
            end;
        end;
    end;
    return l_slice_0(v70, 0, -1);
end;
v20.isFragment = function(_, v74)
    return v74.currentElement and v74.currentElement.elements;
end;
v20.isPortal = function(_, v76)
    return v76.currentElement and tostring(v76.currentElement.component) == "Symbol(Portal)";
end;
v20.isFunction = function(_, v78)
    return v78.currentElement and typeof(v78.currentElement.component) == "function";
end;
v20.isHost = function(_, v80)
    return v80.currentElement and typeof(v80.currentElement.component) == "string";
end;
v20.getNodes = function(v81, v82)
    local v83 = l_slice_0(v82, 1, -1);
    local v84 = l_last_0(v82);
    local v85 = v81:getNode(v83);
    if v85 then
        return v81:_getBranchNodes((v3(v85.children, v84)));
    else
        return nil;
    end;
end;
v20._getBranchNodes = function(_, v87)
    local v88 = {};
    while v87 do
        l_insert_0(v88, v87);
        v87 = v2(v87.children, "UseParentKey");
    end;
    return v88;
end;
v20.getNodeName = function(v89, v90)
    if not v89:isFragment(v90) then
        if not v89:isPortal(v90) then
            if not v89:isFunction(v90) then
                if not v89:isHost(v90) then
                    return v90.currentElement.component.__componentName;
                else
                    return v90.currentElement.component;
                end;
            else
                return (tostring(v90.currentElement.component));
            end;
        else
            return "Portal";
        end;
    else
        return "Fragment";
    end;
end;
v20.getNodeIcon = function(v91, v92)
    if not v91:isFragment(v92) then
        if not v91:isPortal(v92) then
            if not v91:isFunction(v92) then
                if not v91:isHost(v92) then
                    local l___componentName_0 = v92.currentElement.component.__componentName;
                    if not l___componentName_0:find("Provider") then
                        if not l___componentName_0:find("Consumer") and not l___componentName_0:find("RoduxConnection") then
                            if not v92.currentElement.component.shouldUpdate then
                                return "Stateful";
                            else
                                return "Pure";
                            end;
                        else
                            return "Consumer";
                        end;
                    else
                        return "Provider";
                    end;
                else
                    return v92.hostObject.ClassName;
                end;
            else
                return "Functional";
            end;
        else
            return "Portal";
        end;
    else
        return "Fragment";
    end;
end;
v20.getPath = function(v94, v95)
    return (v94:_getFullPath((v94:_getInstancePath(v95))));
end;
v20._getInstancePath = function(v96, v97)
    local v98 = {};
    while v97 and v97 ~= v96.debugInterface.rootInstance do
        l_insert_0(v98, tonumber(v97.Name) or v97.Name);
        v97 = v97.Parent;
    end;
    local v99 = l_append_0({}, v96.debugInterface.rootPath or v96:getRootPath(), l_reverse_0(v98));
    if not v96.debugInterface.rootPrefix then
        return v99;
    else
        return (l_slice_0(v99, #v96.debugInterface.rootPrefix + 1));
    end;
end;
v20._getFullPath = function(v100, v101)
    local v102 = {};
    if l_reduce_0(v101, function(v103, v104)
        return v100:_dfsFindNextChildNode(v103, v104, v102);
    end, (v100:getHostNode((v100:getRootNode())))) ~= nil then
        return v102;
    else
        return v101;
    end;
end;
v20._dfsFindNextChildNode = function(v105, v106, v107, v108)
    if not (v106 ~= nil) or v106.children == nil then
        return nil;
    else
        local v109 = v3(v106.children, v107);
        if v109 then
            local v110 = v105:getHostNode(v109);
            if v110 ~= nil then
                l_insert_0(v108, v107);
                return v110;
            end;
        end;
        for v111, v112 in pairs(v106.children) do
            local v113 = tostring(v111) == "Symbol(UseParentKey)";
            if not v113 then
                l_insert_0(v108, v111);
            end;
            local v114 = v105:_dfsFindNextChildNode(v112, v107, v108);
            if v114 ~= nil then
                return v114;
            elseif not v113 then
                table.remove(v108);
            end;
        end;
        return nil;
    end;
end;
v20.destroy = function(v115)
    v115.tree = nil;
end;
return v20;
