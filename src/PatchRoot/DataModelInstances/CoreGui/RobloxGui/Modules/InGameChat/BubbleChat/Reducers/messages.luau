local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
return (require(l_CorePackages_0.Packages.Rodux).createReducer({}, {
    [require(script.Parent.Parent.Actions.AddMessage).name] = function(v2, v3)
        return v1.Dictionary.join(v2, {
            [v3.message.id] = v3.message
        });
    end, 
    [require(script.Parent.Parent.Actions.RemoveMessage).name] = function(v4, v5)
        return v1.Dictionary.join(v4, {
            [v5.message.id] = v1.None
        });
    end, 
    [require(script.Parent.Parent.Actions.SetMessageText).name] = function(v6, v7)
        local v8 = v6[v7.messageId];
        if v8 then
            return v1.Dictionary.join(v6, {
                [v7.messageId] = v1.Dictionary.join(v8, {
                    text = v7.newText
                })
            });
        else
            return v6;
        end;
    end
}));
