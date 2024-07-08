local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = game:DefineFastFlag("DebugPlayerListRoactInspector", false);
local v8 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v9 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v10 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v11 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local v12 = require(l_CorePackages_0.Roact);
local v13 = require(l_CorePackages_0.Rodux);
local v14 = require(l_CorePackages_0.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.UIBlox).App.Style.Constants;
local v16 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_Parent_0 = script.Parent;
local v19 = require(l_Parent_0.Components.Presentation.PlayerListApp);
local v20 = require(l_Parent_0.Reducers.Reducer);
local v21 = require(l_Parent_0.GlobalConfig);
local v22 = require(l_Parent_0.CreateLayoutValues);
local l_Provider_0 = require(l_Parent_0.Components.Connection.LayoutValues).Provider;
local v24 = require(l_Parent_0.PlayerListSwitcher);
local v25 = require(l_Parent_0.Actions.SetPlayerListEnabled);
local v26 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v27 = require(l_Parent_0.Actions.SetTempHideKey);
local v28 = require(l_Parent_0.Actions.SetTenFootInterface);
local v29 = require(l_Parent_0.Actions.SetSmallTouchDevice);
local v30 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v31 = require(l_Parent_0.Actions.SetHasPermissionToVoiceChat);
local v32 = require(l_Parent_0.Actions.SetMinimized);
local v33 = require(l_Parent_0.Actions.SetSubjectToChinaPolicies);
local v34 = require(l_Parent_0.Actions.SetSettings);
local v35 = require(l_RobloxGui_0.Modules.Flags.FFlagMobilePlayerList);
local v36 = require(l_Parent_0.Flags.FFlagRefactorPlayerNameTag);
if not l_Players_0.LocalPlayer then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
local function v37()
    if not _G.__TESTEZ_RUNNING_TEST__ then
        return v10:IsSmallTouchScreen();
    else
        return false;
    end;
end;
local v38 = nil;
if v35 then
    v38 = Instance.new("ScreenGui");
    v38.Parent = l_CoreGui_0;
    v38.Name = "PlayerList";
    v38.DisplayOrder = 1;
    v38.IgnoreGuiInset = true;
    v38.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
end;
local function v41(v39)
    local function _()
        v39:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end;
    v39:dispatch(v34({
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency
    }));
    l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
        v39:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
        v39:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
end;
local v42 = {};
v42.__index = v42;
v42.new = function()
    local v43 = setmetatable({}, v42);
    if v21.propValidation then
        v12.setGlobalConfig({
            propValidation = true
        });
    end;
    if v21.elementTracing then
        v12.setGlobalConfig({
            elementTracing = true
        });
    end;
    v43.store = v13.Store.new(v20, nil, {
        v13.thunkMiddleware
    });
    v41(v43.store);
    if not l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
        v43.store:dispatch(v25(false));
    end;
    coroutine.wrap(function()
        v43.store:dispatch(v29(v37()));
    end)();
    v43.store:dispatch(v28(v9:IsEnabled()));
    if v9:IsEnabled() then
        coroutine.wrap(function()
            pcall(function()
                if game:GetService("PlatformService"):BeginCheckXboxPrivilege(205).PrivilegeCheckResult == "NoIssue" then
                    v43.store:dispatch(v31(true));
                end;
            end);
        end)();
    end;
    coroutine.wrap(function()
        v43.store:dispatch(v33(v11:IsSubjectToChinaPolicies()));
    end)();
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    v43.store:dispatch(v30((l_l_UserInputService_0_LastInputType_0 and l_l_UserInputService_0_LastInputType_0.Name:find("Gamepad")) ~= nil));
    v43:_trackEnabled();
    local v45 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    if not v35 then
        v43.root = v12.createElement(v14.StoreProvider, {
            store = v43.store
        }, {
            LayoutValuesProvider = v12.createElement(l_Provider_0, {
                layoutValues = v22(v9:IsEnabled())
            }, {
                ThemeProvider = v8({
                    PlayerListApp = v12.createElement(v19)
                })
            })
        });
        if v36 then
            v43.root = v12.createElement(l_ApolloProvider_0, {
                client = v16
            }, {
                StoreProvider = v43.root
            });
        end;
        v43.element = v12.mount(v43.root, l_RobloxGui_0, "PlayerListMaster");
    else
        v43.root = v12.createElement(v14.StoreProvider, {
            store = v43.store
        }, {
            v12.createElement(v24, {
                appStyleForUiModeStyleProvider = v45, 
                setLayerCollectorEnabled = function(v46)
                    v38.Enabled = v46;
                end
            })
        });
        if v36 then
            v43.root = v12.createElement(l_ApolloProvider_0, {
                client = v16
            }, {
                StoreProvider = v43.root
            });
        end;
        v43.element = v12.mount(v43.root, v38, "PlayerListMaster");
    end;
    if not (not v7 or not (game:GetService("RunService"):IsStudio() and game:GetService("StudioService"):HasInternalPermission())) then
        v43.inspector = require(l_CorePackages_0.DeveloperTools).forCoreGui("PlayerList", {
            rootInstance = (not not v35 and v38 or l_RobloxGui_0):FindFirstChild("PlayerListMaster"), 
            pickerParent = "RobloxGui"
        });
        v43.inspector:addRoactTree("Roact tree", v43.element, v12);
    end;
    v43.topBarEnabled = true;
    v43.mounted = true;
    v43.coreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    v43:_updateMounted();
    v43.SetVisibleChangedEvent = Instance.new("BindableEvent");
    v43.store.changed:connect(function(v47, v48)
        if v47.displayOptions.setVisible ~= v48.displayOptions.setVisible then
            v43.SetVisibleChangedEvent:Fire(v47.displayOptions.setVisible);
        end;
    end);
    return v43;
end;
v42._updateMounted = function(v49)
    if not v9:IsEnabled() then
        local v50 = v49.coreGuiEnabled and v49.topBarEnabled;
        if not v50 or v49.mounted then
            if not (v50 or not v49.mounted) then
                v12.unmount(v49.element);
                v49.mounted = false;
                if v49.inspector then
                    v49.inspector:destroy();
                    v49.inspector = nil;
                end;
            end;
        else
            v49.element = v12.mount(v49.root, not not v35 and v38 or l_RobloxGui_0, "PlayerListMaster");
            v49.mounted = true;
            return ;
        end;
    end;
end;
v42._trackEnabled = function(v51)
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v52, v53)
        if not (v52 ~= Enum.CoreGuiType.All) or v52 == Enum.CoreGuiType.PlayerList then
            v51.coreGuiEnabled = v53;
            v51:_updateMounted();
            v51.store:dispatch(v25(v53));
        end;
    end);
end;
v42.GetVisibility = function(v54)
    return v54.store:getState().displayOptions.isVisible;
end;
v42.GetSetVisible = function(v55)
    return v55.store:getState().displayOptions.setVisible;
end;
v42.GetSetVisibleChangedEvent = function(v56)
    return v56.SetVisibleChangedEvent;
end;
v42.SetVisibility = function(v57, v58)
    v57.store:dispatch(v26(v58));
end;
v42.HideTemp = function(v59, v60, v61)
    if v61 == false then
        v61 = nil;
    end;
    v59.store:dispatch(v27(v60, v61));
end;
v42.SetTopBarEnabled = function(v62, v63)
    v62.topBarEnabled = v63;
    v62:_updateMounted();
end;
v42.SetMinimized = function(v64, v65)
    v64.store:dispatch(v32(v65));
end;
return v42;
