local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_CorePackages_0.Workspace.Packages.GameDetail);
local l_SetGameDetailsPeekViewState_0 = v6.PeekView.SetGameDetailsPeekViewState;
local l_UseGameDetailsPeekView_0 = v6.PeekView.UseGameDetailsPeekView;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v11 = require(l_Modules_0.LuaApp.Util.startNewPeekViewHistory);
local function _(v12, v13)
    local v14 = v11(v12, v13);
    local l_newRoute_0 = v14.newRoute;
    local l_newHistory_0 = v14.newHistory;
    v12:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
    v12:dispatch(v10(l_newRoute_0, l_newHistory_0));
end;
local function v20(v18, v19)
    v18:dispatch(l_NavigateDown_0((v1.Dictionary.join(v19, {
        extraProps = v1.Dictionary.join(v19.extraProps or {}, {
            mountAsFullView = true
        })
    }))));
end;
local function _(v21, v22)
    v21:dispatch(l_NavigateDown_0((v1.Dictionary.join(v22, {
        name = l_AppPage_0.ExperienceDetail
    }))));
end;
return function(v24, v25)
    return function(v26)
        local v27 = {
            name = l_AppPage_0.GameDetail, 
            detail = tostring(v24), 
            extraProps = v25
        };
        local v28 = v26:getState();
        local l_FormFactor_1 = v28.FormFactor;
        local l_viewState_0 = v28.GameDetailsPeekView.viewState;
        if not (l_FormFactor_1 == l_FormFactor_0.COMPACT) or not l_UseGameDetailsPeekView_0() then
            v26:dispatch(l_NavigateDown_0((v1.Dictionary.join(v27, {
                name = l_AppPage_0.ExperienceDetail
            }))));
            return ;
        elseif (l_viewState_0 ~= l_PeekViewState_0.Full and l_viewState_0 ~= l_PeekViewState_0.Extended) and (not v25 or not v25.mountAsFullView) then
            local v31 = v11(v26, v27);
            local l_newRoute_1 = v31.newRoute;
            local l_newHistory_1 = v31.newHistory;
            v26:dispatch(l_SetGameDetailsPeekViewState_0(l_PeekViewState_0.Closed));
            v26:dispatch(v10(l_newRoute_1, l_newHistory_1));
            return ;
        else
            v20(v26, v27);
            return ;
        end;
    end;
end;
