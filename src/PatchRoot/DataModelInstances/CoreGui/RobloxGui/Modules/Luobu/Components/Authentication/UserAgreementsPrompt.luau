local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v11.Style.withStyle;
local l_InteractiveAlert_0 = v11.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v11.App.Button.LinkButton;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local v18 = require(l_Modules_0.Luobu.Actions.SetAgreedUserAgreements);
local v19 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v20 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v21 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v23 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v24 = v3.PureComponent:extend("UserAgreementsPrompt");
v24.validateProps = v9.strictInterface({
    agreements = v9.array(v9.strictInterface({
        id = v9.string, 
        agreementType = v9.string, 
        clientType = v9.string, 
        displayUrl = v9.string, 
        regulationType = v9.string
    })), 
    context = v9.optional(v9.string), 
    screenSize = v9.Vector2, 
    closePrompt = v9.callback, 
    setAgreedUserAgreements = v9.callback, 
    navigateDown = v9.callback, 
    showSecondPrompt = v9.callback, 
    shouldShowCameraPermissionInAgreementsPrompt = v9.boolean, 
    guiService = v9.table
});
v24.init = function(v25)
    v25.getLocalizationKeys = function()
        local v26 = {
            title = "Luobu.Authentication.UserAgreementsPrompt.Title", 
            bodyTextPart1 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part1", 
            bodyTextPart2 = "Luobu.Authentication.UserAgreementsPrompt.BodyText.Part2", 
            permissionDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Description", 
            permissionStorageTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Title", 
            permissionStorageDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Storage.Description", 
            permissionNetworkTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Title", 
            permissionNetworkDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Network.Description", 
            permissionCameraTitle = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Title", 
            permissionCameraDesc = "Luobu.Authentication.UserAgreementsPrompt.Permissions.Camera.Description", 
            consentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Consent", 
            dissentButton = "Luobu.Authentication.UserAgreementsPrompt.Button.Dissent"
        };
        for _, v28 in pairs(v25.props.agreements) do
            v26[v28.agreementType] = "Luobu.Authentication.Login.Label.Agreement." .. v28.agreementType;
        end;
        return v26;
    end;
    v25.onConsent = function()
        local l_closePrompt_0 = v25.props.closePrompt;
        local l_agreements_0 = v25.props.agreements;
        local l_setAgreedUserAgreements_0 = v25.props.setAgreedUserAgreements;
        local v32 = {};
        for _, v34 in ipairs(l_agreements_0) do
            table.insert(v32, v34.id);
        end;
        l_setAgreedUserAgreements_0(v32);
        l_AppStorageService_0:SetItem("HasAgreedRequiredPermissions", (tostring(true)));
        l_closePrompt_0();
    end;
    v25.onDissent = function(v35)
        if v25.props.context == v19.UserAgreementsSecondPrompt then
            v25.props.guiService:BroadcastNotification("", v23.NATIVE_EXIT);
            return ;
        else
            v25.props.showSecondPrompt(v25.props.agreements, v35);
            return ;
        end;
    end;
    v25.renderAgreementsListItems = function(v36)
        local l_agreements_1 = v25.props.agreements;
        local l_navigateDown_0 = v25.props.navigateDown;
        local v39 = {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v40 = 1;
        for _, v42 in ipairs(l_agreements_1) do
            local v43 = v36[v42.agreementType] or v42.displayUrl;
            v39[v42.agreementType] = v3.createElement("Frame", {
                LayoutOrder = v40, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                v3.createElement(l_LinkButton_0, {
                    text = "\226\128\162 " .. v43, 
                    fontStyle = "CaptionHeader", 
                    minPaddingY = 5, 
                    onActivated = function()
                        l_navigateDown_0({
                            name = v10.GenericWebPage, 
                            detail = v42.displayUrl, 
                            extraProps = {
                                title = v43
                            }
                        });
                    end
                })
            });
            v40 = v40 + 1;
        end;
        return v39;
    end;
    v25.renderMiddleContent = function(v44, v45, v46)
        local v47 = l_AppStorageService_0:GetItem("HasAgreedRequiredPermissions") ~= tostring(true);
        local l_shouldShowCameraPermissionInAgreementsPrompt_0 = v25.props.shouldShowCameraPermissionInAgreementsPrompt;
        local l_Theme_0 = v45.Theme;
        local l_Font_0 = v45.Font;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Agreements = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Prefix = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    PrefixText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v44.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                AgreementsList = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.XY
                }, v46), 
                Suffix = v3.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12)
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12)
                    }), 
                    PrefixText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v44.bodyTextPart2, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    })
                })
            }), 
            Permissions = v47 and v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Description = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 12), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    DescriptionText = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = v44.bodyTextPart1, 
                        Font = l_Font_0.CaptionHeader.Font, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextWrapped = true
                    }), 
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    })
                }), 
                Permissions = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    StoragePermission = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/memory"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionStorageTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionStorageDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, 12)
                            })
                        })
                    }), 
                    NetworkPermission = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/mobile"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionNetworkTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionNetworkDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            Padding = l_shouldShowCameraPermissionInAgreementsPrompt_0 and v3.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, 12)
                            })
                        })
                    }), 
                    CameraPermission = l_shouldShowCameraPermissionInAgreementsPrompt_0 and v3.createElement("Frame", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/menu/mobile"], 
                            Size = UDim2.new(0, 30, 0, 30), 
                            ScaleType = Enum.ScaleType.Stretch
                        }), 
                        Content = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -30, 0, 36)
                        }, {
                            Layout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Title = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 12), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionCameraTitle, 
                                Font = l_Font_0.CaptionHeader.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            }), 
                            DescriptionText = v3.createElement("TextLabel", {
                                Size = UDim2.new(1, 0, 0, 24), 
                                BackgroundTransparency = 1, 
                                Text = v44.permissionCameraDesc, 
                                Font = l_Font_0.CaptionBody.Font, 
                                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Center, 
                                TextWrapped = true
                            })
                        })
                    })
                })
            })
        });
    end;
end;
v24.render = function(v51)
    local l_screenSize_0 = v51.props.screenSize;
    return l_withStyle_0(function(v53)
        return v8(v51.getLocalizationKeys())(function(v54)
            local v55 = v51.renderAgreementsListItems(v54);
            return v3.createElement(l_InteractiveAlert_0, {
                title = v54.title, 
                middleContent = function()
                    return v51.renderMiddleContent(v54, v53, v55);
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                onActivated = function()
                                    v51.onDissent(v55);
                                end, 
                                text = v54.dissentButton
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v51.onConsent, 
                                text = v54.consentButton
                            }
                        }
                    }
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = l_screenSize_0
            });
        end);
    end);
end;
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0
})((l_RoactAppPolicy_0.connect(function(v56, _)
    return {
        shouldShowCameraPermissionInAgreementsPrompt = v56.getShouldShowCameraPermissionInAgreementsPrompt()
    };
end)((v4.connect(function(v58)
    return {
        screenSize = v58.ScreenSize
    };
end, function(v59)
    return {
        closePrompt = function()
            v59(v21());
        end, 
        setAgreedUserAgreements = function(v60)
            return v59(v18(v60));
        end, 
        navigateDown = function(v61)
            v59(v22(v61));
        end, 
        showSecondPrompt = function(v62, v63)
            v59(v20(v19.UserAgreementsSecondPrompt, {
                agreements = v62, 
                agreementsListItems = v63
            }));
        end
    };
end)(v24)))));
