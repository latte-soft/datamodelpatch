local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
return (require(l_CorePackages_0.Packages.Rodux).createReducer({}, {
    [require(script.Parent.Parent.Actions.AddMessage).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            [v4.message.userId] = v2.List.join(v3[v4.message.userId] or {}, {
                v4.message.id
            })
        });
    end, 
    [require(script.Parent.Parent.Actions.RemoveMessage).name] = function(v5, v6)
        local v7 = v5[v6.message.userId];
        if not v7 then
            return v5;
        elseif #v7 == 1 and v7[1] == v6.message.id then
            return v2.Dictionary.join(v5, {
                [v6.message.userId] = v2.None
            });
        else
            return v2.Dictionary.join(v5, {
                [v6.message.userId] = v2.List.filter(v7, function(v8)
                    return v8 ~= v6.message.id;
                end)
            });
        end;
    end, 
    [require(l_RobloxGui_0.Modules.VoiceChat.Actions.PlayerRemoved).name] = function(v9, v10)
        if not v9[v10.userId] then
            return v9;
        else
            return v2.Dictionary.join(v9, {
                [v10.userId] = v2.None
            });
        end;
    end
}));
