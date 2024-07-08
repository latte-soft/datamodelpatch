local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v1 = require(l_script_FirstAncestor_0.VirtualInput);
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v3 = require(l_script_FirstAncestor_0.XPath);
local v4 = require(l_script_FirstAncestor_0.validateInputReceived);
local function v6(v5)
    return string.format("%s (%s)", v5:GetFullName(), v5.ClassName);
end;
local function v9(v7)
    local l_AbsolutePosition_0 = v7.AbsolutePosition;
    return string.format("(%s) (%s)", tostring(l_AbsolutePosition_0), (tostring(v7.AbsoluteSize + l_AbsolutePosition_0)));
end;
local function v11(v10)
    return string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v10:GetFullName(), v10.ClassName), v9(v10));
end;
local function v15(v12, v13)
    local v14 = {};
    if v12.Y < v13.AbsolutePosition.Y then
        table.insert(v14, "top");
    end;
    if v13.AbsolutePosition.Y + v13.AbsoluteSize.Y < v12.Y then
        table.insert(v14, "bottom");
    end;
    if v12.X < v13.AbsolutePosition.X then
        table.insert(v14, "left");
    end;
    if v13.AbsolutePosition.X + v13.AbsoluteSize.X < v12.X then
        table.insert(v14, "right");
    end;
    if #v14 > 0 then
        return true, table.concat(v14, "-");
    else
        return false;
    end;
end;
local function v22(v16, v17)
    local l_Parent_0 = v16.Parent;
    while true do
        if l_Parent_0 ~= nil then
            if l_Parent_0:IsA("GuiBase2d") then
                local v19 = not l_Parent_0:IsA("GuiObject") and true or l_Parent_0.ClipsDescendants;
                local v20, v21 = v15(v17, l_Parent_0);
                if not (not v19 or not v20) then
                    return true, l_Parent_0, v21;
                end;
            end;
            l_Parent_0 = l_Parent_0.Parent;
        else
            return false;
        end;
    end;
end;
local function v30(v23, v24)
    local v25 = {};
    if not v23.Active then
        if not (v23:IsA("GuiButton") or v23:IsA("TextBox")) then
            local v26 = {};
            local l_v23_FullName_0 = v23:GetFullName();
            for _, v29 in v23:GetDescendants() do
                if not (not v29:IsA("GuiButton") and not v29:IsA("TextBox")) then
                    table.insert(v26, string.format("%s%s", v23.Name, (string.sub(string.format("%s (%s)", v29:GetFullName(), v29.ClassName), #l_v23_FullName_0 + 1))));
                end;
            end;
            table.insert(v25, string.format("target is not a GuiButton or TextBox, so it will not sink inputs unless `Active` is true.\n" .. "\tThe target instance has the following descendants that may be better click targets:%s\n\n" .. "\tIf you are intentionally simulating clicks on a GUI element that is not typically interactive\n" .. "\t(like a Frame or an ImageLabel), consider using `element:clickWithoutValidation` instead.", if #v26 > 0 then "\n\t\t* " .. table.concat(v26, "\n\t\t* ") else " <none>"));
        end;
        if not v24 then
            table.insert(v25, "target is not Active");
        end;
    end;
    if not v23.Visible then
        table.insert(v25, "target is not Visible");
    end;
    if v23.AbsoluteSize.X <= 0 then
        table.insert(v25, string.format("target has 0 width; element bounds: %s", v9(v23)));
    end;
    if v23.AbsoluteSize.Y <= 0 then
        table.insert(v25, string.format("target has 0 height; element bounds: %s", v9(v23)));
    end;
    if not v23:FindFirstAncestorWhichIsA("LayerCollector") then
        table.insert(v25, "target is not a descendant of a LayerCollector, like a ScreenGui or a SurfaceGui");
    end;
    return #v25 == 0, v25;
end;
local function v31(v32)
    if v32 and v32 ~= game then
        local v33 = v31(v32.Parent);
        if v32:IsA("ScrollingFrame") then
            v33 = v33 + 1;
        end;
        return v33;
    else
        return 0;
    end;
end;
local v34 = {};
v34.__index = v34;
v34.new = function(v35)
    local v36 = nil;
    local v37 = nil;
    if type(v35) == "string" then
        v36 = v3.new(v35);
    elseif type(v35) == "table" and v35.__type == "XPath" then
        v36 = v35;
    elseif type(v35) == "userdata" then
        v36 = v3.new(v35);
        v37 = v35;
    else
        error(string.format("invalid parameter for element: %s", (typeof(v35))));
    end;
    local v38 = {
        path = v36, 
        rbxInstance = v37
    };
    local l_v37_0 = v37;
    local v40;
    if l_v37_0 and l_v37_0 ~= game then
        local v41 = v31(l_v37_0.Parent);
        if l_v37_0:IsA("ScrollingFrame") then
            v41 = v41 + 1;
        end;
        v40 = v41;
    else
        v40 = 0;
    end;
    v38.isInScrollingFrame = v40 ~= 0;
    v38.anchor = nil;
    return (setmetatable(v38, v34));
end;
v34.assertInteractable = function(v42)
    local v43 = v42:getRbxInstance();
    if v43 == nil then
        error(string.format("%s: element with XPath %s does not describe any existing Instance", "[Rhodium] input validation", v42.path:toString()));
    end;
    if not v43:IsA("GuiObject") then
        error(string.format("%s: %s is not a GuiObject", "[Rhodium] input validation", v6(v43)));
    end;
    if not v43:FindFirstAncestorOfClass("DataModel") then
        error(string.format("%s: %s is not mounted into the DataModel", "[Rhodium] input validation", v6(v43)));
    end;
end;
v34.assertClickable = function(v44, v45)
    local v46 = v44:_getGuiObject();
    local v47, v48 = v30(v46, v45);
    if not v47 then
        error(string.format("%s: %s was not clickable for the following reason(s):\n* %s", "[Rhodium] input validation", string.format("%s (%s)", v46:GetFullName(), v46.ClassName), table.concat(v48, "\n* ")));
    end;
end;
v34.assertVisibleWithinAncestors = function(v49)
    local v50 = v49:_getGuiObject();
    local v51 = v49:getAnchor();
    local v52, v53, v54 = v22(v50, v51);
    if v52 then
        error(string.format("%s: %s is outside bounds of ancestor %s (%s)\n\nclick at: (%s)\ntarget:   %s\nancestor: %s", "[Rhodium] input validation", v50.Name, v53.Name, v54, tostring(v51), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v50:GetFullName(), v50.ClassName), v9(v50)), v11(v53)));
    end;
end;
v34.assertFirstClickTarget = function(v55)
    local v56 = v55:_getGuiObject();
    local v57 = v55:getAnchor();
    local l_v56_FirstAncestorWhichIsA_0 = v56:FindFirstAncestorWhichIsA("BasePlayerGui");
    if not l_v56_FirstAncestorWhichIsA_0 then
        error(string.format("%s: %s is not a descendant of a BasePlayerGui (like CoreGui or LocalPlayer.PlayerGui)", "[Rhodium] input validation", v11(v56)));
    end;
    v1.Mouse.SendMouseMoveEvent(v57.X, v57.Y);
    v2.waitForInputEventsProcessed();
    for _, v60 in (l_v56_FirstAncestorWhichIsA_0:GetGuiObjectsAtPosition(v57.X, v57.Y)), nil, nil do
        if v60 ~= v56 then
            if not (not v30(v60, true) or v22(v60, v57)) then
                error(string.format("%s: element is obscured by another clickable GuiObject at the target click location\n\n click at: (%s)\n   target: %s\nobscuring: %s", "[Rhodium] input validation", tostring(v57), string.format("%s\n\telement bounds: %s", string.format("%s (%s)", v56:GetFullName(), v56.ClassName), v9(v56)), v11(v60)));
            end;
        else
            break;
        end;
    end;
end;
v34.getAttribute = function(v61, v62)
    return v61:getRbxInstance()[v62];
end;
v34.getLocation = function(v63)
    return v63:_getGuiBase2d().AbsolutePosition;
end;
v34.getRect = function(v64)
    local v65 = v64:getSize();
    local v66 = v64:getLocation();
    local v67 = v65 + v66;
    return Rect.new(v66.X, v66.Y, v67.X, v67.Y);
end;
v34.getSize = function(v68)
    return v68:_getGuiBase2d().AbsoluteSize;
end;
v34.getCenter = function(v69)
    return v69:getLocation() + v69:getSize() / 2;
end;
v34.getText = function(v70)
    local v71 = v70:getRbxInstanceOrThrow();
    if not (v71:IsA("TextLabel") or v71:IsA("TextButton")) and not v71:IsA("TextBox") then
        error(("expected element to have text, but got `%s`"):format(v71.ClassName));
        return ;
    else
        return v71.Text;
    end;
end;
v34.getAnchor = function(v72)
    if v72.anchor ~= nil then
        return v72:getLocation() + v72.anchor;
    else
        return v72:getCenter();
    end;
end;
v34.setAnchor = function(v73, v74, v75)
    local v76 = v73:getSize();
    if not ((v76.X >= v74 and v76.Y >= v75) and v74 >= 0) or v75 < 0 then
        error("Attempt to set anchor beyond element's bounds");
        return ;
    else
        v73.anchor = Vector2.new(v74, v75);
        return ;
    end;
end;
v34.unsetAnchor = function(v77)
    v77.anchor = nil;
end;
v34.isDisplayed = function(v78)
    return v78:_getGuiObject().Visible;
end;
v34.isSelected = function(v79)
    return v79:_getGuiButton().Selected;
end;
v34.getRbxInstance = function(v80)
    return v80:waitForRbxInstance(v80.path.waitDelay, v80.path.waitTimeOut);
end;
v34.getRbxInstanceOrThrow = function(v81)
    local v82 = v81:getRbxInstance();
    if v82 == nil then
        error(string.format("Failed to get instance for element with path %s", v81.path:toString()));
    end;
    return v82;
end;
v34._getGuiObject = function(v83)
    return (v83:_getInstanceOfClass("GuiObject"));
end;
v34._getGuiButton = function(v84)
    return (v84:_getInstanceOfClass("GuiButton"));
end;
v34._getGuiBase2d = function(v85)
    return (v85:_getInstanceOfClass("GuiBase2d"));
end;
v34._getInstanceOfClass = function(v86, v87)
    local v88 = v86:getRbxInstanceOrThrow();
    if not v88:IsA(v87) then
        error(("expected element to be a %s, but got `%s`"):format(v87, v88.ClassName));
        return ;
    else
        return v88;
    end;
end;
v34.waitForRbxInstance = function(v89, v90, v91)
    local l_rbxInstance_0 = v89.rbxInstance;
    if l_rbxInstance_0 == nil and v89.path ~= nil then
        v89.path:setWait(v90, v91);
        l_rbxInstance_0 = v89.path:waitForFirstInstance();
        v89.rbxInstance = l_rbxInstance_0;
    end;
    return l_rbxInstance_0;
end;
v34.centralizeInstance = function(v93)
    v93:_centralizeInScrollingFrame((v93:_getInstanceOfClass("GuiObject")));
end;
v34.centralize = function(v94)
    if not v94:getRbxInstance() then
        v94:centralizeWithInfiniteScrolling();
        return ;
    else
        v94:centralizeInstance();
        return ;
    end;
end;
v34._centralizeInScrollingFrame = function(v95, v96, v97)
    if v96 == game then
        return ;
    else
        local v98 = v97 or v96.Parent;
        if v98 == game then
            return ;
        else
            if not v98:IsA("ScrollingFrame") then
                v95:_centralizeInScrollingFrame(v96, v98.Parent);
            else
                v95:_centralizeInScrollingFrame(v98, v98.Parent);
                local v99 = false;
                while not v99 do
                    local l_AbsolutePosition_1 = v96.AbsolutePosition;
                    local l_CanvasPosition_0 = v98.CanvasPosition;
                    v98.CanvasPosition = v98.CanvasPosition + Vector2.new(math.min(300, v98.AbsoluteSize.X), (math.min(300, v98.AbsoluteSize.Y)));
                    task.wait();
                    v99 = (v98.CanvasPosition - l_CanvasPosition_0).Magnitude <= 2 or (v96.AbsolutePosition - l_AbsolutePosition_1).Magnitude > 2;
                end;
                for _ = 1, 2 do
                    local v103 = (v96.AbsolutePosition + v96.AbsoluteSize / 2) - (v98.AbsolutePosition + v98.AbsoluteSize / 2);
                    if v103.Magnitude > 2 then
                        v98.CanvasPosition = v98.CanvasPosition + v103;
                        task.wait();
                    else
                        goto label0;
                    end;
                end;
                return ;
            end;
            ::label0::;
            return ;
        end;
    end;
end;
v34._scrollToFindInstance = function(_, v105, v106)
    v105.CanvasPosition = Vector2.new(0, 0);
    local l_X_0 = v105.AbsoluteSize.X;
    local l_Y_0 = v105.AbsoluteSize.Y;
    local v109 = false;
    local v110 = nil;
    while true do
        if v109 then
            return nil;
        else
            task.wait(0.1);
            v110 = v106:getFirstInstance();
            if not v110 then
                local l_CanvasPosition_1 = v105.CanvasPosition;
                v105.CanvasPosition = v105.CanvasPosition + Vector2.new(math.min(l_X_0, 300), (math.min(l_Y_0, 300)));
                if (v105.CanvasPosition - l_CanvasPosition_1).Magnitude >= 2 then
                    v109 = false;
                else
                    v109 = true;
                end;
            else
                return v110;
            end;
        end;
    end;
end;
v34.centralizeWithInfiniteScrolling = function(v112)
    local v113, v114 = v112.path:getInstances();
    if #v113 > 0 then
        v112:centralizeInstance();
    end;
    local v115 = v112.path:copy();
    while v114 < v115:size() do
        v115 = v115:parent();
    end;
    local v116 = v115:getFirstInstance();
    local v117 = nil;
    while true do
        assert(v116 ~= nil, "Rhodium encountered an internal error");
        if not v116:IsA("ScrollingFrame") then
            v116 = v116.Parent;
            if not (v116 ~= game) then
                break;
            end;
        else
            v117 = v116;
            break;
        end;
    end;
    if v117 == nil then
        return ;
    elseif v112:_scrollToFindInstance(v117, v112.path) == nil then
        return ;
    else
        v112:_centralizeInScrollingFrame((v112:_getInstanceOfClass("GuiObject")));
        return ;
    end;
end;
v34.setPluginWindow = function(v118)
    v1.setCurrentWindow((v118:getRbxInstanceOrThrow():FindFirstAncestorWhichIsA("PluginGui")));
end;
v34._validateInput = function(v119, v120)
    v119:assertInteractable();
    local v121 = v119:_getGuiObject();
    v2.waitForInputEventsProcessed();
    if not v4(v121, v120) then
        v119:assertClickable();
        v119:assertVisibleWithinAncestors();
        v119:assertFirstClickTarget();
        error(string.format("%s: failed to click %s - reason unknown\n%s", "[Rhodium] input validation", v121.Name, v11(v121)));
    end;
end;
v34.clickWithoutValidation = function(v122, v123)
    v122:centralize();
    v122:setPluginWindow();
    v1.Mouse.multiClick(v122:getAnchor(), v123 or 1);
end;
v34.click = function(v124, v125)
    v124:_validateInput(function()
        v124:clickWithoutValidation(v125);
    end);
end;
v34.rightClick = function(v126)
    v126:centralize();
    v126:setPluginWindow();
    v1.Mouse.rightClick(v126:getAnchor());
end;
v34.mouseWheel = function(v127, v128)
    v127:centralize();
    v1.Mouse.mouseWheel(v127:getAnchor(), v128);
end;
v34.mouseDrag = function(v129, v130, v131, v132)
    v129:centralize();
    v1.Mouse.mouseDrag(v129:getAnchor(), v129:getAnchor() + Vector2.new(v130, v131), v132);
end;
v34.mouseDragTo = function(v133, v134, v135)
    v133:centralize();
    v1.Mouse.mouseDrag(v133:getAnchor(), v134, v135);
end;
v34.sendKey = function(v136, v137)
    v136:setPluginWindow();
    v1.Keyboard.hitKey(v137);
end;
v34.sendText = function(v138, v139)
    v138:clickWithoutValidation();
    task.wait(0);
    v1.Text.sendText(v139);
end;
v34.tapWithoutValidation = function(v140)
    v140:centralize();
    v1.Touch.tap(v140:getAnchor());
end;
v34.tap = function(v141)
    v141:_validateInput(function()
        v141:tapWithoutValidation();
    end);
end;
v34.touchScroll = function(v142, v143, v144, v145, v146)
    v142:centralize();
    v1.Touch.touchScroll(v142:getAnchor(), v143, v144, v145, true, v146);
end;
return v34;
