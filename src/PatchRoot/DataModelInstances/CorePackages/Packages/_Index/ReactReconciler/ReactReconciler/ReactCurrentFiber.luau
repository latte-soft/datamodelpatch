local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getStackByFiberInDevAndProd_0 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactDebugCurrentFrame_0 = l_ReactSharedInternals_0.ReactDebugCurrentFrame;
local v7 = {
    current = nil, 
    isRendering = false
};
v7.getCurrentFiberOwnerNameInDevOrNull = function()
    if l___DEV___0 then
        if v7.current == nil then
            return nil;
        else
            local l__debugOwner_0 = v7.current._debugOwner;
            if l__debugOwner_0 then
                return l_getComponentName_0(l__debugOwner_0.type);
            end;
        end;
    end;
    return nil;
end;
local function v9()
    if not l___DEV___0 then
        return "";
    elseif v7.current == nil then
        return "";
    else
        return l_getStackByFiberInDevAndProd_0(v7.current);
    end;
end;
v7.resetCurrentFiber = function()
    if l___DEV___0 then
        l_ReactDebugCurrentFrame_0.getCurrentStack = nil;
        v7.current = nil;
        v7.isRendering = false;
    end;
end;
v7.setCurrentFiber = function(v10)
    if l___DEV___0 then
        l_ReactDebugCurrentFrame_0.getCurrentStack = v9;
        v7.current = v10;
        v7.isRendering = false;
    end;
end;
v7.setIsRendering = function(v11)
    if l___DEV___0 then
        v7.isRendering = v11;
    end;
end;
v7.getIsRendering = function()
    if not l___DEV___0 then
        return false;
    else
        return v7.isRendering;
    end;
end;
return v7;
