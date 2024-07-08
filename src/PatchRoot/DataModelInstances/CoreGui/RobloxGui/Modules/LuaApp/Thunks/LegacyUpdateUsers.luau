local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
local function v8(v3)
    local v4 = {};
    for v5, v6 in pairs(v3) do
        v6.isFriend = true;
        v6.friendRank = v5;
        local v7 = l_UserModel_0.fromDataTable(v6);
        v4[v7.id] = v7;
    end;
    return v4;
end;
return function(v9, v10)
    return function(v11)
        local v12 = v8(v9);
        if (not v10 or not v10.mockedActions) or not v10.mockedActions.UpdateUsers then
            v11:dispatch(l_UpdateUsers_0(v12));
            return ;
        else
            v10.mockedActions.UpdateUsers(v12);
            return ;
        end;
    end;
end;
