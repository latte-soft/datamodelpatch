local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v8 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.getCurrentPage);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v15 = require(l_CorePackages_0.UIBlox);
local l_PartialPageModal_0 = v15.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v15.App.Text.StyledTextLabel;
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local l_withStyle_0 = v15.Core.Style.withStyle;
local v20 = v3.PureComponent:extend("AgeVerificationModal");
v20.validateProps = v2.strictInterface({
    universeId = v2.string, 
    pageName = v2.string, 
    screenSize = v2.Vector2, 
    navigateDown = v2.callback, 
    navigateBack = v2.callback, 
    dispatchFetchGameDetailsPageData = v2.callback, 
    eventIngest = v2.table, 
    networking = v2.callback
});
v20.init = function(v21)
    v21.isMounted = false;
    v21.trackDeeplinkClick = function(v22, v23)
        v21.props.eventIngest:setRBXEventStream(v22, "ageVerificationUpsellClick", {
            universeId = v23
        });
    end;
end;
v20.didMount = function(v24)
    v24.isMounted = true;
end;
v20.willUnmount = function(v25)
    v25.props.dispatchFetchGameDetailsPageData(v25.props.networking, v25.props.universeId);
    v25.isMounted = false;
end;
v20.render = function(v26)
    return l_withStyle_0(function(v27)
        return l_withLocalization_0({
            title = "Feature.AgeVerificationUpsell.Modal.Title", 
            message = "Feature.AgeVerificationUpsell.Modal.ContentText", 
            buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel", 
            buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
        })(function(v28)
            return v3.createElement("ImageButton", {
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageTransparency = 1, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Overlay = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Content = v3.createElement(l_PartialPageModal_0, {
                        title = v28.title, 
                        screenSize = v26.props.screenSize, 
                        buttonStackProps = {
                            forcedFillDirection = Enum.FillDirection.Horizontal, 
                            buttonHeight = 48, 
                            buttons = {
                                {
                                    buttonType = l_ButtonType_0.Secondary, 
                                    props = {
                                        isDisabled = false, 
                                        onActivated = v26.props.navigateBack, 
                                        text = v28.buttonCancel
                                    }
                                }, 
                                {
                                    buttonType = l_ButtonType_0.PrimarySystem, 
                                    props = {
                                        isDisabled = false, 
                                        onActivated = function()
                                            if v26.isMounted then
                                                v26.trackDeeplinkClick(v26.props.pageName, v26.props.universeId);
                                                v26.props.navigateDown({
                                                    name = v9.GenericWebPage, 
                                                    detail = v8.static.settings.account(), 
                                                    extraProps = {
                                                        title = v28.buttonSettings
                                                    }
                                                });
                                            end;
                                        end, 
                                        text = v28.buttonSettings
                                    }
                                }
                            }
                        }
                    }, {
                        ViewFrame = v3.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        }, {
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 24), 
                                PaddingBottom = UDim.new(0, 24)
                            }), 
                            Text = v3.createElement(l_StyledTextLabel_0, {
                                fontStyle = v27.Font.Body, 
                                colorStyle = v27.Theme.TextEmphasis, 
                                size = UDim2.new(1, 0, 0, 0), 
                                fluidSizing = false, 
                                textXAlignment = Enum.TextXAlignment.Left, 
                                textYAlignment = Enum.TextYAlignment.Center, 
                                automaticSize = Enum.AutomaticSize.Y, 
                                text = v28.message
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return (v4.connect(function(v29, _)
    return {
        screenSize = v29.ScreenSize, 
        pageName = v10(v29)
    };
end, function(v31)
    return {
        navigateDown = function(v32)
            return v31(v5(v32));
        end, 
        navigateBack = function()
            return v31(v6());
        end, 
        dispatchFetchGameDetailsPageData = function(v33, v34)
            return v31(v7(v33, v34));
        end
    };
end)((l_RoactServices_0.connect({
    eventIngest = v13, 
    networking = v14
})(v20))));
