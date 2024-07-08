local v0 = require(script.Parent.Parent.Cryo);
local v1 = require(script.Parent.Input);
local v2 = require(script.Parent.createSignal);
local v3 = require(script.Parent.debugPrint);
local v4 = require(script.Parent.FocusControllerInternalApi);
local v5 = {};
v5.__index = v5;
v5.new = function()
    return (setmetatable({
        selectionChangedSignal = v2(), 
        boundInputsChangedSignal = v2(), 
        focusNodeTree = {}, 
        allNodes = {}, 
        rootRef = nil, 
        engineInterface = nil, 
        captureFocusOnInitialize = false, 
        moveFocusToOnInitialize = nil, 
        inputDisconnectors = {}, 
        boundInputs = {}, 
        focusedLeaf = nil, 
        inProgressFocus = nil
    }, v5));
end;
v5.isInitialized = function(v6)
    return v6.engineInterface ~= nil;
end;
v5.moveFocusTo = function(v7, v8)
    if v7.engineInterface == nil then
        v7.moveFocusToOnInitialize = v8;
        return ;
    else
        v3("[FOCUS] Move focus to", v8);
        local v9 = v7.allNodes[v8];
        if not (not (v9 ~= nil) or v7:isNodeFocused(v9)) then
            v9:focus();
        end;
        v7:debugPrintTree();
        return ;
    end;
end;
v5.moveFocusToNeighbor = function(v10, v11)
    if v10.engineInterface == nil then
        error("FocusController is not connected to a component hierarchy", 2);
    end;
    if v10.focusedLeaf ~= nil then
        v3("[FOCUS] Move focus to", v11, "from", v10.focusedLeaf.ref);
        local v12 = v10.focusedLeaf.ref:getValue();
        if v12 ~= nil and v12[v11] ~= nil then
            v10:setSelection(v12[v11]);
        end;
    end;
end;
v5.getSelection = function(v13)
    return v13.engineInterface.getSelection();
end;
v5.setSelection = function(v14, v15)
    v14.engineInterface.setSelection(v15);
end;
v5.registerNode = function(v16, v17, v18, v19)
    if v17 ~= nil then
        v3("[TREE ] Registering child node", v18);
        local v20 = v16.focusNodeTree[v17] or {};
        v20[v18] = v19;
        v16.focusNodeTree[v17] = v20;
        v16.allNodes[v18] = v19;
        v16:descendantAddedRefocus();
        return ;
    else
        v3("[TREE ] Registering root node", v18);
        v16.rootRef = v18;
        v16.allNodes[v18] = v19;
        if v16.captureFocusOnRootRegistered then
            v16.captureFocusOnRootRegistered = false;
            v16:captureFocus();
        end;
        return ;
    end;
end;
v5.deregisterNode = function(v21, v22, v23)
    if v22 ~= nil then
        v3("[TREE ] Deregistering child node", v23);
        v21.focusNodeTree[v22][v23] = nil;
        v21.allNodes[v23] = nil;
        v21:descendantRemovedRefocus();
        return ;
    else
        v3("[TREE ] Deregistering root node", v23);
        v21.allNodes[v23] = nil;
        return ;
    end;
end;
v5.needsDescendantRemovedRefocus = function(v24)
    if v24.focusedLeaf == nil then
        return ;
    else
        return v24.focusedLeaf.ref:getValue() == nil;
    end;
end;
v5.descendantRemovedRefocus = function(v25)
    if v25:needsDescendantRemovedRefocus() then
        v3("[FOCUS] Focused node was removed; refocusing from nearest existing ancestor");
        local l_parent_0 = v25.focusedLeaf.parent;
        while l_parent_0 ~= nil and v25.allNodes[l_parent_0.ref] == nil do
            l_parent_0 = l_parent_0.parent;
        end;
        if l_parent_0 ~= nil then
            l_parent_0:focus();
        end;
    end;
end;
v5.needsDescendantAddedRefocus = function(v27)
    if v27.focusedLeaf == nil then
        return nil;
    else
        return not v0.isEmpty(v27:getChildren(v27.focusedLeaf));
    end;
end;
v5.descendantAddedRefocus = function(v28)
    if v28:needsDescendantAddedRefocus() then
        v3("[FOCUS] Currently-focused node is no longer a leaf; refocusing", v28.focusedLeaf.ref);
        v28.focusedLeaf:focus();
    end;
end;
v5.getChildren = function(v29, v30)
    return v29.focusNodeTree[v30] or {};
end;
v5.isNodeFocused = function(v31, v32)
    if v31.focusedLeaf == nil then
        return false;
    elseif v31.focusedLeaf == v32 then
        return true;
    else
        local l_parent_1 = v31.focusedLeaf.parent;
        while true do
            if l_parent_1 ~= nil then
                if l_parent_1 == v32 then
                    return true;
                else
                    l_parent_1 = l_parent_1.parent;
                end;
            else
                return false;
            end;
        end;
    end;
end;
v5.setFocusedLeaf = function(v34, v35)
    v34.focusedLeaf = v35;
end;
v5.setInProgressFocus = function(v36, v37)
    v36.inProgressFocus = v37;
end;
v5.isInProgressFocus = function(v38, v39)
    return v38.inProgressFocus == v39;
end;
v5.debugPrintTree = function(v40)
    if v3.isEnabled then
        local function v41(v42, v43)
            local v44 = tostring(v42.ref);
            if v40:isNodeFocused(v42) then
                v44 = v44 .. "*";
            end;
            v3(v43, v44);
            for _, v46 in pairs((v40:getChildren(v42))) do
                v41(v46, v43 .. "  ");
            end;
        end;
        v3("Focus Node Tree:");
        v41(v40.allNodes[v40.rootRef], "  ");
        return ;
    else
        return ;
    end;
end;
v5.updateInputBindings = function(v47)
    local v48 = {};
    local l_focusedLeaf_0 = v47.focusedLeaf;
    while l_focusedLeaf_0 ~= nil do
        for _, v51 in pairs(l_focusedLeaf_0.inputBindings) do
            local v52 = v1.getUniqueKey(v51);
            if v48[v52] == nil then
                v3("[INPUT] Bind input", v52);
                v48[v52] = v51;
            end;
        end;
        l_focusedLeaf_0 = l_focusedLeaf_0.parent;
    end;
    for _, v54 in pairs(v47.inputDisconnectors) do
        v54();
    end;
    v47.inputDisconnectors = {};
    v47.boundInputs = {};
    for v55, v56 in pairs(v48) do
        v47.inputDisconnectors[v55] = v1.connectToEvent(v56, v47.engineInterface);
        if v56.keyCode then
            v47.boundInputs[v56.keyCode] = v56.meta or {};
        end;
    end;
    v47.boundInputsChangedSignal:fire(v47.boundInputs);
end;
v5.initialize = function(v57, v58)
    if v57.engineInterface ~= nil then
        error("FocusController cannot be initialized more than once; make sure you are not passing it to multiple components");
    end;
    v57.engineInterface = v58;
    v57.guiServiceConnection = v58.subscribeToSelectionChanged(function()
        if v57.rootRef == nil then
            return ;
        else
            local v59 = v57.focusedLeaf ~= nil;
            v57.focusedLeaf = nil;
            local v60 = v58.getSelection();
            local v61 = v57.rootRef:getValue();
            if not (not (v60 ~= nil) or v61 ~= v60 and not v60:IsDescendantOf(v61)) then
                v3("[EVENT] Selection changed to", v60, "in focus hierarchy beginning at", v61);
                for v62, v63 in pairs(v57.allNodes) do
                    if v60 == v62:getValue() then
                        v57.focusedLeaf = v63;
                        break;
                    end;
                end;
            end;
            if not (v57.focusedLeaf == nil and not v59) then
                v57.selectionChangedSignal:fire();
                v57:updateInputBindings();
            end;
            return ;
        end;
    end);
    if v57.captureFocusOnInitialize then
        v57:captureFocus();
    end;
    if v57.moveFocusToOnInitialize then
        v57:moveFocusTo(v57.moveFocusToOnInitialize);
    end;
end;
v5.captureFocus = function(v64)
    if v64.engineInterface == nil then
        v64.captureFocusOnInitialize = true;
        return ;
    elseif v64.rootRef == nil then
        v64.captureFocusOnRootRegistered = true;
        return ;
    else
        v64.allNodes[v64.rootRef]:focus();
        v64:debugPrintTree();
        return ;
    end;
end;
v5.releaseFocus = function(v65)
    if v65.engineInterface ~= nil then
        v65.engineInterface.setSelection(nil);
    end;
    v65.captureFocusOnInitialize = false;
    v65.captureFocusOnRootRegistered = false;
end;
v5.teardown = function(v66)
    if v66.guiServiceConnection ~= nil then
        v66.guiServiceConnection:Disconnect();
    end;
    for _, v68 in pairs(v66.inputDisconnectors) do
        v68();
    end;
    v66.rootRef = nil;
    v66.engineInterface = nil;
    v66.captureFocusOnInitialize = false;
    v66.captureFocusOnRootRegistered = false;
    v66.focusedLeaf = nil;
end;
v5.subscribeToSelectionChange = function(v69, v70)
    v3("[TREE ] New subscription to selection change event");
    return v69.selectionChangedSignal:subscribe(v70);
end;
v5.createPublicApiWrapper = function()
    local v71 = v5.new();
    return {
        [v4] = v71, 
        moveFocusTo = function(...)
            v71:moveFocusTo(...);
        end, 
        moveFocusLeft = function()
            v71:moveFocusToNeighbor("NextSelectionLeft");
        end, 
        moveFocusRight = function()
            v71:moveFocusToNeighbor("NextSelectionRight");
        end, 
        moveFocusUp = function()
            v71:moveFocusToNeighbor("NextSelectionUp");
        end, 
        moveFocusDown = function()
            v71:moveFocusToNeighbor("NextSelectionDown");
        end, 
        captureFocus = function()
            v71:captureFocus();
        end, 
        releaseFocus = function()
            v71:releaseFocus();
        end, 
        getCurrentFocus = function()
            local l_focusedLeaf_1 = v71.focusedLeaf;
            return not not l_focusedLeaf_1 and l_focusedLeaf_1.ref or nil;
        end, 
        getBoundInputs = function()
            return v71.boundInputs;
        end, 
        subscribeToBoundInputsChanged = function(v73)
            return v71.boundInputsChangedSignal:subscribe(v73);
        end
    };
end;
return v5;
