local function _(v0)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v4.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Object_0 = v4.Object;
local l_setTimeout_0 = v4.setTimeout;
local l_clearTimeout_0 = v4.clearTimeout;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v11 = require(script.Parent.ReactRobloxComponentTree);
local l_precacheFiberNode_0 = v11.precacheFiberNode;
local l_uncacheFiberNode_0 = v11.uncacheFiberNode;
local l_updateFiberProps_0 = v11.updateFiberProps;
local v15 = require(script.Parent.ReactRobloxComponent);
local l_setInitialProperties_0 = v15.setInitialProperties;
local l_diffProperties_0 = v15.diffProperties;
local l_updateProperties_0 = v15.updateProperties;
local l_cleanupHostComponent_0 = v15.cleanupHostComponent;
local l_enableCreateEventHandleAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableCreateEventHandleAPI;
local _ = function(v21)
    if typeof(v21) ~= "Instance" then
        return ;
    else
        l_uncacheFiberNode_0(v21);
        for _, v23 in v21:GetDescendants() do
            l_uncacheFiberNode_0(v23);
        end;
        return ;
    end;
end;
local v25 = {};
l_Object_0.assign(v25, require(l_Parent_0.Shared).ReactFiberHostConfig.WithNoPersistence);
v25.getRootHostContext = function(v26)
    return v26.ClassName;
end;
v25.getChildHostContext = function(v27, _, _)
    return v27;
end;
v25.getPublicInstance = function(v30)
    return v30;
end;
v25.prepareForCommit = function(_)
    if l_enableCreateEventHandleAPI_0 then
        print("");
        print("");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
    return nil;
end;
v25.beforeActiveInstanceBlur = function()
    if l_enableCreateEventHandleAPI_0 then
        print("");
        print("");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v25.afterActiveInstanceBlur = function()
    if l_enableCreateEventHandleAPI_0 then
        print("");
        print("");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v25.resetAfterCommit = function(_)
end;
v25.createInstance = function(v33, v34, _, _, v37)
    local v38 = Instance.new(v33);
    if not v37.key then
        local l_return__0 = v37.return_;
        while l_return__0 do
            if not l_return__0.key then
                l_return__0 = l_return__0.return_;
            else
                v38.Name = l_return__0.key;
                break;
            end;
        end;
    else
        v38.Name = v37.key;
    end;
    l_precacheFiberNode_0(v37, v38);
    l_updateFiberProps_0(v38, v34);
    return v38;
end;
v25.appendInitialChild = function(v40, v41)
    v41.Parent = v40;
end;
v25.finalizeInitialChildren = function(v42, v43, v44, v45, _)
    l_setInitialProperties_0(v42, v43, v44, v45);
    return false;
end;
v25.prepareUpdate = function(v47, v48, v49, v50, v51, _)
    return l_diffProperties_0(v47, v48, v49, v50, v51);
end;
v25.shouldSetTextContent = function(_, _)
    return false;
end;
v25.createTextInstance = function(_, _, _, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"));
    error("FIXME (roblox): " .. "createTextInstance" .. " is unimplemented", 2);
    return nil;
end;
v25.isPrimaryRenderer = true;
v25.warnsIfNotActing = true;
v25.scheduleTimeout = l_setTimeout_0;
v25.cancelTimeout = l_clearTimeout_0;
v25.noTimeout = -1;
v25.supportsMutation = true;
v25.commitMount = function(_, _, _, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"));
    error("FIXME (roblox): " .. "commitMount" .. " is unimplemented", 2);
end;
v25.commitUpdate = function(v63, v64, _, v66, v67, _)
    l_updateFiberProps_0(v63, v67);
    l_updateProperties_0(v63, v64, v66);
end;
local function v70(v69)
    if typeof(v69) ~= "Instance" then
        l_console_0.warn("Could not check tags on non-instance %s.", l_inspect_0(v69));
        return ;
    else
        if not v69:IsDescendantOf(game) and #l_CollectionService_0:GetTags(v69) > 0 then
            l_console_0.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via" .. " CollectionService:GetTagged. If you're relying on tag" .. " behavior in a unit test, consider mounting your test " .. "root into the DataModel.", v69.ClassName, v69.Name);
        end;
        return ;
    end;
end;
v25.appendChild = function(v71, v72)
    v72.Parent = v71;
    if _G.__DEV__ then
        v70(v72);
    end;
end;
v25.appendChildToContainer = function(v73, v74)
    v25.appendChild(v73, v74);
end;
v25.insertBefore = function(v75, v76, _)
    v76.Parent = v75;
    if _G.__DEV__ then
        v70(v76);
    end;
end;
v25.insertInContainerBefore = function(v78, v79, v80)
    v25.insertBefore(v78, v79, v80);
end;
v25.removeChild = function(_, v82)
    if not (typeof(v82) ~= "Instance") then
        l_uncacheFiberNode_0(v82);
        for _, v84 in v82:GetDescendants() do
            l_uncacheFiberNode_0(v84);
        end;
    end;
    l_cleanupHostComponent_0(v82);
    v82.Parent = nil;
    v82:Destroy();
end;
v25.removeChildFromContainer = function(v85, v86)
    v25.removeChild(v85, v86);
end;
v25.clearSuspenseBoundary = function(_, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"));
    error("FIXME (roblox): " .. "clearSuspenseBoundary" .. " is unimplemented", 2);
end;
v25.clearSuspenseBoundaryFromContainer = function(_, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"));
    error("FIXME (roblox): " .. "clearSuspenseBoundaryFromContainer" .. " is unimplemented", 2);
end;
v25.hideInstance = function(_)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"));
    error("FIXME (roblox): " .. "hideInstance" .. " is unimplemented", 2);
end;
v25.hideTextInstance = function(_)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"));
    error("FIXME (roblox): " .. "hideTextInstance" .. " is unimplemented", 2);
end;
v25.unhideInstance = function(_, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"));
    error("FIXME (roblox): " .. "unhideInstance" .. " is unimplemented", 2);
end;
v25.unhideTextInstance = function(_, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"));
    error("FIXME (roblox): " .. "unhideTextInstance" .. " is unimplemented", 2);
end;
v25.clearContainer = function(v97)
    for _, v99 in v97:GetChildren() do
        v25.removeChild(v97, v99);
    end;
end;
v25.preparePortalMount = function(_)
end;
return v25;
