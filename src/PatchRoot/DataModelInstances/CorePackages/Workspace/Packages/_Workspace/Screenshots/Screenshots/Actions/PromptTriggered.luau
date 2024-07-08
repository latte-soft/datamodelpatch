local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Rodux);
local _ = require(l_Parent_0.Enums.PromptType);
local _ = require(l_Parent_0.Types);
return v1.makeActionCreator(script.Name, function(v4, v5, v6)
    return {
        promptData = v6, 
        promptId = v4, 
        promptType = v5
    };
end);
