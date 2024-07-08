local l_AvatarIdentification_0 = require(game:GetService("CorePackages").Workspace.Packages.TnSAvatarIdentification).AvatarIdentification;
local v1 = require(script.Parent.Parent.Actions.SetSelectedAvatars);
local l_getAvatarsForPoint_0 = l_AvatarIdentification_0.getAvatarsForPoint;
return function(v3)
    return function(v4)
        coroutine.wrap(function()
            local l_identifiedAvatars_0 = v4:getState().report.identifiedAvatars;
            local v6 = {};
            for _, v8 in ipairs(v3) do
                for v9, v10 in pairs((l_getAvatarsForPoint_0(l_identifiedAvatars_0, v8))) do
                    v6[v9] = v10;
                    print("Selected avatar", v9, v10);
                end;
            end;
            v4:dispatch(v1(v6));
        end)();
    end;
end;
