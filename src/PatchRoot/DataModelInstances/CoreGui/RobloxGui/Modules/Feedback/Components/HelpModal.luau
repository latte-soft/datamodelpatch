local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local v5 = require(l_Parent_0.Components.ModalDialog);
local v6 = require(l_Parent_0.Thunks.ShowHelpModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = game:DefineFastFlag("EnableFeedbackModeModalTextFixes", false);
local v9 = v1.PureComponent:extend("HelpModal");
v9.init = function(v10)
    v10.onDismiss = function()
        v10.props.showHelpModal(false);
    end;
end;
v9.render = function(v11)
    if not v8 then
        return l_withLocalization_0({
            mainHeader = "CoreScripts.Feedback.Help.MainHeader", 
            instructionLabelA = "CoreScripts.Feedback.Help.Instructions1", 
            instructionLabelB = "CoreScripts.Feedback.Help.Instructions2"
        })(function(v12)
            return v1.createElement(v5, {
                visible = v11.props.visible, 
                screenSize = v11.props.screenSize, 
                titleText = v12.mainHeader, 
                maxHeight = 350, 
                maxWidth = 540, 
                contents = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    Layout = v1.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    InstructionLabelA = v1.createElement(v4, {
                        LayoutOrder = 1, 
                        fontKey = "Body", 
                        themeKey = "TextDefault", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 76, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0.4, 36), 
                        Text = v12.instructionLabelA, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    InstructionLabelB = v1.createElement(v4, {
                        LayoutOrder = 1, 
                        fontKey = "Body", 
                        themeKey = "TextDefault", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 76, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0.4, 36), 
                        Text = v12.instructionLabelB, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                onDismiss = v11.onDismiss
            });
        end);
    else
        return l_withLocalization_0({
            mainHeader = "CoreScripts.Feedback.Help.MainHeader", 
            instructionLabel = "CoreScripts.Feedback.Help.Instructions"
        })(function(v13)
            return v1.createElement(v5, {
                visible = v11.props.visible, 
                screenSize = v11.props.screenSize, 
                titleText = v13.mainHeader, 
                maxHeight = 130, 
                maxWidth = 540, 
                showCloseButton = true, 
                contents = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    Layout = v1.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    InstructionLabel = v1.createElement(v4, {
                        LayoutOrder = 1, 
                        fontKey = "Body", 
                        themeKey = "TextDefault", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 76, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0.4, 36), 
                        Text = v13.instructionLabel, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                onDismiss = v11.onDismiss
            });
        end);
    end;
end;
return v2.connect(function(v14)
    return {
        screenSize = v14.displayOptions.screenSize, 
        visible = v14.common.showHelpModal
    };
end, function(v15)
    return {
        showHelpModal = function(v16)
            v15(v6(v16));
        end
    };
end)(v9);
