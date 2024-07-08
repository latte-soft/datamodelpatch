local _ = require(script.Parent.Parent.Parent.JestTypes);
local l_STATE_SYM_0 = require(script.Parent.types).STATE_SYM;
return {
    ROOT_DESCRIBE_BLOCK_NAME = "ROOT_DESCRIBE_BLOCK", 
    getState = function()
        return _G[l_STATE_SYM_0];
    end
};
