local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
return {
    NavigateBack = require(l_script_FirstAncestor_0.Thunks.NavigateBack), 
    NavigateDown = require(l_script_FirstAncestor_0.Thunks.NavigateDown), 
    NavigateSideways = require(l_script_FirstAncestor_0.Thunks.NavigateSideways), 
    NavigateToRoute = require(l_script_FirstAncestor_0.Thunks.NavigateToRoute), 
    NavigateFromWebView = require(l_script_FirstAncestor_0.Thunks.NavigateFromWebView), 
    RNAdapterThunk = require(l_script_FirstAncestor_0.Thunks.RNAdapterThunk), 
    SetNavigationLocked = require(l_script_FirstAncestor_0.Thunks.SetNavigationLocked), 
    NavigateDownToGroups = require(l_script_FirstAncestor_0.Thunks.NavigateDownToGroups), 
    NavigateDownToNotifications = require(l_script_FirstAncestor_0.Thunks.NavigateDownToNotifications), 
    NavigateDownToPrivacySettings = require(l_script_FirstAncestor_0.Thunks.NavigateDownToPrivacySettings), 
    NavigateDownToReportAbuse = require(l_script_FirstAncestor_0.Thunks.NavigateDownToReportAbuse), 
    NavigateDownToSquadLobby = require(l_script_FirstAncestor_0.Thunks.NavigateDownToSquadLobby), 
    NavigateDownToViewUserProfile = require(l_script_FirstAncestor_0.Thunks.NavigateDownToViewUserProfile)
};
