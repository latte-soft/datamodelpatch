local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.OpenPublishAvatarPrompt);
local v2 = require(l_Parent_0.PromptType);
return function(v3, v4, v5)
    return function(v6)
        v6:dispatch(v1(v2.PublishAvatar, v3, v4, v5));
    end;
end;
