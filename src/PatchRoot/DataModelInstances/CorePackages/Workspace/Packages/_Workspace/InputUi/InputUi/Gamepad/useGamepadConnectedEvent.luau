local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v4 = require(script.Parent.GetFFlagShowGamepadDisconnectDialog);
local function _()
    return l_useUserExperiment_0({
        "PlatformExcellence.QualityImprovement.Consoles"
    }, function(v5)
        return (v5["PlatformExcellence.QualityImprovement.Consoles"] or {}).showDisconnectDialog;
    end);
end;
return function(v7, v8)
    local v10 = l_useUserExperiment_0({
        "PlatformExcellence.QualityImprovement.Consoles"
    }, function(v9)
        return (v9["PlatformExcellence.QualityImprovement.Consoles"] or {}).showDisconnectDialog;
    end);
    v1.useEffect(function()
        if not v10 and not v4() then
            return function()
            end;
        else
            local v12 = l_MemStorageService_0:BindAndFire("ActiveGamepadConnected", function(v11)
                if v11 == "false" then
                    v8();
                    return ;
                else
                    v7();
                    return ;
                end;
            end);
            return function()
                v12:Disconnect();
            end;
        end;
    end, {
        v7, 
        v8, 
        v10
    });
end;
