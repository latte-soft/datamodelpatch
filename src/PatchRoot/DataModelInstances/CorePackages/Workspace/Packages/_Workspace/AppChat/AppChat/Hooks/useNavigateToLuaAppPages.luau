local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useMemo_0 = v2.useMemo;
return function()
    return l_useMemo_0(function()
        return {
            [v4.GameDetail] = function()
            end, 
            [v4.Notifications] = function()
            end, 
            [v4.PrivacySettings] = function()
            end, 
            [v4.ReportAbuse] = function()
            end, 
            [v4.ViewUserProfile] = function()
            end, 
            [v4.SquadLobby] = function()
            end, 
            [v4.Groups] = function()
            end
        };
    end, l_dependencyArray_0((l_useDispatch_0())));
end;
