local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_SpringAnimatedItem_0 = require(l_CorePackages_0.UIBlox).Utility.SpringAnimatedItem;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v7 = require(l_Modules_0.LuaApp.FitChildren);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v9 = require(l_Modules_0.LuaApp.Components.Generic.ItemListLayout);
local v10 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v11 = require(l_Modules_0.LuaApp.Components.Authentication.TitleAndParagraph);
local v12 = require(l_Modules_0.LuaApp.Components.Authentication.DisclaimerLinks);
local v13 = l_SpringAnimatedItem_0.wrap(v7.FitFrame);
local v14 = v3.PureComponent:extend("SignUpLayout");
v14.defaultProps = {
    widgetScaleWideMode = 0.3, 
    showDisclaimerLinks = false
};
v14.init = function(v15)
    v15.state = {
        containerSize = v15.props.screenSize, 
        mainContentsSize = Vector2.new(0, 250), 
        keyboardSize = Vector2.new(0, 0)
    };
    v15.isMounted = false;
    v15.onAbsoluteSizeChanged = function(v16)
        local l_AbsoluteSize_0 = v16.AbsoluteSize;
        if l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0 then
            spawn(function()
                if v15.isMounted then
                    v15:setState({
                        containerSize = l_AbsoluteSize_0
                    });
                end;
            end);
        end;
    end;
    v15.onMainContentsAbsoluteSizeChanged = function(v18)
        local l_AbsoluteSize_1 = v18.AbsoluteSize;
        local l_mainContentsSize_0 = v15.state.mainContentsSize;
        if (l_AbsoluteSize_1.X > 0 and l_AbsoluteSize_1.Y > 0) and l_mainContentsSize_0 ~= l_AbsoluteSize_1 then
            spawn(function()
                if v15.isMounted then
                    v15:setState({
                        mainContentsSize = l_AbsoluteSize_1
                    });
                end;
            end);
        end;
    end;
    v15.getSpringFrequency = function()
        return 1 / math.max(l_UserInputService_0.OnScreenKeyboardAnimationDuration, 0.1);
    end;
    v15.keyboardEvent = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardSize"):connect(function()
        spawn(function()
            if v15.isMounted then
                v15:setState({
                    keyboardSize = l_UserInputService_0.OnScreenKeyboardSize
                });
            end;
        end);
    end);
end;
v14.didMount = function(v21)
    v21.isMounted = true;
end;
v14.willUnmount = function(v22)
    v22.isMounted = false;
    if v22.keyboardEvent then
        v22.keyboardEvent:disconnect();
        v22.keyboardEvent = nil;
    end;
end;
v14.renderCharacter = function(v23)
    local l_renderCharacter_0 = v23.props.renderCharacter;
    local l_Y_0 = v23.state.keyboardSize.Y;
    if not l_renderCharacter_0 then
        return ;
    else
        local v26 = v23.props.formFactor == l_FormFactor_0.WIDE;
        local v27 = v23.getSpringFrequency();
        local v28 = 0.5;
        local v29 = 0.5;
        if l_Y_0 ~= 0 then
            v28 = 0;
            v29 = 0;
        end;
        local v30 = {
            SizeConstraint = not v26 and v3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(250, 250)
            }), 
            AspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1, 
                AspectType = Enum.AspectType.FitWithinMaxSize
            }), 
            Character = l_renderCharacter_0()
        };
        if not v26 then
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.9, 0, 0.9, 0), 
                Position = UDim2.new(0.5, 0, 0, v23.state.mainContentsSize.Y), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, v30);
        else
            return v3.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                regularProps = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0.5, 0, 0.6, 0), 
                    [v3.Children] = v30
                }, 
                animatedValues = {
                    avatarPositionYScale = v28, 
                    avatarAnchorPointY = v29
                }, 
                mapValuesToProps = function(v31)
                    return {
                        Position = UDim2.new(0.525, 0, v31.avatarPositionYScale, 0), 
                        AnchorPoint = Vector2.new(0, v31.avatarAnchorPointY)
                    };
                end, 
                springOptions = {
                    frequency = v27
                }
            });
        end;
    end;
end;
v14.render = function(v32)
    local l_titleTextKey_0 = v32.props.titleTextKey;
    local l_paragraphTextKeys_0 = v32.props.paragraphTextKeys;
    local l_renderWidget_0 = v32.props.renderWidget;
    local l_formFactor_0 = v32.props.formFactor;
    local l_showDisclaimerLinks_0 = v32.props.showDisclaimerLinks;
    local l_widgetScaleWideMode_0 = v32.props.widgetScaleWideMode;
    local l_disablePageInteraction_0 = v32.props.disablePageInteraction;
    local v40 = l_formFactor_0 == l_FormFactor_0.WIDE;
    local l_containerSize_0 = v32.state.containerSize;
    local l_Y_1 = v32.state.keyboardSize.Y;
    local l_Y_2 = v32.state.mainContentsSize.Y;
    local v44 = v32.getSpringFrequency();
    local v45 = UDim2.new(0.525, 0, 0.5, 0);
    local v46 = Vector2.new(1, 0.5);
    local v47 = 400;
    if l_containerSize_0.X < 761.9047619047619 then
        v45 = UDim2.new(0, 0, 0.5, 0);
        v46 = Vector2.new(0, 0.5);
        v47 = l_containerSize_0.X * 0.525;
    end;
    if not v40 then
        v47 = l_containerSize_0.X - 40;
    end;
    if not (not v40 or not l_UserInputService_0.OnScreenKeyboardVisible) then
        v45 = UDim2.new(v45.X.Scale, 0, 0, 0);
        v46 = Vector2.new(v46.X, 0);
    end;
    local v48 = 190;
    local v49 = nil;
    if not v40 then
        v49 = 5;
    else
        v48 = math.max(l_containerSize_0.Y * l_widgetScaleWideMode_0, 190);
        v49 = 12;
    end;
    local function v50()
        return v3.createElement(v7.FitFrame, {
            Size = UDim2.new(1, 0, 0, 0), 
            fitAxis = v7.FitAxis.Height, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v3.Change.AbsoluteSize] = v32.onMainContentsAbsoluteSizeChanged
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = not v40 and v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20)
            }), 
            v3.createElement(v7.FitFrame, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v7.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v49)
                }), 
                TitleAndParagraph = v3.createElement(v11, {
                    layoutOrder = 2, 
                    titleTextKey = l_titleTextKey_0, 
                    paragraphTextKeys = l_paragraphTextKeys_0, 
                    width = v47
                })
            }), 
            DisclaimerLinks = l_showDisclaimerLinks_0 and v3.createElement(v12, {
                LayoutOrder = 3
            })
        });
    end;
    local _ = nil;
    return v3.createElement(v10, {
        BackgroundTransparency = 1, 
        includeStatusBar = true, 
        renderFullscreenBackground = function()
            return v3.createElement("ImageLabel", {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/gradient_bg.jpg", 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BorderSizePixel = 0
            });
        end
    }, {
        UserInputSink = l_disablePageInteraction_0 and v3.createElement("ImageButton", {
            ZIndex = 3, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = ""
        }), 
        ContentFrame = v3.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                [v3.Change.AbsoluteSize] = v32.onAbsoluteSizeChanged, 
                [v3.Children] = if not v40 then {
                    MinHeight = v3.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 190 + l_Y_2)
                    }), 
                    MainContents = v3.createElement(v50), 
                    WidgetWrapper = v3.createElement(v7.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v7.FitAxis.Height, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 1, 0), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        ZIndex = 2
                    }, {
                        Widget = l_renderWidget_0 and l_renderWidget_0({
                            formFactor = l_formFactor_0, 
                            widgetHeight = v48
                        })
                    })
                } else {
                    Container = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, -20), 
                        AnchorPoint = Vector2.new(0.5, 0)
                    }, {
                        TopPaddingFrame = v3.createElement(v13, {
                            regularProps = {
                                Size = UDim2.new(0.525, 0, 1, 0), 
                                BorderSizePixel = 0, 
                                BackgroundTransparency = 1, 
                                fitAxis = v7.FitAxis.Height, 
                                [v3.Children] = {
                                    SizeConstraint = v3.createElement("UISizeConstraint", {
                                        MaxSize = Vector2.new(400, math.huge)
                                    }), 
                                    Content = v3.createElement(v9, {
                                        size = UDim2.new(1, 0, 0, 0), 
                                        fitAxis = v7.FitAxis.Height, 
                                        Padding = UDim.new(0, 12), 
                                        renderItemList = {
                                            v3.createElement(v50), 
                                            v3.createElement(v7.FitFrame, {
                                                Size = UDim2.new(1, 0, 0, 0), 
                                                fitAxis = v7.FitAxis.Height, 
                                                BorderSizePixel = 0, 
                                                BackgroundTransparency = 1
                                            }, {
                                                Widget = l_renderWidget_0 and l_renderWidget_0({
                                                    formFactor = l_formFactor_0, 
                                                    widgetHeight = v48
                                                })
                                            })
                                        }
                                    })
                                }
                            }, 
                            animatedValues = {
                                contentPositionYScale = v45.Y.Scale, 
                                contentAnchorPointY = v46.Y
                            }, 
                            mapValuesToProps = function(v52)
                                return {
                                    Position = UDim2.new(v45.X.Scale, v45.X.Offset, v52.contentPositionYScale, 0), 
                                    AnchorPoint = Vector2.new(v46.X, v52.contentAnchorPointY)
                                };
                            end, 
                            springOptions = {
                                frequency = v44
                            }
                        })
                    })
                }
            }, 
            animatedValues = {
                keyboardSizeY = l_Y_1
            }, 
            mapValuesToProps = function(v53)
                return {
                    Size = UDim2.new(1, 0, 1, -v53.keyboardSizeY)
                };
            end, 
            springOptions = {
                frequency = v44
            }
        }), 
        Character = v32:renderCharacter()
    });
end;
return (v4.connect(function(v54, _)
    return {
        formFactor = v54.FormFactor, 
        screenSize = v54.ScreenSize
    };
end, function(v56)
    return {
        navigateBack = function()
            return v56(v8());
        end
    };
end)(v14));
