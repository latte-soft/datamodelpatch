local l_Parent_0 = script.Parent.Parent.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_AssetService_0 = game:GetService("AssetService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v6 = require(l_CorePackages_0.PurchasePromptDeps);
local l_Roact_0 = v6.Roact;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common:WaitForChild("PolicyService"));
local l_UIBlox_0 = v6.UIBlox;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v15 = require(l_CorePackages_0.IAPExperience);
local l_ProductPurchase_0 = v15.ProductPurchase;
local l_ProductPurchaseRobuxUpsell_0 = v15.ProductPurchaseRobuxUpsell;
local v18 = require(l_Parent_0.Enums.PurchaseFlow);
local v19 = require(l_Parent_0.Enums.RequestType);
local v20 = require(l_Parent_0.Enums.PromptState);
local v21 = require(l_Parent_0.Enums.WindowState);
local v22 = require(l_Parent_0.Enums.PurchaseError);
local v23 = require(l_Parent_0.Thunks.hideWindow);
local v24 = require(l_Parent_0.Thunks.completeRequest);
local v25 = require(l_Parent_0.Thunks.purchaseItem);
local v26 = require(l_Parent_0.Thunks.completePurchase);
local v27 = require(l_Parent_0.Thunks.launchRobuxUpsell);
local v28 = require(l_Parent_0.Thunks.openSecuritySettings);
local v29 = require(l_Parent_0.Thunks.initiatePurchasePrecheck);
local v30 = require(l_Parent_0.Utils.isMockingPurchases);
local v31 = require(l_Parent_0.connectToStore);
local v32 = require(l_Parent_0.Thunks.sendEvent);
local _ = require(l_Parent_0.Components.Connection.PurchasePromptPolicy);
local v34 = require(l_Parent_0.Components.Connection.ExternalEventConnection);
local v35 = require(l_Parent_0.Components.Connection.MultiTextLocalizer);
local v36 = require(l_Parent_0.Localization.LocalizationService);
local v37 = require(l_Parent_0.Utils.getPlayerPrice);
local v38 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local v39 = require(l_Parent_0.Flags.GetFFlagEnableAvatarCreationFeePurchase);
local v40 = require(script.Parent.Animator);
local v41 = l_Roact_0.Component:extend(script.Name);
local v42 = game:DefineFastFlag("PPTwoFactorLogOutMessage", false);
local v43 = game:DefineFastFlag("FixOpenWithMenuConsole", false);
local function _(v44, v45)
    if not (v45 ~= v18.RobuxUpsellV2) or v45 == v18.LargeRobuxUpsell then
        return false;
    else
        local v46 = true;
        if v44 ~= v19.Asset then
            v46 = true;
            if v44 ~= v19.Bundle then
                v46 = true;
                if v44 ~= v19.GamePass then
                    v46 = true;
                    if v44 ~= v19.Product then
                        v46 = v39() and v44 == v19.AvatarCreationFee;
                    end;
                end;
            end;
        end;
        return v46;
    end;
end;
v41.init = function(v48)
    v48.state = {
        screenSize = Vector2.new(0, 0), 
        isLuobu = false
    };
    coroutine.wrap(function()
        if l_PolicyService_0:IsSubjectToChinaPolicies() then
            v48:setState({
                isLuobu = true
            });
        end;
    end)();
    v48.changeScreenSize = function(v49)
        if v48.state.screenSize ~= v49.AbsoluteSize then
            v48:setState({
                screenSize = v49.AbsoluteSize
            });
        end;
    end;
    v48.hasDelayedInput = function()
        if not v48.props.isTestPurchase then
            local l_promptState_0 = v48.props.promptState;
            local v51 = true;
            if l_promptState_0 ~= v20.PromptPurchase then
                v51 = true;
                if l_promptState_0 ~= v20.PurchaseInProgress then
                    v51 = true;
                    if l_promptState_0 ~= v20.RobuxUpsell then
                        v51 = l_promptState_0 == v20.UpsellInProgress;
                    end;
                end;
            end;
            return v51;
        else
            return false;
        end;
    end;
    v48.isWindowShowAndDoneAnimating = function()
        return v48.state.isAnimating == false;
    end;
    v48.canConfirmInput = function()
        if not l_Players_0.LocalPlayer.GameplayPaused and (not l_GuiService_0.MenuIsOpen or not v43) then
            local v52 = v48.isWindowShowAndDoneAnimating();
            if not v48.hasDelayedInput() then
                return v52;
            else
                local v53 = false;
                if v48.state.doneAnimatingTime then
                    v53 = os.clock() - v48.state.doneAnimatingTime > 2.5;
                end;
                return v52 and v53;
            end;
        else
            return false;
        end;
    end;
    v48.onAvatarCreationFeePurchase = function()
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v48.props.productInfo.productId, {
            [1] = Enum.ExperienceAuthScope.CreatorAssetsCreate
        }, Enum.ScopeCheckResult.ConsentAccepted, {
            avatarName = v48.props.productInfo.name
        });
        v48.props.completePurchase();
    end;
    v48.getConfirmButtonAction = function(v54, v55, v56)
        if v54 ~= v20.None then
            local v57;
            if not (v18.RobuxUpsellV2 ~= nil) or v18.LargeRobuxUpsell == nil then
                v57 = false;
            else
                v57 = true;
                if v55 ~= v19.Asset then
                    v57 = true;
                    if v55 ~= v19.Bundle then
                        v57 = true;
                        if v55 ~= v19.GamePass then
                            v57 = true;
                            if v55 ~= v19.Product then
                                v57 = v39() and v55 == v19.AvatarCreationFee;
                            end;
                        end;
                    end;
                end;
            end;
            if v57 then
                if v39() and v55 == v19.AvatarCreationFee then
                    return v48.onAvatarCreationFeePurchase;
                elseif not (v54 ~= v20.PromptPurchase) or v54 == v20.PurchaseInProgress then
                    return v48.props.onBuy;
                elseif not (v54 ~= v20.RobuxUpsell) or v54 == v20.UpsellInProgress then
                    return v48.props.onRobuxUpsell;
                elseif not ((v54 ~= v20.U13PaymentModal and v54 ~= v20.U13MonthlyThreshold1Modal) and v54 ~= v20.U13MonthlyThreshold2Modal) or v54 == v20.ParentalConsentWarningPaymentModal13To17 then
                    return v48.props.onScaryModalConfirm;
                elseif v54 == v20.Error and v56 == v22.TwoFactorNeededSettings then
                    return v48.props.onOpenSecuritySettings;
                elseif not v38(v56) then
                    return v48.props.hideWindow;
                else
                    return function()
                        v48.props.onOpenSecuritySettings(v56);
                    end;
                end;
            end;
        end;
        return nil;
    end;
    v48.getCancelButtonAction = function(v58, v59)
        if v58 ~= v20.None then
            local v60;
            if not (v18.RobuxUpsellV2 ~= nil) or v18.LargeRobuxUpsell == nil then
                v60 = false;
            else
                v60 = true;
                if v59 ~= v19.Asset then
                    v60 = true;
                    if v59 ~= v19.Bundle then
                        v60 = true;
                        if v59 ~= v19.GamePass then
                            v60 = true;
                            if v59 ~= v19.Product then
                                v60 = v39() and v59 == v19.AvatarCreationFee;
                            end;
                        end;
                    end;
                end;
            end;
            if v60 then
                return v48.props.hideWindow;
            end;
        end;
        return nil;
    end;
    v48.confirmButtonPressed = function()
        local v61 = v48.getConfirmButtonAction(v48.props.promptState, v48.props.requestType, v48.props.purchaseError);
        if not (not (v61 ~= nil) or not v48.canConfirmInput()) then
            v61();
        end;
    end;
    v48.cancelButtonPressed = function()
        local v62 = v48.getCancelButtonAction(v48.props.promptState, v48.props.requestType);
        if v62 ~= nil then
            v62();
        end;
    end;
    v48.configContextActionService = function(v63)
        if v63 == v21.Shown then
            l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v65, _)
                if v65 == Enum.UserInputState.Begin then
                    v48.confirmButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonA);
            l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v68, _)
                if v68 == Enum.UserInputState.Begin then
                    v48.cancelButtonPressed();
                end;
            end, false, Enum.KeyCode.ButtonB);
            return ;
        else
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
            l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
            return ;
        end;
    end;
end;
v41.didMount = function(v70)
    local l_purchaseFlow_0 = v70.props.purchaseFlow;
    local l_requestType_0 = v70.props.requestType;
    if v70.props.windowState == v21.Shown then
        local v73;
        if not (l_purchaseFlow_0 ~= v18.RobuxUpsellV2) or l_purchaseFlow_0 == v18.LargeRobuxUpsell then
            v73 = false;
        else
            v73 = true;
            if l_requestType_0 ~= v19.Asset then
                v73 = true;
                if l_requestType_0 ~= v19.Bundle then
                    v73 = true;
                    if l_requestType_0 ~= v19.GamePass then
                        v73 = true;
                        if l_requestType_0 ~= v19.Product then
                            v73 = v39() and l_requestType_0 == v19.AvatarCreationFee;
                        end;
                    end;
                end;
            end;
        end;
        if v73 then
            v70:setState({
                isAnimating = true
            });
            v70.configContextActionService(v70.props.windowState);
            l_GuiService_0.SetPurchasePromptIsShown(true);
        end;
    end;
end;
v41.willUpdate = function(v74, v75)
    if v74.props.expectedPrice ~= v75.expectedPrice then
        v74:setState({});
    end;
end;
v41.didUpdate = function(v76, v77, _)
    if not (not l_Players_0.LocalPlayer.GameplayPaused and (not l_GuiService_0.MenuIsOpen or not v43)) then
        v76.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
            place_id = game.PlaceId
        });
        v76.props.hideWindow();
    end;
    local l_purchaseFlow_1 = v76.props.purchaseFlow;
    local l_requestType_1 = v76.props.requestType;
    if v77.windowState ~= v76.props.windowState then
        local v81;
        if not (l_purchaseFlow_1 ~= v18.RobuxUpsellV2) or l_purchaseFlow_1 == v18.LargeRobuxUpsell then
            v81 = false;
        else
            v81 = true;
            if l_requestType_1 ~= v19.Asset then
                v81 = true;
                if l_requestType_1 ~= v19.Bundle then
                    v81 = true;
                    if l_requestType_1 ~= v19.GamePass then
                        v81 = true;
                        if l_requestType_1 ~= v19.Product then
                            v81 = v39() and l_requestType_1 == v19.AvatarCreationFee;
                        end;
                    end;
                end;
            end;
        end;
        if v81 then
            v76:setState({
                isAnimating = true
            });
            v76.configContextActionService(v76.props.windowState);
            l_GuiService_0:SetPurchasePromptIsShown(v76.props.windowState == v21.Shown);
        end;
    end;
end;
v41.getMessageKeysFromPromptState = function(v82)
    local l_promptState_1 = v82.props.promptState;
    local l_productInfo_0 = v82.props.productInfo;
    local l_purchaseError_0 = v82.props.purchaseError;
    if l_promptState_1 == v20.PurchaseComplete then
        return {
            messageText = {
                key = ("CoreScripts.PurchasePrompt.PurchaseMessage.%s"):format("Succeeded"), 
                params = {
                    ITEM_NAME = l_productInfo_0.name
                }
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v20.U13PaymentModal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v20.U13MonthlyThreshold1Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v20.U13MonthlyThreshold2Modal then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v20.ParentalConsentWarningPaymentModal13To17 then
        return {
            messageText = {
                key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
            }, 
            okText = {
                key = "CoreScripts.PurchasePrompt.Button.OK"
            }, 
            titleText = {
                key = "CoreScripts.PurchasePrompt.Title.BuyItem"
            }
        };
    elseif l_promptState_1 == v20.Error then
        if l_purchaseError_0 == v22.UnknownFailure then
            return {
                messageText = {
                    key = v36.getErrorKey(l_purchaseError_0), 
                    params = {
                        ITEM_NAME = l_productInfo_0.name
                    }
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        elseif l_purchaseError_0 ~= v22.TwoFactorNeededSettings and not v38(l_purchaseError_0) then
            return {
                messageText = {
                    key = v36.getErrorKey(l_purchaseError_0)
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.OK"
                }, 
                titleText = {
                    key = "CoreScripts.PremiumModal.Title.Error"
                }
            };
        else
            local v86 = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SV";
            if v42 then
                v86 = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout";
            end;
            return {
                messageText = {
                    key = v86
                }, 
                okText = {
                    key = "CoreScripts.PurchasePrompt.Button.Settings"
                }, 
                cancelText = {
                    key = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel"
                }, 
                titleText = {
                    key = "CoreScripts.PurchasePrompt.Title.VerificationRequired"
                }
            };
        end;
    else
        return ;
    end;
end;
v41.render = function(v87)
    local l_purchaseFlow_2 = v87.props.purchaseFlow;
    local l_promptState_2 = v87.props.promptState;
    local l_expectedPrice_0 = v87.props.expectedPrice;
    local l_requestType_2 = v87.props.requestType;
    local l_purchaseError_1 = v87.props.purchaseError;
    local l_productInfo_1 = v87.props.productInfo;
    local l_accountInfo_0 = v87.props.accountInfo;
    local l_nativeUpsell_0 = v87.props.nativeUpsell;
    local l_isTestPurchase_0 = v87.props.isTestPurchase;
    local v97 = nil;
    if l_promptState_2 ~= v20.None then
        local v98;
        if not (l_purchaseFlow_2 ~= v18.RobuxUpsellV2) or l_purchaseFlow_2 == v18.LargeRobuxUpsell then
            v98 = false;
        else
            v98 = true;
            if l_requestType_2 ~= v19.Asset then
                v98 = true;
                if l_requestType_2 ~= v19.Bundle then
                    v98 = true;
                    if l_requestType_2 ~= v19.GamePass then
                        v98 = true;
                        if l_requestType_2 ~= v19.Product then
                            v98 = v39() and l_requestType_2 == v19.AvatarCreationFee;
                        end;
                    end;
                end;
            end;
        end;
        if v98 then
            v97 = if not (l_promptState_2 ~= v20.PromptPurchase) or l_promptState_2 == v20.PurchaseInProgress then l_Roact_0.createElement(l_ProductPurchase_0, {
                screenSize = v87.state.screenSize, 
                isDisabled = l_promptState_2 == v20.PurchaseInProgress, 
                model = if not v87.props.serializedModel then nil else l_AssetService_0:DeserializeInstance(v87.props.serializedModel), 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = v37(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                currentBalance = l_accountInfo_0.balance, 
                testPurchase = l_isTestPurchase_0, 
                isDelayedInput = v87.hasDelayedInput(), 
                enableInputDelayed = v87.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
                cancelControllerIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
                buyItemActivated = v87.confirmButtonPressed, 
                cancelPurchaseActivated = v87.cancelButtonPressed, 
                isLuobu = v87.state.isLuobu
            }) else if not (l_promptState_2 ~= v20.RobuxUpsell) or l_promptState_2 == v20.UpsellInProgress then l_Roact_0.createElement(l_ProductPurchaseRobuxUpsell_0, {
                screenSize = v87.state.screenSize, 
                isDisabled = l_promptState_2 == v20.UpsellInProgress, 
                model = if not v87.props.serializedModel then nil else l_AssetService_0:DeserializeInstance(v87.props.serializedModel), 
                itemIcon = l_productInfo_1.imageUrl, 
                itemName = l_productInfo_1.name, 
                itemRobuxCost = v37(l_productInfo_1, l_accountInfo_0.membershipType == 4, l_expectedPrice_0), 
                robuxPurchaseAmount = l_nativeUpsell_0.robuxPurchaseAmount, 
                balanceAmount = l_accountInfo_0.balance, 
                isDelayedInput = v87.hasDelayedInput(), 
                enableInputDelayed = v87.isWindowShowAndDoneAnimating(), 
                buyItemControllerIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", 
                cancelControllerIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
                buyItemActivated = v87.confirmButtonPressed, 
                cancelPurchaseActivated = v87.cancelButtonPressed, 
                isLuobu = v87.state.isLuobu
            }) else if not (not (l_promptState_2 == v20.Error) or l_purchaseError_1 ~= v22.TwoFactorNeededSettings) or v38(l_purchaseError_1) then l_Roact_0.createElement(v35, {
                locKeys = v87:getMessageKeysFromPromptState(), 
                render = function(v99)
                    return l_Roact_0.createElement(l_InteractiveAlert_0, {
                        bodyText = v99.messageText, 
                        buttonStackInfo = {
                            buttons = {
                                {
                                    props = {
                                        onActivated = v87.cancelButtonPressed, 
                                        text = v99.cancelText, 
                                        inputIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png"
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_0.PrimarySystem, 
                                    props = {
                                        onActivated = v87.confirmButtonPressed, 
                                        text = v99.okText, 
                                        inputIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png"
                                    }
                                }
                            }
                        }, 
                        screenSize = v87.state.screenSize, 
                        title = v99.titleText, 
                        titleIcon = l_Images_0["icons/status/error_large"]
                    });
                end
            }) else l_Roact_0.createElement(v35, {
                locKeys = v87:getMessageKeysFromPromptState(), 
                render = function(v100)
                    return l_Roact_0.createElement(l_InteractiveAlert_0, {
                        bodyText = v100.messageText, 
                        buttonStackInfo = {
                            buttons = {
                                {
                                    buttonType = l_ButtonType_0.PrimarySystem, 
                                    props = {
                                        onActivated = v87.confirmButtonPressed, 
                                        text = v100.okText, 
                                        inputIcon = if not v87.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png"
                                    }
                                }
                            }
                        }, 
                        screenSize = v87.state.screenSize, 
                        title = v100.titleText
                    });
                end
            });
            goto label0 --[[  true, true  ]];
        end;
    end;
    v97 = nil;
    ::label0::;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        [l_Roact_0.Change.AbsoluteSize] = v87.changeScreenSize, 
        BackgroundTransparency = 1
    }, {
        Animator = l_Roact_0.createElement(v40, {
            shouldShow = v87.props.windowState ~= v21.Hidden, 
            onShown = function()
                v87:setState({
                    isAnimating = false, 
                    doneAnimatingTime = os.clock()
                });
            end, 
            onHidden = function()
                v87:setState({
                    isAnimating = nil, 
                    doneAnimatingTime = nil
                });
                if v87.props.windowState == v21.Hidden then
                    local l_requestType_3 = v87.props.requestType;
                    local v102;
                    if not (v18.RobuxUpsellV2 ~= nil) or v18.LargeRobuxUpsell == nil then
                        v102 = false;
                    else
                        v102 = true;
                        if l_requestType_3 ~= v19.Asset then
                            v102 = true;
                            if l_requestType_3 ~= v19.Bundle then
                                v102 = true;
                                if l_requestType_3 ~= v19.GamePass then
                                    v102 = true;
                                    if l_requestType_3 ~= v19.Product then
                                        v102 = v39() and l_requestType_3 == v19.AvatarCreationFee;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v102 then
                        v87.props.completeRequest();
                    end;
                end;
            end, 
            [l_Roact_0.Ref] = v87.animatorRef
        }, {
            Prompt = v97, 
            ModalFix = v97 ~= nil and l_Roact_0.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            }) or nil
        }), 
        OnCoreGuiMenuOpened = l_Roact_0.createElement(v34, {
            event = l_GuiService_0.MenuOpened, 
            callback = function()
                if v87.props.hideWindow then
                    v87.props.hideWindow();
                end;
            end
        }), 
        OnUserGuiRenderingChanged = l_Roact_0.createElement(v34, {
            event = l_CoreGui_0.UserGuiRenderingChanged, 
            callback = function(v103, v104)
                if not (v103 and v104) then
                    v87.props.hideWindow();
                end;
            end
        })
    });
end;
return (v31(function(v105)
    return {
        purchaseFlow = v105.purchaseFlow, 
        promptState = v105.promptState, 
        requestType = v105.promptRequest.requestType, 
        serializedModel = v105.promptRequest.serializedModel, 
        expectedPrice = v105.promptRequest.expectedPrice, 
        windowState = v105.windowState, 
        purchaseError = v105.purchaseError, 
        productInfo = v105.productInfo, 
        accountInfo = v105.accountInfo, 
        nativeUpsell = v105.nativeUpsell, 
        isTestPurchase = v30(), 
        isGamepadEnabled = v105.gamepadEnabled
    };
end, function(v106)
    return {
        onBuy = function()
            v106(v25());
        end, 
        completePurchase = function()
            v106(v26());
        end, 
        onScaryModalConfirm = function()
            v106(v27());
        end, 
        onOpenSecuritySettings = function(v107)
            if not v107 then
                v106(v28());
                return ;
            else
                v106(v28(v107));
                return ;
            end;
        end, 
        onRobuxUpsell = function()
            v106(v29());
        end, 
        hideWindow = function()
            v106(v23());
        end, 
        completeRequest = function()
            v106(v24());
        end, 
        onAnalyticEvent = function(v108, v109)
            v106(v32(v108, v109));
        end
    };
end)(v41));
