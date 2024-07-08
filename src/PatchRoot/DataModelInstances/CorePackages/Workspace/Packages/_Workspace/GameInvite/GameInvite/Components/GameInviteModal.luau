local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Actions_0 = l_script_FirstAncestor_0.State.Actions;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.Promise);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v13 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v14 = require(l_Context_0.GameInviteModalLayoutProvider);
local v15 = require(l_Components_0.GameInviteModalWindow);
local v16 = require(l_Components_0.GameInviteContentWrapper);
local v17 = require(l_script_FirstAncestor_0.GameInviteDependencies);
local v18 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v19 = require(l_Actions_0.ResetUserInviteStatus);
local v20 = require(l_Parent_0.VrCompatibility);
local l_VRReadyWrapper_0 = v20.VRReadyWrapper;
local l_VRConstants_0 = v20.VRConstants;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_networkImpl_0 = v17.networkImpl;
game:DefineFastFlag("LuaEnableGameInviteModal2023V5", false);
local v25 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = v25.GetFFlagEnableUniversalAppGameInviteUnification;
local l_GetFFlagEnableGameInviteModalVRSupport_0 = v25.GetFFlagEnableGameInviteModalVRSupport;
local l_GetFFlagAdjustVRFloor_0 = v25.GetFFlagAdjustVRFloor;
return function(v29)
    if game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
        local v30, v31 = v8.useState(false);
        local v32, v33 = v8.useState(false);
        local v34, v35 = v8.useState({});
        local v36, v37 = v8.useState({});
        local v38, v39 = v8.useState("");
        local v40 = not l_RunService_0:IsStudio();
        local v41 = nil;
        local v42 = nil;
        local v43 = nil;
        if l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            v41 = v29.renderLocation == v18.RenderLocation.CoreScripts;
            v42 = v29.renderLocation == v18.RenderLocation.UniversalApp;
            v43 = l_useDispatch_0();
        end;
        local function v47(v44, v45, v46)
            v31(v44);
            v33(v45 or false);
            if v46 then
                v35(v46);
            end;
            if not (((not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v42) or v44) or not v43) then
                v43(v19());
            end;
        end;
        v8.useEffect(function()
            local v48 = v13.ToggleGameInviteModalEvent.Event:Connect(v47);
            return function()
                v48:Disconnect();
            end;
        end, {});
        v8.useEffect(function()
            if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
                local v49 = l_GuiService_0.MenuOpened:Connect(function()
                    if v30 then
                        v13:closeModal();
                    end;
                end);
                return function()
                    v49:Disconnect();
                end;
            elseif not v41 then
                return function()
                end;
            else
                local v50 = l_GuiService_0.MenuOpened:Connect(function()
                    if v30 then
                        v13:closeModal();
                    end;
                end);
                return function()
                    v50:Disconnect();
                end;
            end;
        end, {
            v30, 
            v41
        });
        v8.useEffect(function()
            if not ((not v40 or not v30) or l_GetFFlagEnableUniversalAppGameInviteUnification_0() and (not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not v41)) then
                if v38 == "" then
                    v10.try(function()
                        return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", 2):InvokeServer();
                    end):andThen(function(v51)
                        v39(v51);
                    end);
                end;
                if not (not l_GetGameNameAndDescription_0 or v36.Created) then
                    l_GetGameNameAndDescription_0(l_networkImpl_0, game.GameId):andThen(function(v52)
                        v37(v52);
                    end);
                end;
            end;
        end, {
            v30
        });
        if not v30 then
            return nil;
        elseif not l_GetFFlagEnableGameInviteModalVRSupport_0() or not v42 then
            return v8.createElement("ScreenGui", {
                DisplayOrder = v29.displayOrder, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                IgnoreGuiInset = true, 
                Name = v18.ParentComponentName
            }, {
                GameInviteModalLayoutProvider = v8.createElement(v14, {}, {
                    ModalWindowContainer = v8.createElement(v15, {}, {
                        GameInviteModalContentWrapper = v8.createElement(v16, {
                            options = v34, 
                            serverType = v38, 
                            gameDetails = v36, 
                            isLoading = v32, 
                            isCoreScript = v41
                        })
                    })
                })
            });
        else
            return v8.createElement(l_VRReadyWrapper_0, {
                component = "ScreenGui", 
                props = {
                    DisplayOrder = v29.displayOrder, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    IgnoreGuiInset = true, 
                    Name = v18.ParentComponentName
                }, 
                vrProps = {
                    partSize = l_VRConstants_0.MainScreenSize, 
                    offset = not not l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.MainScreenPosition or CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                    virtualScreenSize = l_VRConstants_0.MainScreenResolution, 
                    panelName = "GameInviteMenu", 
                    curvature = l_VRConstants_0.MainScreenCurvature
                }
            }, {
                GameInviteModalLayoutProvider = v8.createElement(v14, {}, {
                    ModalWindowContainer = v8.createElement(v15, {}, {
                        GameInviteModalContentWrapper = v8.createElement(v16, {
                            options = v34, 
                            serverType = v38, 
                            gameDetails = v36, 
                            isLoading = v32, 
                            isCoreScript = v41
                        })
                    })
                })
            });
        end;
    else
        return nil;
    end;
end;
