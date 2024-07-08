local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v3)
    return function(v4)
        v4:dispatch(l_NavigateDown_0({
            name = l_AppPage_0.AgeVerificationRequired, 
            detail = v3
        }));
    end;
end;
