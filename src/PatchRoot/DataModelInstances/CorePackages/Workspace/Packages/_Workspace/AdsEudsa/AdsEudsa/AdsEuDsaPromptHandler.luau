local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(script.Parent.AdsEuDsaPromptUI);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAdsEudsaDynamicDisclosure");
local l_GetFFlagFixMouseForAdsEuDsaModal_0 = require(script.Parent.Flags).GetFFlagFixMouseForAdsEuDsaModal;
local _ = nil;
local v11 = nil;
if l_game_EngineFeature_0 then
    v11 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
end;
local function v14(v12, v13)
    if v12 ~= "" and v13 == "" then
        return v11:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamic", {
            AdvertiserName = v12
        });
    elseif v12 ~= "" and v13 ~= "" then
        return v11:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureDynamicWithPayer", {
            AdvertiserName = v12, 
            PayerName = v13
        });
    else
        return v11:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic");
    end;
end;
local v15 = v5.PureComponent:extend("AdsEuDsaPromptHandler");
v15.init = function(v16)
    v16:setState({
        enabled = false
    });
    v16.animating = false;
    v16.canvasGroupRef = v5.createRef();
    v16.savedSelectedCoreObject = nil;
    if not l_game_EngineFeature_0 then
        l_AdService_0.ShowStaticEudsaDisclosure:Connect(function()
            v16:showPrompt();
        end);
        return ;
    else
        v16:setState({
            bodyText = ""
        });
        l_AdService_0.ShowDynamicEudsaDisclosure:Connect(function(v17, v18)
            v16:setState({
                bodyText = v14(v17, v18)
            });
            v16:showPrompt();
        end);
        return ;
    end;
end;
v15.saveSelectedObject = function(v19)
    v19.savedSelectedCoreObject = l_GuiService_0.SelectedCoreObject;
    l_GuiService_0.SelectedCoreObject = nil;
end;
v15.restoreSelectedObject = function(v20)
    if not (v20.savedSelectedCoreObject ~= nil and not v20.savedSelectedCoreObject:IsDescendantOf(l_CoreGui_0)) then
        l_GuiService_0.SelectedCoreObject = v20.savedSelectedCoreObject;
    end;
end;
v15.showPrompt = function(v21)
    if not v21.animating and v21.canvasGroupRef.current then
        v21:saveSelectedObject();
        v21:setState({
            enabled = true
        });
        v21.animating = true;
        local v22 = l_TweenService_0:Create(v21.canvasGroupRef.current, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            GroupTransparency = 0
        });
        v22:Play();
        v22.Completed:Connect(function()
            v21.animating = false;
        end);
        return ;
    else
        return ;
    end;
end;
v15.hidePrompt = function(v23)
    if not v23.animating and v23.canvasGroupRef.current then
        v23.animating = true;
        local v24 = l_TweenService_0:Create(v23.canvasGroupRef.current, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            GroupTransparency = 1
        });
        v24:Play();
        v24.Completed:Connect(function()
            v23.animating = false;
            v23:setState({
                enabled = false
            });
            l_AdService_0:HideEudsaDisclosure();
            v23:restoreSelectedObject();
        end);
        return ;
    else
        return ;
    end;
end;
v15.render = function(v25)
    local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
    local l_Constants_0 = v6.App.Style.Constants;
    local v28 = {
        Dark = {
            themeName = l_Constants_0.ThemeName.Dark, 
            fontName = l_Constants_0.FontName.Gotham
        }
    };
    local _ = nil;
    return (v5.createElement("ScreenGui", {
        ResetOnSpawn = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AutoLocalize = false, 
        Enabled = v25.state.enabled
    }, v5.createElement(l_AppStyleProvider_0, {
        style = v28.Dark
    }, {
        CanvasGroup = v5.createElement("CanvasGroup", {
            [v5.Ref] = v25.canvasGroupRef, 
            Selectable = false, 
            GroupTransparency = 1, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Prompt = if not l_game_EngineFeature_0 then v5.createElement(v7, {
                handler = v25
            }) else v5.createElement(v7, {
                handler = v25, 
                bodyText = v25.state.bodyText
            }), 
            ModalFix = l_GetFFlagFixMouseForAdsEuDsaModal_0() and v5.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                Modal = true, 
                Size = UDim2.new(0, 0, 0, 0)
            })
        })
    })));
end;
return v15;
