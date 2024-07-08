local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Components.PromptConnections);
local v5 = require(l_Parent_0.Enums.PromptType);
local v6 = require(l_Parent_0.Components.SaveCapturesPrompt);
local v7 = require(l_Parent_0.Components.ShareCapturePrompt);
local _ = require(l_Parent_0.Types);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v10 = {
    [v5.SaveCaptures] = v6, 
    [v5.ShareCapture] = v7
};
return function(_)
    local v13 = l_useSelector_0(function(v12)
        return v12.Screenshots.Prompts[1];
    end);
    local v14 = v13 and v13.PromptData;
    local v15 = v13 and v13.PromptId;
    local v16 = v13 and v13.PromptType;
    local v17 = nil;
    if v16 then
        local v18 = v10[v16];
        if not v18 then
            error((("Unexpected prompt type: %*format(v16)));
        else
            v17 = v2.createElement(v18, {
                promptData = v14, 
                promptId = v15
            });
        end;
    end;
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v4), 
        Prompt = v17
    });
end;
