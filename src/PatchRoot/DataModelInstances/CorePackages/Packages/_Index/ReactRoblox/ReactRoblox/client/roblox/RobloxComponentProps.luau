local l___DEV___0 = _G.__DEV__;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_String_0 = v3.String;
local l_inspect_0 = v3.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v11 = require(script.Parent.SingleEventManager);
local l_Type_0 = require(l_Parent_0.Shared).Type;
local v13 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local l_Tag_0 = require(l_Parent_0.React).Tag;
local v16 = {};
local v17 = {};
local function v18(...)
    return ...;
end;
local function v24(v19, v20, v21)
    if v21 == nil then
        local _, v23 = v13(v19.ClassName, v20);
        v21 = v23;
    end;
    v19[v20] = v21;
end;
local function _(v25, v26)
    local v27 = v17[v25];
    if v27 ~= nil then
        v27[v26]();
        v27[v26] = nil;
    end;
end;
local function v37(v29, v30, v31)
    local function v36(v32)
        local v33, v34 = xpcall(v24, v18, v29, v30, v32);
        if not v33 then
            local v35 = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", v30, v29.Name, v29.ClassName, tostring(v32), v34, v31._source or "<enable DEV mode for stack>");
            l_console_0.error(v35);
            error(v35, 0);
        end;
    end;
    if v17[v29] == nil then
        v17[v29] = {};
    end;
    v17[v29][v30] = v9.__subscribeToBinding(v31, v36);
    v36(v31:getValue());
end;
local function v47(v38, v39, v40)
    if (l___DEV___0 and v40 ~= nil) and typeof(v40) ~= "string" then
        l_console_0.error("Type provided for ReactRoblox.Tag is invalid - tags should be " .. "specified as a single string, with individual tags delimited " .. "by spaces. Instead received:\n%s", l_inspect_0(v40));
        return ;
    else
        local v41 = l_Set_0.new(l_String_0.split(v39 or "", " "));
        local v42 = l_Set_0.new(l_String_0.split(v40 or "", " "));
        for _, v44 in v41, nil, nil do
            if not v42:has(v44) then
                l_CollectionService_0:RemoveTag(v38, v44);
            end;
        end;
        for _, v46 in v42, nil, nil do
            if not v41:has(v46) then
                l_CollectionService_0:AddTag(v38, v46);
            end;
        end;
        return ;
    end;
end;
local _ = function(v48)
    for _, v50 in l_CollectionService_0:GetTags(v48) do
        l_CollectionService_0:RemoveTag(v48, v50);
    end;
end;
local function v65(v52, v53, v54, v55)
    local v56 = l_Type_0.of(v53);
    if not (v56 ~= l_Type_0.HostEvent) or v56 == l_Type_0.HostChangeEvent then
        local v57 = v16[v52];
        if v57 == nil then
            v57 = v11.new(v52);
            v16[v52] = v57;
        end;
        local l_name_0 = v53.name;
        if v56 == l_Type_0.HostChangeEvent then
            v57:connectPropertyChange(l_name_0, v54);
            return ;
        else
            v57:connectEvent(l_name_0, v54);
            return ;
        end;
    else
        local v59 = false;
        if typeof(v54) == "table" then
            v59 = v54["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v60 = false;
        if v55 ~= nil then
            v60 = false;
            if typeof(v55) == "table" then
                v60 = v55["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v60 then
            local v61 = v17[v52];
            if v61 ~= nil then
                v61[v53]();
                v61[v53] = nil;
            end;
        end;
        if not v59 then
            if v53 == l_Tag_0 then
                v47(v52, v55, v54);
                return ;
            else
                local l_v54_0 = v54;
                if l_v54_0 == nil then
                    local _, v64 = v13(v52.ClassName, v53);
                    l_v54_0 = v64;
                end;
                v52[v53] = l_v54_0;
                return ;
            end;
        else
            v37(v52, v53, v54);
            return ;
        end;
    end;
end;
local function v70(v66, v67)
    for v68, v69 in v67, nil, nil do
        if v68 ~= "ref" and v68 ~= "children" then
            v65(v66, v68, v69);
        end;
    end;
end;
local function v78(v71, _, v73, _)
    local v75, v76 = xpcall(v70, v18, v71, v73);
    if not v75 then
        local v77 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", v71.Name, v71.ClassName, v76);
        l_console_0.error(v77);
        error(v77, 0);
    end;
    if v16[v71] ~= nil then
        v16[v71]:resume();
    end;
end;
local function v85(v79, v80, v81)
    for v82 = 1, #v80, 2 do
        local v83 = v80[v82];
        local v84 = v80[v82 + 1];
        if v84 == l_Object_0.None then
            v84 = nil;
        end;
        if v83 ~= "ref" and v83 ~= "children" then
            v65(v79, v83, v84, v81[v83]);
        end;
    end;
end;
return {
    setInitialProperties = v78, 
    updateProperties = function(v86, v87, v88)
        if v16[v86] ~= nil then
            v16[v86]:suspend();
        end;
        local v89, v90 = xpcall(v85, v18, v86, v87, v88);
        if not v89 then
            local v91 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", v86.Name, v86.ClassName, v90);
            l_console_0.error(v91);
            error(v91, 0);
        end;
        if v16[v86] ~= nil then
            v16[v86]:resume();
        end;
    end, 
    cleanupHostComponent = function(v92)
        if v16[v92] ~= nil then
            v16[v92] = nil;
        end;
        if v17[v92] ~= nil then
            v17[v92] = nil;
        end;
        if typeof(v92) ~= "Instance" then
            return ;
        else
            for _, v94 in l_CollectionService_0:GetTags(v92) do
                l_CollectionService_0:RemoveTag(v92, v94);
            end;
            for _, v96 in v92:GetDescendants() do
                if v16[v96] ~= nil then
                    v16[v96] = nil;
                end;
                if v17[v96] ~= nil then
                    v17[v96] = nil;
                end;
                for _, v98 in l_CollectionService_0:GetTags(v92) do
                    l_CollectionService_0:RemoveTag(v92, v98);
                end;
            end;
            return ;
        end;
    end, 
    _instanceToEventManager = v16, 
    _instanceToBindings = v17
};
