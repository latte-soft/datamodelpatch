local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v8 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v10 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v14 = v10:FormatByKey("CoreScripts.Ads.Label.WhyThisAd");
local v15 = v10:FormatByKey("CoreScripts.Ads.Label.InExperienceDisclosureStatic");
local v16 = v10:FormatByKey("CoreScripts.Ads.Action.Close");
local v17 = v3.Component:extend("InteractiveAlert");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAdsEudsaDynamicDisclosure");
v17.init = function(v19)
    v19.state = {
        screenSize = Vector2.new(0, 0), 
        animating = false
    };
end;
v17.renderWithStyle = function(v20, _)
    local v22 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function()
                v20.props.handler:hidePrompt();
            end, 
            text = v16
        }, 
        isDefaultChild = true
    };
    local function _()
        if not l_game_EngineFeature_0 then
            return v15;
        else
            return v20.props.bodyText;
        end;
    end;
    return v3.createFragment({
        Frame = v3.createElement("Frame", {
            Selectable = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v3.Change.AbsoluteSize] = function(v24)
                v20:setState({
                    screenSize = v24.AbsoluteSize
                });
            end
        }, {
            InteractiveAlert = v3.createElement(l_InteractiveAlert_0, {
                screenSize = v20.state.screenSize, 
                title = v14, 
                bodyText = if not l_game_EngineFeature_0 then v15 else v20.props.bodyText, 
                buttonStackInfo = {
                    buttons = {
                        v22
                    }
                }
            })
        })
    });
end;
v17.render = function(v25)
    return v25:renderWithStyle(v25.props.style);
end;
local l_v17_0 = v17;
return function(v27)
    return v3.createElement(v7, {}, {
        FocusNavigationEffects = v3.createElement(v8, {
            selectionGroupName = "AdsEudsaPrompt", 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            WrappedEuDsaPrompt = v3.createElement(l_v17_0, (v5.Dictionary.join(v27, {
                style = l_useStyle_0()
            })))
        })
    });
end;
