local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_withStyle_0 = v6.Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local _ = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v14 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v17 = require(l_Modules_0.LuaApp.FitChildren);
local v18 = require(l_Modules_0.LuaApp.Components.Generic.BirthdayPicker);
local v19 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpLayout);
local v20 = require(l_Modules_0.LuaApp.Components.Authentication.AuthBackAndNextButton);
local v21 = require(l_Modules_0.LuaApp.Util.DateHelper);
local v22 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_Images_0 = v6.App.ImageSet.Images;
local v27 = require(l_Modules_0.LuaApp.Components.Authentication.MultiPageSignupText);
local v28 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
local v29 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBirthday);
local v30 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagMultiPageSignupDevOverride);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v33 = UDim2.new(0, 36, 0, 36);
local v34 = l_Images_0["icons/navigation/close"];
local v35 = Vector2.new(540, 1080);
local v36 = v2.PureComponent:extend("BirthdayPage");
v36.init = function(v37)
    v37.state = {
        month = 0, 
        day = 0, 
        year = 0, 
        continueButtonEnabled = false
    };
    v37.isMounted = false;
    v37.onContinueButtonActivated = function()
        local l_authAnalytics_0 = v37.props.authAnalytics;
        local l_setSignUpBirthday_0 = v37.props.setSignUpBirthday;
        local _ = v37.props.goToNextPage;
        local l_month_0 = v37.state.month;
        local l_day_0 = v37.state.day;
        local l_year_0 = v37.state.year;
        if v37.state.continueButtonEnabled then
            local v44 = v28.new({
                Month = l_month_0, 
                Day = l_day_0, 
                Year = l_year_0
            });
            l_authAnalytics_0.reportBirthdaySelection(v30.Context.BirthdayScreen);
            l_setSignUpBirthday_0(v44);
            l_authAnalytics_0.reportContinueButtonClicked(v30.Context.BirthdayScreen);
            l_authAnalytics_0.reportAuthButtonClick(v30.Context.BirthdayScreen, v30.Button.Continue, (tostring(l_year_0)));
            v37.props.navigateToSinglePageSignUp(v44);
        end;
    end;
    v37.onCloseButtonClicked = function()
        v37.props.authAnalytics.reportAuthButtonClick(v30.Context.BirthdayScreen, v30.Button.Close);
        v37.props.navigateBack();
    end;
    v37.updateBirthday = function(v45, v46, v47)
        local v48 = v21:isValidDate(v45, v46, v47);
        spawn(function()
            if v37.isMounted then
                v37:setState({
                    month = v45, 
                    day = v46, 
                    year = v47, 
                    continueButtonEnabled = v48
                });
            end;
        end);
    end;
    v37.renderCharacter = function()
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Character = v2.createElement("ImageLabel", {
                Size = UDim2.new(0.9, 0, 0.9, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/builderman.png", 
                ZIndex = 2
            }), 
            Shadow = v2.createElement("ImageLabel", {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/CharacterShadow.png", 
                Size = UDim2.new(1, 0, 0.25, 0), 
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 1
            })
        });
    end;
    v37.props.authAnalytics.reportScreenLoaded(v30.Context.BirthdayScreen);
end;
v36.didMount = function(v49)
    v49.isMounted = true;
    v49.props.authAnalytics.reportAuthPageload(v30.Context.BirthdayScreen);
end;
v36.willUnmount = function(v50)
    v50.isMounted = false;
end;
v36.render = function(v51)
    if not v31() and not v32() then
        return v2.createElement(v19, {
            titleTextKey = "Authentication.SignUp.Label.WhensYourBirthday", 
            renderWidget = function(v52)
                local l_formFactor_0 = v52.formFactor;
                local l_continueButtonEnabled_0 = v51.state.continueButtonEnabled;
                return l_withStyle_0(function(v55)
                    return v10({
                        continueText = "Authentication.SignUp.Label.Continue"
                    })(function(v56)
                        local v57 = 1;
                        if l_formFactor_0 == l_FormFactor_0.COMPACT then
                            v57 = v55.Theme.BackgroundDefault.Transparency;
                        end;
                        return v2.createElement(v17.FitImageLabel, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = v17.FitAxis.Height, 
                            BackgroundColor3 = v55.Theme.BackgroundDefault.Color, 
                            BackgroundTransparency = v57, 
                            BorderSizePixel = 0, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(9, 9, 9, 9), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonFill", 
                            ImageColor3 = v55.Theme.BackgroundDefault.Color, 
                            ImageTransparency = v55.Theme.BackgroundDefault.Transparency
                        }, {
                            ListLayout = v2.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Padding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 20), 
                                PaddingRight = UDim.new(0, 20), 
                                PaddingTop = UDim.new(0, 20), 
                                PaddingBottom = UDim.new(0, 20)
                            }), 
                            BirthdayPicker = v2.createElement(v18, {
                                layoutOrder = 1, 
                                updateBirthday = v51.updateBirthday
                            }), 
                            AuthBackAndNextButton = v2.createElement(v20, {
                                layoutOrder = 2, 
                                size = UDim2.new(1, 0, 0, 36), 
                                nextButtonText = v56.continueText, 
                                nextButtonIsDisabled = not l_continueButtonEnabled_0, 
                                nextButtonOnActivated = v51.onContinueButtonActivated
                            })
                        });
                    end);
                end);
            end, 
            renderCharacter = v51.renderCharacter, 
            widgetHeightIsDrivenByLayout = false, 
            showDisclaimerLinks = true
        });
    else
        return l_withStyle_0(function(v58)
            return v10({
                continueText = "Authentication.SignUp.Label.Continue", 
                signUpText = "Authentication.SignUp.Label.SignUp", 
                helpText = "Authentication.SignUp.Description.BirthdayHelp", 
                headerText = "Authentication.SignUp.Heading.WhatsYourBirthday"
            })(function(v59)
                return v2.createElement(v22, {
                    BackgroundTransparency = 1, 
                    includeStatusBar = true, 
                    renderFullscreenBackground = function()
                        return v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v58.Theme.BackgroundUIDefault.Color
                        });
                    end
                }, {
                    Container = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0.5, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v58.Theme.BackgroundUIDefault.Color, 
                        ClipsDescendants = true
                    }, {
                        SizeConstraint = v2.createElement("UISizeConstraint", {
                            MaxSize = v35
                        }), 
                        HeaderFrame = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 48), 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 1
                        }, {
                            CloseButton = v2.createElement(l_ImageSetButton_0, {
                                Size = v33, 
                                AutoButtonColor = false, 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(0, 12, 0.5, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                ScaleType = Enum.ScaleType.Fit, 
                                Image = v34, 
                                ImageColor3 = v58.Theme.UIEmphasis.Color, 
                                ImageTransparency = 0, 
                                [v2.Event.Activated] = v51.onCloseButtonClicked
                            }), 
                            Title = v2.createElement("TextLabel", {
                                Position = UDim2.new(0, 0, 0.5, 0), 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AnchorPoint = Vector2.new(0, 0.5), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                Text = v59.signUpText or "", 
                                TextWrapped = true, 
                                Font = v58.Font.CaptionHeader.Font, 
                                TextSize = v58.Font.BaseSize * v58.Font.Header1.RelativeSize, 
                                TextColor3 = v58.Theme.TextEmphasis.Color, 
                                TextTransparency = v58.Theme.TextEmphasis.Transparency, 
                                TextXAlignment = Enum.TextXAlignment.Center
                            })
                        }), 
                        Divider = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 1), 
                            Position = UDim2.new(0.5, 0, 0, 48), 
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v58.Theme.UIEmphasis.Color
                        }), 
                        ContentFrame = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, -49), 
                            Position = UDim2.new(0.5, 0, 0, 49), 
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(0.5, 0)
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 24), 
                                PaddingRight = UDim.new(0, 24), 
                                PaddingTop = UDim.new(0, 24)
                            }), 
                            ListLayout = v2.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                Padding = UDim.new(0, 8)
                            }), 
                            MultiPageSignupText = v2.createElement(v27, {
                                layoutOrder = 1, 
                                titleText = v59.headerText, 
                                helpText = v59.helpText
                            }), 
                            PickerFrame = v2.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2
                            }, {
                                BirthdayPadding = v2.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 20), 
                                    PaddingBottom = UDim.new(0, 20)
                                }), 
                                BirthdayPicker = v2.createElement(v18, {
                                    updateBirthday = v51.updateBirthday
                                })
                            }), 
                            ButtonPadding = v2.createElement("Frame", {
                                Size = UDim2.new(1, 0, 0, 10), 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3
                            }), 
                            ConfirmBirthdayButton = v2.createElement(l_Button_0, {
                                layoutOrder = 4, 
                                buttonType = l_ButtonType_0.PrimaryContextual, 
                                isDisabled = not v51.state.continueButtonEnabled, 
                                size = UDim2.new(1, 0, 0, 36), 
                                text = v59.continueText, 
                                onActivated = v51.onContinueButtonActivated
                            })
                        })
                    })
                });
            end);
        end);
    end;
end;
return (l_RoactServices_0.connect({
    authAnalytics = v4
})((v3.connect(nil, function(v60)
    return {
        setSignUpBirthday = function(v61)
            return v60(v29(v61));
        end, 
        goToNextPage = function()
            return v60(v13({
                name = v12.CharacterSelectionPage
            }));
        end, 
        navigateToSinglePageSignUp = function(v62)
            return v60(v15({
                name = v12.SinglePageSignUp, 
                extraProps = {
                    birthday = v62
                }
            }));
        end, 
        navigateBack = function()
            return v60(v14());
        end
    };
end)(v36))));
