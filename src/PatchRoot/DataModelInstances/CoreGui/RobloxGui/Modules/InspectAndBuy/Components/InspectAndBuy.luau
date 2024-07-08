local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local v8 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.Rodux);
local v11 = require(l_CorePackages_0.RoactRodux);
local v12 = require(l_CorePackages_0.Symbol);
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.UIBlox).App.SelectionImage.SelectionCursorProvider;
local l_Parent_0 = script.Parent.Parent;
local v16 = require(l_Parent_0.Actions.SetDetailsInformation);
local v17 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v18 = require(l_Parent_0.Thunk);
local v19 = require(l_Parent_0.Services.Network);
local v20 = require(l_Parent_0.Services.Analytics);
local v21 = require(l_Parent_0.Reducers.InspectAndBuyReducer);
local v22 = require(l_Parent_0.Components.Container);
local v23 = require(l_Parent_0.Constants);
local v24 = require(l_Parent_0.CompactView);
local v25 = require(l_Parent_0.WideView);
local v26 = require(l_Parent_0.WideLandscapeView);
local v27 = require(l_Parent_0.Actions.SetGamepadEnabled);
local v28 = require(l_Parent_0.Actions.SetView);
local v29 = require(l_Parent_0.Actions.SetPlayerId);
local v30 = require(l_Parent_0.Actions.SetPlayerName);
local v31 = require(l_Parent_0.Actions.SetLocale);
local v32 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v33 = require(l_Parent_0.Actions.SetIsSubjectToChinaPolicies);
local v34 = require(l_Parent_0.Actions.UpdateStoreId);
local v35 = require(l_Parent_0.Thunks.GetAssetsFromHumanoidDescription);
local v36 = require(l_Parent_0.Thunks.UpdateOwnedStatus);
local v37 = require(l_Parent_0.Thunks.GetCharacterModelFromUserId);
local v38 = require(l_Parent_0.Thunks.GetPlayerName);
local v39 = require(l_Parent_0.Components.InspectAndBuyContext);
local v40 = require(l_Parent_0.Actions.CloseOverlay);
local v41 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v42 = require(l_Parent_0.Flags.GetFFlagIBFixl20HasQuantityPurchase);
local v43 = require(l_CoreGui_0.RobloxGui.Modules.Common.PolicyService);
local v44 = v12.named("OverrideCursorInspectMenu");
local v45 = v9.PureComponent:extend("InspectAndBuy");
v45.pushMouseIconOverride = function(_)
    if not l_UserInputService_0:GetLastInputType().Name:find("Gamepad") then
        v8.push(v44, Enum.OverrideMouseIconBehavior.ForceShow);
        return ;
    else
        v8.push(v44, Enum.OverrideMouseIconBehavior.ForceHide);
        return ;
    end;
end;
v45.popMouseIconOverride = function(_)
    v8.pop(v44);
end;
v45.configureInputType = function(v48, v49)
    if not (v49 or l_UserInputService_0:GetLastInputType()).Name:find("Gamepad") then
        v48.state.store:dispatch(v27(false));
        return ;
    else
        v48.state.store:dispatch(v27(true));
        return ;
    end;
end;
v45.updateView = function(v50)
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    local l_Wide_0 = v23.View.Wide;
    if l_ViewportSize_0.X < 600 then
        l_Wide_0 = v23.View.Compact;
    elseif l_ViewportSize_0.Y < l_ViewportSize_0.X and l_ViewportSize_0.X < 800 then
        l_Wide_0 = v23.View.WideLandscape;
    end;
    v50.state.store:dispatch(v28(l_Wide_0));
end;
v45.init = function(v53)
    local l_playerId_0 = v53.props.playerId;
    local l_playerName_0 = v53.props.playerName;
    local l_ctx_0 = v53.props.ctx;
    v53.connections = {};
    v53.network = v53.props.network or v19.new();
    v53.analytics = v20.new(l_playerId_0, l_ctx_0);
    v53.humanoidDescription = v53.props.humanoidDescription;
    v53.analytics.reportOpenInspectMenu();
    v53.state = {
        store = v10.Store.new(v21, {}, {
            v18.middleware({
                [v19] = v53.network, 
                [v20] = v53.analytics
            })
        }), 
        views = {
            [v23.View.Compact] = v24, 
            [v23.View.Wide] = v25, 
            [v23.View.WideLandscape] = v26
        }
    };
    v53.state.store:dispatch(v34());
    v53.state.store:dispatch(v30(l_playerName_0));
    v53.state.store:dispatch(v31(l_LocalizationService_0.RobloxLocaleId));
    if l_playerId_0 then
        v53.state.store:dispatch(v29(l_playerId_0));
    end;
    if v53.humanoidDescription then
        v53.state.store:dispatch(v35(v53.humanoidDescription, false));
    end;
    v53.onPromptPurchaseFinished = function(_, v58, v59)
        local l_itemBeingPurchased_0 = v53.state.store:getState().itemBeingPurchased;
        if v42() then
            v53.analytics.sendCounter(v23.Counters.PurchaseFinished);
        end;
        if v59 and tostring(v58) == l_itemBeingPurchased_0.itemId then
            v53.analytics.reportPurchaseSuccess(l_itemBeingPurchased_0.itemType, l_itemBeingPurchased_0.itemId);
            v53.state.store:dispatch(v36(l_itemBeingPurchased_0.itemId, l_itemBeingPurchased_0.itemType));
            if v42() then
                if l_itemBeingPurchased_0.itemType == v23.ItemType.Asset then
                    v53.analytics.sendCounter(v23.Counters.PurchaseSucceededAsset);
                elseif l_itemBeingPurchased_0.itemType == v23.ItemType.Bundle then
                    v53.analytics.sendCounter(v23.Counters.PurchaseSucceededBundle);
                else
                    v53.analytics.sendCounter(v23.Counters.PurchaseSucceededOther);
                end;
            end;
        end;
        v53.state.store:dispatch(v32(nil, nil));
    end;
end;
v45.didMount = function(v61)
    local l_playerId_1 = v61.props.playerId;
    v61.isMounted = true;
    v61:updateView();
    v61:bindButtonB();
    v61:configureInputType();
    v61:pushMouseIconOverride();
    local v64 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v63)
        v61:configureInputType(v63);
    end);
    local v65 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        v61:updateView();
    end);
    local v66 = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
        v61.state.store:dispatch(v31(l_LocalizationService_0.RobloxLocaleId));
    end);
    local v67 = l_GuiService_0.MenuOpened:Connect(function()
        v61:popMouseIconOverride();
        l_GuiService_0.SelectedCoreObject = nil;
    end);
    local v68 = l_GuiService_0.MenuClosed:Connect(function()
        v61:pushMouseIconOverride();
    end);
    coroutine.wrap(function()
        v61.state.store:dispatch(v33((v43:IsSubjectToChinaPolicies())));
    end)();
    local v69 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v61.onPromptPurchaseFinished);
    local v70 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v61.onPromptPurchaseFinished);
    local v73 = v61.state.store.changed:connect(function(v71, v72)
        v61:update(v71, v72);
    end);
    table.insert(v61.connections, v65);
    table.insert(v61.connections, v66);
    table.insert(v61.connections, v67);
    table.insert(v61.connections, v68);
    table.insert(v61.connections, v64);
    table.insert(v61.connections, v69);
    table.insert(v61.connections, v70);
    table.insert(v61.connections, v73);
    v61.state.store:dispatch(v37(l_Players_0.LocalPlayer.UserId, true, function(v74)
        if not (not v61 or not v61.isMounted) then
            v61.localPlayerModel = v74;
            local l_HumanoidDescription_0 = v74.Humanoid.HumanoidDescription;
            if l_HumanoidDescription_0 then
                v61.state.store:dispatch(v35(l_HumanoidDescription_0, true));
            end;
            v61:setState({
                obtainedLocalPlayerModel = true
            });
        end;
    end));
    if l_playerId_1 then
        v61.state.store:dispatch(v37(l_playerId_1, false, function(v76)
            if not (not v61 or not v61.isMounted) then
                v61.playerModel = v76;
                local l_HumanoidDescription_1 = v61.playerModel.Humanoid.HumanoidDescription;
                if l_HumanoidDescription_1 then
                    v61.state.store:dispatch(v35(l_HumanoidDescription_1, false));
                end;
                v61:setState({
                    obtainedPlayerModel = true
                });
            end;
        end));
        v61.state.store:dispatch(v38(l_playerId_1));
    end;
end;
v45.update = function(v78, v79, v80)
    if v79.visible or not v80.visible then
        if not (not v79.visible or v80.visible) then
            v78:bindButtonB();
        end;
        return ;
    else
        l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
        return ;
    end;
end;
v45.willUnmount = function(v81)
    v81.isMounted = false;
    for _, v83 in pairs(v81.connections) do
        v83:disconnect();
    end;
    l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
    v81:popMouseIconOverride();
end;
v45.render = function(v84)
    local l_localPlayerModel_0 = v84.localPlayerModel;
    if not v41 then
        return v9.createElement(v39.Provider, {
            value = v84.state.views
        }, {
            v9.createElement(v11.StoreProvider, {
                store = v84.state.store
            }, {
                ThemeProvider = v13({
                    Container = v9.createElement(v22, {
                        localPlayerModel = l_localPlayerModel_0
                    })
                })
            })
        });
    else
        return v9.createElement(v39.Provider, {
            value = v84.state.views
        }, {
            StoreProvider = v9.createElement(v11.StoreProvider, {
                store = v84.state.store
            }, {
                ThemeProvider = v13({
                    CursorProvider = v9.createElement(l_SelectionCursorProvider_0, {}, {
                        Container = v9.createElement(v22, {
                            localPlayerModel = l_localPlayerModel_0
                        })
                    })
                })
            })
        });
    end;
end;
v45.bindButtonB = function(v86)
    l_ContextActionService_0:BindCoreAction("BackButtonInspectMenu", function(_, v88, v89)
        if v88 == Enum.UserInputState.End and v89.KeyCode == Enum.KeyCode.ButtonB then
            local v90 = v86.state.store:getState();
            local l_viewingDetails_0 = v90.detailsInformation.viewingDetails;
            if not (not v41 or not v90.overlay) and v90.overlay.overlay ~= nil then
                v86.state.store:dispatch(v40());
            elseif not l_viewingDetails_0 then
                l_GuiService_0:CloseInspectMenu();
            else
                v86.state.store:dispatch(v16(false, nil));
                v86.state.store:dispatch(v17(false, nil));
            end;
        elseif not (not (v88 == Enum.UserInputState.Begin) or v89.KeyCode ~= Enum.KeyCode.Escape) or v89.KeyCode == Enum.KeyCode.ButtonStart then
            l_GuiService_0:CloseInspectMenu();
            return Enum.ContextActionResult.Pass;
        end;
        return Enum.ContextActionResult.Sink;
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart);
end;
return v45;
