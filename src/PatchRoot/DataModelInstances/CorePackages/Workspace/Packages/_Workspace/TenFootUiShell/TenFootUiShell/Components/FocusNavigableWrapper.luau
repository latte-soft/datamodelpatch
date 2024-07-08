local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.UIBlox);
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local v6 = game:DefineFastFlag("AllowSurfaceSelectionJumping", false);
local function v8(v7)
    return v1.createElement("Frame", {
        Name = "FocusBumper", 
        Position = v7.position, 
        Size = v7.size, 
        Selectable = not v6 and true or game:GetEngineFeature("UISelectionSurfaceJumping") == false, 
        BackgroundTransparency = 1, 
        ref = v2.useEventHandler("focus", v7.onFocus, "Target"), 
        SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.Invisible)
    });
end;
return (v1.forwardRef(function(v9, v10)
    return v1.createElement("Frame", {
        Name = "FocusNavigableWrapper", 
        Position = v9.position or UDim2.new(0, 0, 0, 0), 
        Size = v9.size or UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v1.createElement("Frame", {
        Name = "FocusNavigableWrapperInner", 
        Position = v9.position or UDim2.new(0, 0, 0, 0), 
        Size = v9.size or UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        ref = v10
    }, v9.children), v9.onSelectStart and v1.createElement(v8, {
        onFocus = v9.onSelectStart, 
        position = UDim2.new(0, 0, 0, 0), 
        size = UDim2.new(0, 1, 1, 0)
    }), v9.onSelectEnd and v1.createElement(v8, {
        onFocus = v9.onSelectEnd, 
        position = UDim2.new(1, -1, 0, 0), 
        size = UDim2.new(0, 1, 1, 0)
    }), v9.onSelectUp and v1.createElement(v8, {
        onFocus = v9.onSelectUp, 
        position = UDim2.new(0, 0, 0, 0), 
        size = UDim2.new(1, 0, 0, 1)
    }), v9.onSelectDown and v1.createElement(v8, {
        onFocus = v9.onSelectDown, 
        position = UDim2.new(0, 0, 1, -1), 
        size = UDim2.new(1, 0, 0, 1)
    }));
end));
