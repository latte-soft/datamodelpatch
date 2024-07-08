local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetail");
local v1 = require(l_script_FirstAncestor_0.PeekView.SetGameDetailsPeekViewState);
local v2 = require(l_script_FirstAncestor_0.PeekView.UseGameDetailsPeekView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v9, v10, v11)
    return function(v12)
        local v13 = v12:getState();
        local l_FormFactor_1 = v13.FormFactor;
        local l_viewState_0 = v13.GameDetailsPeekView.viewState;
        local v16 = nil;
        if not (l_FormFactor_1 == l_FormFactor_0.COMPACT) or not v2() then
            v16 = {
                name = l_AppPage_0.ExperienceDetail, 
                detail = tostring(v9), 
                extraProps = v11
            };
        else
            v16 = {
                name = l_AppPage_0.GameDetail, 
                detail = tostring(v9), 
                extraProps = v11
            };
            if (l_viewState_0 ~= l_PeekViewState_0.Full and l_viewState_0 ~= l_PeekViewState_0.Extended) and (not v11 or not v11.mountAsFullView) then
                v12:dispatch(v1(l_PeekViewState_0.Closed));
                v10.clearAppScreens({
                    l_AppPage_0.GameDetail, 
                    l_AppPage_0.ProfilePeekView
                });
            else
                v16 = v4.Dictionary.join(v16, {
                    extraProps = v4.Dictionary.join(v16.extraProps or {}, {
                        mountAsFullView = true
                    })
                });
            end;
        end;
        v12:dispatch(l_NavigateDown_0(v16));
    end;
end;
