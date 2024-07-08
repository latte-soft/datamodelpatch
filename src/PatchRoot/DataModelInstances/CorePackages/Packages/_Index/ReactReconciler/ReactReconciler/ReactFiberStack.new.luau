local l_console_0 = require(script.Parent.Parent.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v2 = {};
local v3 = {};
local v4 = nil;
if _G.__DEV__ then
    v4 = {};
end;
local v5 = 0;
return {
    createCursor = function(v6)
        return {
            current = v6
        };
    end, 
    isEmpty = function()
        return v5 == 0;
    end, 
    pop = function(v7, v8)
        if v5 < 1 then
            if _G.__DEV__ then
                l_console_0.error("Unexpected pop.");
            end;
            return ;
        else
            if _G.__DEV__ and v8 ~= v4[v5] then
                l_console_0.error("Unexpected Fiber popped.");
            end;
            local v9 = v3[v5];
            if v9 == v2 then
                v7.current = nil;
            else
                v7.current = v9;
            end;
            v3[v5] = nil;
            if _G.__DEV__ then
                v4[v5] = nil;
            end;
            v5 = v5 - 1;
            return ;
        end;
    end, 
    push = function(v10, v11, v12)
        v5 = v5 + 1;
        local l_current_0 = v10.current;
        if l_current_0 == nil then
            v3[v5] = v2;
        else
            v3[v5] = l_current_0;
        end;
        if _G.__DEV__ then
            v4[v5] = v12;
        end;
        v10.current = v11;
    end, 
    checkThatStackIsEmpty = function()
        if _G.__DEV__ and v5 ~= 0 then
            l_console_0.error("Expected an empty stack. Something was not reset properly.");
        end;
    end, 
    resetStackAfterFatalErrorInDev = function()
        if _G.__DEV__ then
            v5 = 0;
            table.clear(v3);
            table.clear(v4);
        end;
    end
};
