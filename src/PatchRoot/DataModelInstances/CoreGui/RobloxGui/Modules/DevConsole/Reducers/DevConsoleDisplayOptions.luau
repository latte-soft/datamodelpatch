local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility);
local v3 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized);
local v4 = require(script.Parent.Parent.Actions.ChangeDevConsoleSize);
local v5 = require(script.Parent.Parent.Actions.SetDevConsolePosition);
local v6 = require(script.Parent.Parent.Actions.SetActiveTab);
return function(v7, v8)
    local v9 = v7 or {
        formFactor = v1.FormFactor.Large, 
        isVisible = false, 
        isMinimized = false, 
        position = v1.MainWindowInit.Position, 
        size = v1.MainWindowInit.Size, 
        visibleStartTime = 0
    };
    if v8.type == v2.name then
        local v10 = {
            isVisible = v8.isVisible
        };
        if v10.isVisible then
            v10.isMinimized = false;
            v10.visibleStartTime = tick();
        end;
        return v0.JoinDictionaries(v9, v10);
    elseif v8.type == v5.name then
        return (v0.Set(v9, "position", v8.position));
    elseif v8.type == v3.name then
        return (v0.Set(v9, "isMinimized", v8.isMinimized));
    else
        if v8.type == v4.name then
            if v9.formFactor == v1.FormFactor.Large then
                return (v0.Set(v9, "size", v8.newSize));
            end;
        elseif v8.type == v6.name then
            return (v0.Set(v9, "isMinimized", false));
        end;
        return v9;
    end;
end;
