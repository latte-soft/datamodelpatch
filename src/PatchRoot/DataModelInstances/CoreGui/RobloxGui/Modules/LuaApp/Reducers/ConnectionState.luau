local l_SetConnectionState_0 = require(game:GetService("CorePackages").Workspace.Packages.AppChat).Actions.SetConnectionState;
return function(v1, v2)
    v1 = v1 or Enum.ConnectionState.Connected;
    if v2.type == l_SetConnectionState_0.name then
        v1 = v2.connectionState;
    end;
    return v1;
end;
