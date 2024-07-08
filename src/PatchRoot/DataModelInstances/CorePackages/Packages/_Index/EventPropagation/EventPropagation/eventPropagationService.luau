local v0 = require(script.Parent.Parent.FocusNavigationUtils);
local l_getAncestors_0 = v0.getAncestors;
local l_mockableWarn_0 = v0.mockableWarn;
local v3 = require(script.Parent.eventPropagationEvent);
local l___DEBUG_EVENT_PROPAGATION___0 = _G.__DEBUG_EVENT_PROPAGATION__;
local function v6(v5)
    return table.concat(table.pack(debug.info(v5, "sln")), " ");
end;
local function _(v7, v8)
    return v7[v8];
end;
local function _(v10, v11, v12)
    local v13 = v10[v11];
    if not v13 then
        return nil;
    else
        return v13[v12];
    end;
end;
local function _(v15, v16, v17, v18)
    local v19 = v15[v16];
    local v20 = if not v19 then nil else v19[v17];
    if v20 ~= nil then
        return v20[v18];
    else
        return nil;
    end;
end;
local v22 = {};
v22.__index = v22;
v22.registerEventHandler = function(v23, v24, v25, v26, v27)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("+++ register handler", v25, tostring(v24), v27 or "Bubble");
    end;
    local v28 = v27 or "Bubble";
    v23.eventHandlerRegistry[v24] = v23.eventHandlerRegistry[v24] or {};
    v23.eventHandlerRegistry[v24][v25] = v23.eventHandlerRegistry[v24][v25] or {};
    if _G.__DEV__ then
        local v29 = v23.eventHandlerRegistry[v24][v25][v28];
        if v29 then
            l_mockableWarn_0(string.format("New handler bound to the %s phase of '%s' will override an existing handler:" .. "\n\tprevious handler: %s\n\t     new handler: %s", v28, v25, table.concat(table.pack(debug.info(v26, "sln")), " "), v6(v29)));
        end;
    end;
    v23.eventHandlerRegistry[v24][v25][v28] = v26;
end;
v22.registerEventHandlers = function(v30, v31, v32)
    if not v30.eventHandlerRegistry[v31] then
        v30.eventHandlerRegistry[v31] = {};
    end;
    for v33, v34 in v32, nil, nil do
        v30:registerEventHandler(v31, v33, v34.handler, v34.phase);
    end;
end;
v22.deregisterEventHandlers = function(v35, v36, v37)
    if v35.eventHandlerRegistry[v36] then
        for v38, v39 in v37, nil, nil do
            v35:deregisterEventHandler(v36, v38, v39.handler, v39.phase);
        end;
        return ;
    else
        return ;
    end;
end;
v22.deregisterEventHandler = function(v40, v41, v42, v43, v44)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("--- deregister handler", v42, tostring(v41), v44 or "Bubble");
    end;
    local v45 = v44 or "Bubble";
    local v46 = v40.eventHandlerRegistry[v41];
    local v47 = if not v46 then nil else v46[v42];
    if not v47 or not v47[v45] then
        if _G.__DEV__ then
            l_mockableWarn_0(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", v45, v42));
        end;
        return ;
    else
        if _G.__DEV__ then
            local v48 = v47[v45];
            if v48 ~= v43 then
                l_mockableWarn_0(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':" .. "\n\tprevious handler: %s\n\t     new handler: %s", v45, v42, if type(v43) == "function" then table.concat(table.pack(debug.info(v43, "sln")), " ") else tostring(v43), if type(v48) == "function" then table.concat(table.pack(debug.info(v48, "sln")), " ") else tostring(v48)));
            end;
        end;
        v47[v45] = nil;
        return ;
    end;
end;
v22.getRegisteredEventHandlers = function(v49, v50)
    local v51 = v49.eventHandlerRegistry[v50];
    if not v51 then
        return nil;
    else
        local v52 = {};
        for v53, v54 in v51, nil, nil do
            v52[v53] = next(v54) ~= nil;
        end;
        return v52;
    end;
end;
v22.propagateEvent = function(v55, v56, v57, v58, v59)
    local function _(v60, v61)
        local l_eventHandlerRegistry_0 = v55.eventHandlerRegistry;
        local l_v57_0 = v57;
        local v64 = l_eventHandlerRegistry_0[v60];
        local v65 = if not v64 then nil else v64[l_v57_0];
        local v66 = if v65 ~= nil then v65[v61] else nil;
        if not v66 then
            return false;
        else
            l_eventHandlerRegistry_0 = v3.new(v56, v60, v57, v61, v58);
            v66(l_eventHandlerRegistry_0);
            return l_eventHandlerRegistry_0.cancelled;
        end;
    end;
    local v68 = false;
    local v69 = if not v59 then l_getAncestors_0(v56) else {
        v56
    };
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print(">>> capture event", v57, "for", (tostring(v56)));
    end;
    for v70 = #v69, 1, -1 do
        local v71 = v69[v70];
        local v72 = v55.eventHandlerRegistry[v71];
        local v73 = if not v72 then nil else v72[v57];
        local v74 = if v73 ~= nil then v73.Capture else nil;
        if not v74 then
            v68 = false;
        else
            local v75 = v3.new(v56, v71, v57, "Capture", v58);
            v74(v75);
            v68 = v75.cancelled;
        end;
        if v68 then
            return ;
        end;
    end;
    local v76 = v55.eventHandlerRegistry[v56];
    local v77 = if not v76 then nil else v76[v57];
    local v78 = if v77 ~= nil then v77.Target else nil;
    if not v78 then
        v68 = false;
    else
        local v79 = v3.new(v56, v56, v57, "Target", v58);
        v78(v79);
        v68 = v79.cancelled;
    end;
    if not v68 then
        if l___DEBUG_EVENT_PROPAGATION___0 then
            print("<<< bubble event", v57, "from", (tostring(v56)));
        end;
        for v80 = 1, #v69 do
            v76 = v69[v80];
            local v81 = v55.eventHandlerRegistry[v76];
            local v82 = if not v81 then nil else v81[v57];
            local v83 = if v82 ~= nil then v82.Bubble else nil;
            if not v83 then
                v68 = false;
            else
                local v84 = v3.new(v56, v76, v57, "Bubble", v58);
                v83(v84);
                v68 = v84.cancelled;
            end;
            if v68 then
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v22.new = function()
    local v85 = {
        eventHandlerRegistry = setmetatable({}, {
            __mode = "k"
        })
    };
    setmetatable(v85, v22);
    return v85;
end;
return v22;
