local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v5 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v7 = require(l_Modules_0.LuaApp.Flags.UseGameDetailsPeekView);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsExpanded);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetAXFixGameDetailsViewTitle);
local function v14(v11, v12, v13)
    v11:dispatch(v5(l_PeekViewState_0.Closed));
    if v10() then
        v11:dispatch(v9(true));
    end;
    v8.closeFiltersAndItemDetails(v12);
    v8.closeAllDialogs(v12);
    v12.navigate(v13.name, v13);
end;
return function(v15, v16, v17)
    return function(v18)
        local v19 = {
            name = v2.GameDetail, 
            detail = tostring(v15), 
            extraProps = v17
        };
        local v20 = v18:getState();
        local l_FormFactor_1 = v20.FormFactor;
        local l_viewState_0 = v20.GameDetailsPeekView.viewState;
        if not (l_FormFactor_1 == l_FormFactor_0.COMPACT) or not v7() then
            v18:dispatch(v6(v15, v17));
            return ;
        elseif (l_viewState_0 ~= l_PeekViewState_0.Full and l_viewState_0 ~= l_PeekViewState_0.Extended) and (not v17 or not v17.mountAsFullView) then
            v14(v18, v16, v19);
            return ;
        else
            v18:dispatch(v6(v15, v17));
            return ;
        end;
    end;
end;
