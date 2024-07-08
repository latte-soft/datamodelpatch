local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Rodux);
local v2 = require(l_CorePackages_0.Cryo);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.SetMenuOpen);
local v6 = require(l_Actions_0.SetTopBarEnabled);
local v7 = require(l_Actions_0.SetSmallTouchDevice);
local v8 = require(l_Actions_0.SetScreenSize);
local v9 = require(l_Actions_0.SetKeepOutArea);
local v10 = require(l_Actions_0.RemoveKeepOutArea);
local v11 = require(l_Actions_0.SetInputType);
local v12 = require(l_Actions_0.SetInspectMenuOpen);
local v13 = require(l_Actions_0.SetGamepadMenuOpen);
local l_InputType_0 = require(l_Parent_0.Constants).InputType;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
return (v1.createReducer({
    menuOpen = false, 
    inspectMenuOpen = false, 
    topbarEnabled = true, 
    isSmallTouchDevice = false, 
    screenSize = Vector2.new(0, 0), 
    inputType = l_InputType_0.MouseAndKeyBoard, 
    isGamepadMenuOpen = false, 
    keepOutAreas = {}
}, {
    [v5.name] = function(v16, v17)
        local l_isGamepadMenuOpen_0 = v16.isGamepadMenuOpen;
        if not (v16.menuOpen or not v17.menuOpen) then
            l_isGamepadMenuOpen_0 = false;
        end;
        return v2.Dictionary.join(v16, {
            menuOpen = v17.menuOpen, 
            isGamepadMenuOpen = l_isGamepadMenuOpen_0
        });
    end, 
    [v6.name] = function(v19, v20)
        return v2.Dictionary.join(v19, {
            topbarEnabled = v20.enabled
        });
    end, 
    [v7.name] = function(v21, v22)
        return v2.Dictionary.join(v21, {
            isSmallTouchDevice = v22.isSmallTouchDevice
        });
    end, 
    [v8.name] = function(v23, v24)
        return v2.Dictionary.join(v23, {
            screenSize = v24.screenSize
        });
    end, 
    [v11.name] = function(v25, v26)
        return v2.Dictionary.join(v25, {
            inputType = v26.inputType
        });
    end, 
    [v12.name] = function(v27, v28)
        return v2.Dictionary.join(v27, {
            inspectMenuOpen = v28.inspectMenuOpen
        });
    end, 
    [v13.name] = function(v29, v30)
        return v2.Dictionary.join(v29, {
            isGamepadMenuOpen = v30.open
        });
    end, 
    [v9.name] = function(v31, v32)
        local v33 = table.clone(v31.keepOutAreas);
        v33[v32.id] = {
            size = v32.size, 
            position = v32.position
        };
        return v2.Dictionary.join(v31, {
            keepOutAreas = v33
        });
    end, 
    [v10.name] = function(v34, v35)
        local v36 = table.clone(v34.keepOutAreas);
        v36[v35.id] = nil;
        return v2.Dictionary.join(v34, {
            keepOutAreas = v36
        });
    end
}));
