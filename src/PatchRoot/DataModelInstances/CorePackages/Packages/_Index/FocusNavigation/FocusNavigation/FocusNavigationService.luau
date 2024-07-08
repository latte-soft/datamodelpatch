local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.EventPropagation);
local v2 = require(l_Parent_0.FocusNavigationUtils);
local l_createSignal_0 = v2.createSignal;
local l_shallowEqual_0 = v2.shallowEqual;
local l_getAncestors_0 = v2.getAncestors;
local l_mockableWarn_0 = v2.mockableWarn;
local v7 = require(script.Parent.isValidFocusTarget);
local _ = require(script.Parent.types);
local v9 = {};
v9.__index = v9;
v9.new = function(v10)
    local v11, v12 = l_createSignal_0({});
    local v13, v14 = l_createSignal_0(v10.getSelection());
    local v15 = setmetatable({
        _eventPropagationService = v1.new(), 
        _engineInterface = v10, 
        _eventMapByInstance = setmetatable({}, {
            __mode = "k"
        }), 
        _focusBehaviorByInstance = setmetatable({}, {
            __mode = "k"
        }), 
        _engineEventConnections = {}, 
        _silentFocusTarget = nil, 
        _silentBlurTarget = nil, 
        _fireActiveEventMapSignal = v12, 
        _fireFocusedGuiObjectSignal = v14, 
        activeEventMap = v11, 
        focusedGuiObject = v13
    }, v9);
    v15:_connectToInputEvents();
    return v15;
end;
v9._fireInputEvent = function(v16, v17, v18, v19)
    local v20 = v16.activeEventMap:getValue()[v18.KeyCode];
    if v20 then
        v16._eventPropagationService:propagateEvent(v17, v20, {
            Delta = v18.Delta, 
            KeyCode = v18.KeyCode, 
            Position = v18.Position, 
            UserInputState = v18.UserInputState, 
            UserInputType = v18.UserInputType, 
            wasProcessed = v19
        }, false);
    end;
end;
v9._connectToInputEvents = function(v21)
    local function v25(v22, v23)
        local v24 = v21._engineInterface.getSelection();
        if v24 then
            v21:_fireInputEvent(v24, v22, v23);
        end;
    end;
    table.insert(v21._engineEventConnections, v21._engineInterface.InputBegan:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.InputChanged:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.InputEnded:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.SelectionChanged:Connect(function()
        local v26 = v21.focusedGuiObject:getValue();
        local v27 = v21._engineInterface.getSelection();
        if v26 then
            v21._eventPropagationService:propagateEvent(v26, "blur", nil, v21._silentBlurTarget == v26);
            v21._silentBlurTarget = nil;
        end;
        v21._fireFocusedGuiObjectSignal(v27);
        if v27 then
            v21._eventPropagationService:propagateEvent(v27, "focus", nil, v27 == v21._silentFocusTarget);
            v21._silentFocusTarget = nil;
        end;
        v21:_updateActiveEventMap(v26);
    end));
end;
v9._cancelHandler = function(v28, v29, v30)
    if v30 ~= "blur" and v30 ~= "focus" then
        v28._eventPropagationService:propagateEvent(v29, v30, {
            KeyCode = Enum.KeyCode.Unknown, 
            UserInputType = Enum.UserInputType.None, 
            UserInputState = Enum.UserInputState.Cancel
        }, false);
    end;
end;
v9._updateActiveEventMap = function(v31, v32)
    local v33 = {};
    local v34 = v31._engineInterface.getSelection();
    if v34 then
        local v35 = l_getAncestors_0(v34);
        local v36 = {};
        for v37 = #v35, 1, -1 do
            local v38 = v35[v37];
            local v39 = v31._eventMapByInstance[v38];
            if v39 then
                for v40, v41 in v39, nil, nil do
                    v36[v40] = v41;
                    v33[v40] = nil;
                end;
            end;
            local v42 = v31._eventPropagationService:getRegisteredEventHandlers(v38);
            if v42 then
                for v43, v44 in v36, nil, nil do
                    if v42[v44] then
                        v33[v43] = v44;
                    end;
                end;
            end;
        end;
    end;
    local v45 = v31.activeEventMap:getValue();
    if not l_shallowEqual_0(v45, v33) then
        if v32 then
            for v46, v47 in v45, nil, nil do
                if not v33[v46] then
                    v31:_cancelHandler(v32, v47);
                end;
            end;
        end;
        v31._fireActiveEventMapSignal(v33);
    end;
end;
v9.registerEventMap = function(v48, v49, v50)
    local v51 = v48._eventMapByInstance[v49] or {};
    for v52, v53 in v50, nil, nil do
        if not (not (v51[v52] and v51[v52] ~= v53) or not _G.__DEV__) then
            l_mockableWarn_0(string.format("New event will replace existing registered event mapped to %s:" .. "\n\t     new event: %s\n\texisting event: %s", tostring(v52), v53, v51[v52]));
        end;
        v51[v52] = v53;
    end;
    v48._eventMapByInstance[v49] = v51;
    v48:_updateActiveEventMap();
end;
v9.deregisterEventMap = function(v54, v55, v56)
    local v57 = v54._eventMapByInstance[v55] or {};
    for v58, v59 in v56, nil, nil do
        if v57[v58] == v59 then
            v57[v58] = nil;
        elseif _G.__DEV__ then
            l_mockableWarn_0(string.format("Cannot deregister non-matching event input %s:" .. "\n\t  provided event: %s\n\tregistered event: %s", tostring(v58), v59, v57[v58]));
        end;
    end;
    v54._eventMapByInstance[v55] = v57;
    v54:_updateActiveEventMap(v54.focusedGuiObject:getValue());
end;
v9.registerEventHandler = function(v60, v61, v62, v63, v64)
    v60._eventPropagationService:registerEventHandler(v61, v62, v63, v64);
    v60:_updateActiveEventMap();
end;
v9.deregisterEventHandler = function(v65, v66, v67, v68, v69)
    v65:_cancelHandler(v66, v67);
    v65._eventPropagationService:deregisterEventHandler(v66, v67, v68, v69);
    v65:_updateActiveEventMap(v65.focusedGuiObject:getValue());
end;
v9.registerEventHandlers = function(v70, v71, v72)
    v70._eventPropagationService:registerEventHandlers(v71, v72);
    v70:_updateActiveEventMap();
end;
v9.deregisterEventHandlers = function(v73, v74, v75)
    for v76, _ in v75, nil, nil do
        v73:_cancelHandler(v74, v76);
    end;
    v73._eventPropagationService:deregisterEventHandlers(v74, v75);
    v73:_updateActiveEventMap(v73.focusedGuiObject:getValue());
end;
v9.registerFocusBehavior = function(v78, v79, v80)
    if _G.__DEV__ then
        local v81 = v78._focusBehaviorByInstance[v79];
        if v81 ~= nil then
            l_mockableWarn_0(string.format("New focus behavior will replace existing registered focus behavior:" .. "\n\t     new behavior: %s\n\texisting behavior: %s", tostring(v80), (tostring(v81.behavior))));
        end;
    end;
    v78._focusBehaviorByInstance[v79] = {
        behavior = v80, 
        connection = v79.SelectionChanged:Connect(function(v82, v83, v84)
            if not (not v84 or not v82 and not v84:IsDescendantOf(v79)) then
                if v83 and v83:IsDescendantOf(v79) then
                    if v80.onDescendantFocusChanged then
                        v80.onDescendantFocusChanged(v84);
                    end;
                else
                    local v85 = false;
                    for _, v87 in v80.getTargets() do
                        if v7(v87) then
                            v78:focusGuiObject(v87, false);
                            v85 = true;
                            break;
                        end;
                    end;
                    if not (v85 or not v80.onDescendantFocusChanged) then
                        v80.onDescendantFocusChanged(v84);
                        return ;
                    end;
                end;
            end;
        end)
    };
end;
v9.deregisterFocusBehavior = function(v88, v89, v90)
    local v91 = v88._focusBehaviorByInstance[v89];
    if _G.__DEV__ then
        if not v91 then
            l_mockableWarn_0(string.format("Cannot deregister an unregistered focus behavior:" .. "\n\t  provided behavior: %s", (tostring(v90))));
        end;
        if v91 and v91.behavior ~= v90 then
            l_mockableWarn_0(string.format("Cannot deregister non-matching focus behavior:" .. "\n\t  provided behavior: %s\n\tregistered behavior: %s", tostring(v90), (tostring(v91.behavior))));
        end;
    end;
    if v91 then
        v91.connection:Disconnect();
        v88._focusBehaviorByInstance[v89] = nil;
    end;
end;
v9.focusGuiObject = function(v92, v93, v94)
    if not v94 then
        v92._silentBlurTarget = nil;
        v92._silentFocusTarget = nil;
    else
        v92._silentBlurTarget = v92._engineInterface.getSelection();
        v92._silentFocusTarget = v93;
    end;
    v92._engineInterface.setSelection(v93);
end;
v9.teardown = function(v95)
    for _, v97 in v95._engineEventConnections, nil, nil do
        v97:Disconnect();
    end;
    for _, v99 in v95._focusBehaviorByInstance, nil, nil do
        v99.connection:Disconnect();
    end;
end;
return v9;
