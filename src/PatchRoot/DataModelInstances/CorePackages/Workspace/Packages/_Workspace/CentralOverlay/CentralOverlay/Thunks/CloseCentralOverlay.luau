local v0 = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay);
return function()
    return function(v1)
        if not v1:getState().CentralOverlay.Configs.DisableBackButtonClose then
            v1:dispatch(v0());
            return ;
        else
            return ;
        end;
    end;
end;
