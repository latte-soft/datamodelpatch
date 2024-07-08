local v0 = require(script.Parent.Parent.Cryo);
local v1 = require(script.Parent.FocusControllerInternalApi);
local v2 = require(script.Parent.inputBindingsEqual);
local v3 = require(script.Parent.debugPrint);
local v4 = require(script.Parent.Config);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7)
    local v8 = nil;
    if v6.parentFocusNode ~= nil then
        v8 = v6.parentFocusNode.focusController;
    elseif v6.focusController ~= nil then
        v8 = v6.focusController;
    else
        error("Cannot create node without focus manager");
    end;
    local v9 = setmetatable({
        focusController = v8, 
        ref = v7, 
        lastFocused = nil
    }, v5);
    v9:updateNavProps(v6);
    return v9;
end;
v5.__getFocusControllerInternal = function(v10)
    return v10.focusController[v1];
end;
v5.__findDefaultChildNode = function(v11)
    local l_huge_0 = math.huge;
    local v13 = nil;
    local v14 = v11:__getFocusControllerInternal():getChildren(v11);
    local v15 = v11.ref:getValue();
    for v16, v17 in pairs(v14) do
        local v18 = v16:getValue();
        while v18 ~= v15 and v18 ~= nil do
            if v18:isA("GuiObject") then
                local l_LayoutOrder_0 = v18.LayoutOrder;
                if l_LayoutOrder_0 ~= 0 then
                    if l_LayoutOrder_0 < l_huge_0 then
                        l_huge_0 = l_LayoutOrder_0;
                        v13 = v17;
                        break;
                    else
                        break;
                    end;
                end;
            end;
            v18 = v18.Parent;
        end;
    end;
    if v13 ~= nil then
        return v13;
    else
        for v20, v21 in pairs(v14) do
            if v20:getValue() ~= nil then
                return v21;
            end;
        end;
        return nil;
    end;
end;
v5.updateNavProps = function(v22, v23)
    local v24 = false;
    if v23.restorePreviousChildFocus ~= nil then
        v24 = v23.restorePreviousChildFocus;
    end;
    local l_inputBindings_0 = v22.inputBindings;
    v22.defaultChildRef = v23.defaultChild;
    v22.restorePreviousChildFocus = v24;
    v22.inputBindings = v23.inputBindings or {};
    local v26 = v22:__getFocusControllerInternal();
    if not (not v26:isNodeFocused(v22) or v2(l_inputBindings_0, v22.inputBindings)) then
        v26:updateInputBindings();
    end;
end;
v5.focus = function(v27)
    if v4.Enabled then
        local v28 = v27:__getFocusControllerInternal();
        if v28:isInitialized() then
            v28:setInProgressFocus(v27);
            if not v0.isEmpty((v28:getChildren(v27))) then
                local v29 = os.clock();
                local v30 = false;
                if v27.defaultChildRef ~= nil then
                    v30 = false;
                    if v28.allNodes[v27.defaultChildRef] ~= nil then
                        v30 = v27.defaultChildRef:getValue() ~= nil;
                    end;
                end;
                local v31 = true;
                if v27.timeout ~= nil then
                    v31 = v29 < v27.timeout;
                end;
                if not (v27.restorePreviousChildFocus and v27.lastFocused ~= nil) or not v27.lastFocused:getValue() then
                    if not v27.defaultChildRef or not v31 and not v30 then
                        if v27.timeout ~= nil then
                            v3("[FOCUS] Timeout for default child of", v27.ref);
                            v27.timeout = nil;
                        end;
                        local v32 = v27:__findDefaultChildNode();
                        if v32 ~= nil then
                            v3("[FOCUS] No default, use fallback logic to focus", v32.ref);
                            v32:focus();
                            return ;
                        else
                            v28:setFocusedLeaf(v27);
                            v28:setInProgressFocus(nil);
                            return ;
                        end;
                    elseif not v30 then
                        if v27.timeout == nil then
                            v3("[FOCUS] Default child specified is not valid. Wait for it to be assigned...");
                            v27.timeout = v29 + 0.5;
                        end;
                        task.delay(0, function()
                            if v28:isInProgressFocus(v27) then
                                v27:focus();
                            end;
                        end);
                        return ;
                    else
                        v3("[FOCUS] Found valid default child", v27.defaultChildRef, "for", v27.ref);
                        v27.timeout = nil;
                        v28:moveFocusTo(v27.defaultChildRef);
                        return ;
                    end;
                else
                    v3("[FOCUS] Restore previous focus:", v27.lastFocused);
                    v28:moveFocusTo(v27.lastFocused);
                    return ;
                end;
            else
                v28:setSelection(v27.ref:getValue());
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v5.attachToTree = function(v33, v34, v35)
    local v36 = v33:__getFocusControllerInternal();
    v36:registerNode(v34, v33.ref, v33);
    v33.parent = v34;
    v33.disconnectSelectionListener = v36:subscribeToSelectionChange(function()
        local v37 = v36:isNodeFocused(v33);
        v35(v37);
        if not (not (v33.parent ~= nil) or not v37) then
            v33.parent.lastFocused = v33.ref;
        end;
        if not (v0.isEmpty((v36:getChildren(v33))) or not v37) and v36:getSelection() == v33.ref:getValue() then
            v33:focus();
        end;
    end);
end;
v5.detachFromTree = function(v38)
    v38:__getFocusControllerInternal():deregisterNode(v38.parent, v38.ref);
    if v38.disconnectSelectionListener ~= nil then
        v38.disconnectSelectionListener();
        v38.disconnectSelectionListener = nil;
    end;
end;
return v5;
