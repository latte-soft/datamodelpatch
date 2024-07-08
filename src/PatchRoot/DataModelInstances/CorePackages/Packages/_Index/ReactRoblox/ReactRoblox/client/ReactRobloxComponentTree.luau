local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local _ = require(l_Parent_0.ReactReconciler);
local v3 = require(l_Parent_0.Shared);
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local l_invariant_0 = v3.invariant;
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = string.sub(tostring(math.random()), 3);
local v16 = "__reactFiber$" .. v15;
local v17 = "__reactContainer$" .. v15;
v11.precacheFiberNode = function(v18, v19)
    v13[v19] = v18;
end;
v11.uncacheFiberNode = function(v20)
    v13[v20] = nil;
    v14[v20] = nil;
end;
v11.markContainerAsRoot = function(v21, v22)
    v12[v22] = v21;
end;
v11.unmarkContainerAsRoot = function(v23)
    v12[v23] = nil;
end;
v11.isContainerMarkedAsRoot = function(v24)
    return not not v12[v24];
end;
v11.getClosestInstanceFromNode = function(v25)
    local v26 = v13[v25];
    if not v26 then
        local l_Parent_1 = v25.Parent;
        while true do
            if not l_Parent_1 then
                return nil;
            else
                v26 = v13[l_Parent_1];
                if not v26 then
                    v25 = l_Parent_1;
                    l_Parent_1 = v25.Parent;
                else
                    local l_alternate_0 = v26.alternate;
                    if not (v26.child == nil) or l_alternate_0 ~= nil and l_alternate_0.child ~= nil then
                        if v9 == nil then
                            v9 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance;
                        end;
                        local v29 = v9(v25);
                        while v29 ~= nil do
                            local v30 = v13[v29];
                            if not v30 then
                                v29 = v9(v29);
                            else
                                return v30;
                            end;
                        end;
                    end;
                    return v26;
                end;
            end;
        end;
    else
        return v26;
    end;
end;
v11.getInstanceFromNode = function(v31)
    if v4 == nil then
        v4 = require(script.Parent.Parent["ReactReconciler.roblox"]).ReactWorkTags;
        v5 = v4.HostComponent;
        v6 = v4.HostComponent;
        v7 = v4.HostComponent;
        v8 = v4.HostComponent;
    end;
    local v32 = v31[v16] or v31[v17];
    if not v32 then
        return nil;
    elseif not ((v32.tag ~= v5 and v32.tag ~= v6) and v32.tag ~= v8) or v32.tag == v7 then
        return v32;
    else
        return nil;
    end;
end;
v11.getNodeFromInstance = function(v33)
    if not (v33.tag ~= v5) or v33.tag == v6 then
        return v33.stateNode;
    else
        l_invariant_0(false, "getNodeFromInstance: Invalid argument.");
        error("getNodeFromInstance: Invalid argument.");
        return ;
    end;
end;
v11.getFiberCurrentPropsFromNode = function(v34)
    return v14[v34];
end;
v11.updateFiberProps = function(v35, v36)
    v14[v35] = v36;
end;
return v11;
