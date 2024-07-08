local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.OpenPrompt);
local v2 = require(l_Parent_0.PromptType);
return function(v3, v4)
    return function(v5)
        v5:dispatch(v1(v2.SaveAvatar, {
            humanoidDescription = v3, 
            rigType = v4
        }));
    end;
end;
