local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Packages.t);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = require(l_CorePackages_0.Workspace.Packages.InputType).getInputGroup;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v15 = require(l_Parent_0.Parent.PromptType);
local v16 = require(l_Parent_0.PublishAssetPromptSingleStep);
local v17 = require(l_Parent_0.PublishAvatarPrompt.PublishAvatarPrompt);
local v18 = require(l_Parent_0.ResultModal);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v20 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v21 = v20.FocusNavigationService.new(v20.EngineInterface.CoreGui);
local v22 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_Provider_0 = v22.FocusNavigableSurfaceRegistry.Provider;
local v24 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v22.FocusNavigableSurfaceIdentifierEnum;
local v26 = require(script.Parent.Parent.FFlagPublishAvatarPromptEnabled);
local v27 = game:DefineFastFlag("MigratePublishPromptFromRoactGamepad", false);
local v28 = v6.PureComponent:extend("PublishAssetPromptApp");
local v29 = game:DefineFastFlag("FixFocusOnResultModal", false);
v28.validateProps = v9.strictInterface({
    assetType = v9.optional(v9.enum(Enum.AssetType)), 
    assetInstance = v9.optional(v9.Instance)
});
local function _(v30)
    return l_getInputGroup_0(v30) == v11.InputTypeConstants.Gamepad;
end;
v28.init = function(v32)
    v32:setState({
        isGamepad = if not v27 then l_getInputGroup_0((l_UserInputService_0:GetLastInputType())) == v11.InputTypeConstants.Gamepad else nil, 
        screenSize = Vector2.new(0, 0)
    });
    v32.absoluteSizeChanged = function(v33)
        if v32.state.screenSize ~= v33.AbsoluteSize then
            v32:setState({
                screenSize = v33.AbsoluteSize
            });
        end;
    end;
    v32.focusController = if not v27 then v8.createFocusController() else nil;
    v32.selectedCoreGuiObject = nil;
    v32.selectedGuiObject = nil;
end;
v28.render = function(v34)
    local v35 = nil;
    if not v34.props.resultModalType then
        if not v34.props.assetInstance then
            if v26 and v34.props.promptType == v15.PublishAvatar then
                v35 = v6.createElement(v17, {
                    screenSize = v34.state.screenSize
                });
            end;
        elseif v34.props.promptType == v15.PublishAssetSingleStep then
            v35 = v6.createElement(v16, {
                screenSize = v34.state.screenSize
            });
        end;
    else
        v35 = v6.createElement(v18, {
            screenSize = v34.state.screenSize
        });
    end;
    return v6.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        DisplayOrder = -1, 
        [v6.Change.AbsoluteSize] = v34.absoluteSizeChanged
    }, {
        LastInputTypeConnection = v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = function(v36)
                v34:setState({
                    isGamepad = l_getInputGroup_0(v36) == v11.InputTypeConstants.Gamepad
                });
            end
        }) or nil, 
        PromptFrame = v6.createElement(v8.Focusable.Frame, {
            focusController = if not v27 then v34.focusController else nil, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            Prompt = if not v27 then v35 else nil, 
            CursorProvider = if not v27 then nil else v6.createElement(l_SelectionCursorProvider_0, {}, {
                FocusNavigationProvider = v6.createElement(v20.FocusNavigationContext.Provider, {
                    value = v21
                }, {
                    FocusNavigationRegistryProvider = v6.createElement(l_Provider_0, nil, {
                        FocusNavigationEffects = v6.createElement(v24, {
                            selectionGroupName = "PublishAssetPromptApp", 
                            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
                        }, {
                            Prompt = v35
                        })
                    })
                })
            })
        }) or nil
    });
end;
if not v27 then
    v28.revertSelectedGuiObject = function(v37)
        local v38 = nil;
        if l_LocalPlayer_0 then
            v38 = l_LocalPlayer_0:FindFirstChildWhichIsA("PlayerGui");
        end;
        if not v37.selectedCoreGuiObject or not v37.selectedCoreGuiObject:IsDescendantOf(l_CoreGui_0) then
            if not v37.selectedGuiObject or not v37.selectedGuiObject:IsDescendantOf(v38) then
                l_GuiService_0.SelectedCoreObject = nil;
            else
                l_GuiService_0.SelectedObject = v37.selectedGuiObject;
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        else
            l_GuiService_0.SelectedCoreObject = v37.selectedCoreGuiObject;
        end;
        v37.selectedCoreGuiObject = nil;
        v37.selectedGuiObject = nil;
    end;
    v28.didUpdate = function(v39, v40, v41)
        local v42 = nil;
        local v43 = nil;
        if not v29 then
            v42 = v39.state.isGamepad and v39.props.assetInstance ~= nil;
            v43 = v41.isGamepad and v40.assetInstance ~= nil;
        else
            local l_isGamepad_0 = v39.state.isGamepad;
            if l_isGamepad_0 then
                l_isGamepad_0 = true;
                if v39.props.assetInstance == nil then
                    l_isGamepad_0 = v39.props.resultModalType ~= nil;
                end;
            end;
            v42 = l_isGamepad_0;
            l_isGamepad_0 = v41.isGamepad;
            if l_isGamepad_0 then
                l_isGamepad_0 = true;
                if v40.assetInstance == nil then
                    l_isGamepad_0 = v40.resultModalType ~= nil;
                end;
            end;
            v43 = l_isGamepad_0;
        end;
        if v42 ~= v43 then
            if not v42 then
                v39.focusController.releaseFocus();
                if v39.state.isGamepad then
                    v39:revertSelectedGuiObject();
                end;
            else
                v39.selectedCoreGuiObject = l_GuiService_0.SelectedCoreObject;
                v39.selectedGuiObject = l_GuiService_0.SelectedObject;
                l_GuiService_0.SelectedObject = nil;
                v39.focusController.captureFocus();
                return ;
            end;
        end;
    end;
    v28.willUnmount = function(v45)
        if v45.state.isGamepad then
            v45:revertSelectedGuiObject();
        end;
    end;
end;
return v7.connect(function(v46)
    return {
        resultModalType = v46.promptRequest.resultModalType, 
        promptType = v46.promptRequest.promptInfo.promptType, 
        assetInstance = v46.promptRequest.promptInfo.assetInstance, 
        assetType = v46.promptRequest.promptInfo.assetType, 
        humanoidModel = if not v26 then nil else v46.promptRequest.promptInfo.humanoidModel
    };
end)(v28);
