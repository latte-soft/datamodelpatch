local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Classes.BindableEventBridge);
local v2 = require(l_Parent_0.Classes.DebugInterface);
local l_CoreGui_0 = game:GetService("CoreGui");
return (v2:extend("CoreGuiDebugInterface", function(v4, v5)
    local v6 = v2.new("CoreGui", v4, {
        (v1.new(l_CoreGui_0))
    });
    if not v5 then
        v6:setGuiOptions({
            rootInstance = l_CoreGui_0, 
            pickerParent = l_CoreGui_0, 
            rootPath = {}
        });
        return v6;
    else
        spawn(function()
            v6:setGuiOptions({
                rootInstance = l_CoreGui_0:WaitForChild(v5.rootInstance, 10), 
                pickerParent = not not v5.pickerParent and l_CoreGui_0:WaitForChild(v5.pickerParent, 10) or nil, 
                rootPath = v5.rootPath or {
                    v5.rootInstance
                }
            });
        end);
        return v6;
    end;
end));
