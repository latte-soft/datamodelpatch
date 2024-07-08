local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_0.Roact17.types);
local v3 = require(l_Parent_0.Roact17.Classes.Roact17Worker);
local v4 = require(l_Parent_1.Dash);
local l_collect_0 = v4.collect;
local l_collectSet_0 = v4.collectSet;
local l_class_0 = v4.class;
local l_forEach_0 = v4.forEach;
local v11 = l_class_0("Roact17TargetWatcher", function(v9, v10)
    return {
        debugInterface = v9, 
        devtools = v10, 
        rootToTarget = {}
    };
end);
v11._init = function(v12)
    v12.devtools.store:addListener("roots", function()
        v12:_updateTargets();
    end);
end;
v11._updateTargets = function(v13)
    local l_store_0 = v13.devtools.store;
    local v15 = l_store_0:getRoots();
    local v16 = l_collectSet_0(v15);
    local l_rootToTarget_0 = v13.rootToTarget;
    l_forEach_0(l_rootToTarget_0, function(v18)
        if v16[v18.root] == nil then
            v13.debugInterface:removeTarget(v18);
        end;
    end);
    v13.rootToTarget = l_collect_0(v15, function(_, v20)
        local v21 = v13.devtools.hook.rendererInterfaces[l_store_0:getRendererIDForElement(v20)]:getDisplayNameForRoot(v20);
        if v21 == "Anonymous" then
            v21 = "#" .. v20;
        end;
        return v20, l_rootToTarget_0[v20] or v13.debugInterface:addTarget(v21, function(v22, v23)
            return v3.new(v13.debugInterface, v22, v23, v13.devtools, v20);
        end);
    end);
end;
return v11;
