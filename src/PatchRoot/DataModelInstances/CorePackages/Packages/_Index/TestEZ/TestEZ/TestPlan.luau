local v0 = require(script.Parent.TestEnum);
local v1 = require(script.Parent.Expectation);
local function v4()
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("CoreScriptSyncService");
    end);
    return not not l_status_0 and l_result_0 or nil;
end;
local v5 = nil;
local function v9(v6)
    if v5 == nil then
        v5 = v4() or false;
    end;
    local l_status_1, l_result_1 = pcall(function()
        if v5 then
            return v5:GetScriptFilePath(v6);
        else
            return nil;
        end;
    end);
    return not not l_status_1 and l_result_1 or nil;
end;
local function v44(v10, v11, v12)
    local v13 = {};
    if v11 then
        if type(v11) ~= "table" then
            error(("Bad argument #2 to newEnvironment. Expected table, got %s"):format((typeof(v11))), 2);
        end;
        for v14, v15 in pairs(v11) do
            v13[v14] = v15;
        end;
    end;
    local function v21(v16, v17, v18, v19)
        local v20 = v10:addChild(v16, v18, v19, v12);
        v20.callback = v17;
        if v18 == v0.NodeType.Describe then
            v20:expand();
        end;
        return v20;
    end;
    v13.describeFOCUS = function(v22, v23)
        v21(v22, v23, v0.NodeType.Describe, v0.NodeModifier.Focus);
    end;
    v13.describeSKIP = function(v24, v25)
        v21(v24, v25, v0.NodeType.Describe, v0.NodeModifier.Skip);
    end;
    v13.describe = function(v26, v27, _)
        v21(v26, v27, v0.NodeType.Describe, v0.NodeModifier.None);
    end;
    v13.itFOCUS = function(v29, v30)
        v21(v29, v30, v0.NodeType.It, v0.NodeModifier.Focus);
    end;
    v13.itSKIP = function(v31, v32)
        v21(v31, v32, v0.NodeType.It, v0.NodeModifier.Skip);
    end;
    v13.itFIXME = function(v33, v34)
        warn("FIXME: broken test", v21(v33, v34, v0.NodeType.It, v0.NodeModifier.Skip):getFullName());
    end;
    v13.it = function(v35, v36, _)
        v21(v35, v36, v0.NodeType.It, v0.NodeModifier.None);
    end;
    local v38 = 0;
    for v39, v40 in pairs({
        [v0.NodeType.BeforeAll] = "beforeAll", 
        [v0.NodeType.AfterAll] = "afterAll", 
        [v0.NodeType.BeforeEach] = "beforeEach", 
        [v0.NodeType.AfterEach] = "afterEach"
    }) do
        v13[v40] = function(v41)
            v21(v40 .. "_" .. tostring(v38), v41, v39, v0.NodeModifier.None);
            v38 = v38 + 1;
        end;
    end;
    v13.FIXME = function(v42)
        warn("FIXME: broken test", v10:getFullName(), v42 or "");
        v10.modifier = v0.NodeModifier.Skip;
    end;
    v13.FOCUS = function()
        v10.modifier = v0.NodeModifier.Focus;
    end;
    v13.SKIP = function()
        v10.modifier = v0.NodeModifier.Skip;
    end;
    v13.HACK_NO_XPCALL = function()
        warn("HACK_NO_XPCALL is deprecated. It is now safe to yield in an " .. "xpcall, so this is no longer necessary. It can be safely deleted.");
    end;
    v13.fit = v13.itFOCUS;
    v13.xit = v13.itSKIP;
    v13.fdescribe = v13.describeFOCUS;
    v13.xdescribe = v13.describeSKIP;
    v13.expect = setmetatable({
        extend = function(...)
            error("Cannot call \"expect.extend\" from within a \"describe\" node.");
        end
    }, {
        __call = function(_, ...)
            return v1.new(...);
        end
    });
    return v13;
end;
local v45 = {};
v45.__index = v45;
v45.new = function(v46, v47, v48, v49, v50)
    local v51 = {
        plan = v46, 
        phrase = v47, 
        type = v48, 
        modifier = v49 or v0.NodeModifier.None, 
        children = {}, 
        callback = nil, 
        parent = nil
    };
    v51.environment = v44(v51, v46.extraEnvironment, v50);
    return (setmetatable(v51, v45));
end;
local function v55(v52, v53, v54)
    if v53 and (not (v54 ~= nil) or v54 == v0.NodeModifier.None) then
        if not v52:match(v53) then
            return v0.NodeModifier.Skip;
        else
            return v0.NodeModifier.Focus;
        end;
    else
        return v54;
    end;
end;
local function v59(v56, v57, v58)
    if not (v57 and (not (v58 ~= nil) or v58 == v0.NodeModifier.None)) or not v56:match(v57) then
        return v58;
    else
        return v0.NodeModifier.Skip;
    end;
end;
v45.addChild = function(v60, v61, v62, v63, v64)
    if v62 == v0.NodeType.It then
        for _, v66 in pairs(v60.children) do
            if v66.phrase == v61 then
                error("Duplicate it block found: " .. v66:getFullName());
            end;
        end;
    end;
    local v67 = v60:getFullName() .. " " .. v61;
    local v68 = {};
    if v60.plan.testNamePattern then
        v68.nameNodeModifier = v55(v67, v60.plan.testNamePattern, v63);
    end;
    if not (not v60.plan.testPathPattern or not v64) then
        v68.pathNodeModifier = v55(v64, v60.plan.testPathPattern, v63);
    end;
    if not (not v60.plan.testPathIgnorePatterns or not v64) then
        v68.pathIgnoreNodeModifier = v59(v64, v60.plan.testPathIgnorePatterns, v63);
    end;
    for _, v70 in pairs(v68) do
        if v70 ~= v0.NodeModifier.Focus then
            v63 = v70;
            break;
        else
            v63 = v70;
        end;
    end;
    if not ((not (v60.plan.runTestsByPath and #v60.plan.runTestsByPath > 0) or not v64) or table.find(v60.plan.runTestsByPath, v64)) then
        v63 = v0.NodeModifier.Skip;
    end;
    local v71 = v45.new(v60.plan, v61, v62, v63, v64);
    v71.parent = v60;
    table.insert(v60.children, v71);
    return v71;
end;
v45.getFullName = function(v72)
    if v72.parent then
        local v73 = v72.parent:getFullName();
        if v73 then
            return v73 .. " " .. v72.phrase;
        end;
    end;
    return v72.phrase;
end;
v45.expand = function(v74)
    local v75 = getfenv(v74.callback);
    local v76 = setmetatable({}, {
        __index = v75
    });
    for v77, v78 in pairs(v74.environment) do
        v76[v77] = v78;
    end;
    v76.script = v75.script;
    setfenv(v74.callback, v76);
    local v80, v81 = xpcall(v74.callback, function(v79)
        return debug.traceback(tostring(v79), 2);
    end);
    if not v80 then
        v74.loadError = v81;
    end;
end;
local v82 = {};
v82.__index = v82;
v82.new = function(v83)
    local v84 = {
        children = {}
    };
    if v83 then
        for v85, v86 in pairs(v83) do
            v84[v85] = v86;
        end;
    end;
    return (setmetatable(v84, v82));
end;
v82.addChild = function(v87, v88, v89, v90)
    local v91 = v45.new(v87, v88, v89, (v55(v88, v87.testNamePattern, v90)));
    table.insert(v87.children, v91);
    return v91;
end;
v82.addRoot = function(v92, v93, v94, v95)
    local l_v92_0 = v92;
    for v97 = #v93, 1, -1 do
        local v98 = nil;
        for _, v100 in ipairs(l_v92_0.children) do
            if v100.phrase == v93[v97] then
                v98 = v100;
                break;
            end;
        end;
        if v98 == nil then
            v98 = l_v92_0:addChild(v93[v97], v0.NodeType.Describe, nil, (v9(v95)));
        end;
        l_v92_0 = v98;
    end;
    l_v92_0.isRoot = true;
    l_v92_0.instance = v95;
    l_v92_0.callback = v94;
    l_v92_0:expand();
end;
v82.visitAllNodes = function(v101, v102, v103, v104)
    v103 = v103 or v101;
    v104 = v104 or 0;
    for _, v106 in ipairs(v103.children) do
        v102(v106, v104);
        v101:visitAllNodes(v102, v106, v104 + 1);
    end;
end;
v82.visualize = function(v107)
    local v108 = {};
    v107:visitAllNodes(function(v109, v110)
        table.insert(v108, (" "):rep(3 * v110) .. v109.phrase);
    end);
    return table.concat(v108, "\n");
end;
v82.findNodes = function(v111, v112)
    local v113 = {};
    v111:visitAllNodes(function(v114)
        if v112(v114) then
            table.insert(v113, v114);
        end;
    end);
    return v113;
end;
return v82;
