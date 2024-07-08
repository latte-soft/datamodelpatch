local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.React);
local l_ScrollingListTable_0 = v5.App.Table.ScrollingListTable;
local l_CellHeadDetail_0 = v5.App.Table.CellHeadDetail;
local l_Cell_0 = v5.App.Table.Cell;
local l_CellTailDescription_0 = v5.App.Table.CellTailDescription;
local l_ModalWindow_0 = v5.App.Dialog.Modal.ModalWindow;
local v12 = require(l_Parent_0.Dash);
local v13 = require(l_Parent_0.Cryo);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local v18 = require(l_RobloxGui_0.Modules.Common.CoreScriptsRootProvider);
local v19 = require(l_RobloxGui_0.Modules.Common.FocusNavigationEffectsWrapper);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagModalSelectorCloseButton);
local function v31(v22)
    local v23 = l_useStyle_0();
    local l_Theme_0 = v23.Theme;
    local v25 = math.min(#v22.cellData * 40, (v22.viewportHeight - 80) - 24);
    local v26 = v25 + 24;
    local v27 = 0;
    local v28 = 0;
    local v29 = {
        Paddings = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        })
    };
    if v21() then
        v26 = (v25 + 48) + 40;
        v27 = 12;
        v28 = -36;
        v29 = v13.Dictionary.join(v29, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = 0
            }), 
            Header = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                CloseButton = v6.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function()
                        v22.onClose();
                    end
                })
            }), 
            Divider = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v23.Theme.Divider.Transparency, 
                BackgroundColor3 = v23.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            })
        });
    end;
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        Overlay = if not v22.isShown then nil else v6.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Text = "", 
            [v6.Event.Activated] = function()
                v22.onClose();
            end
        }, {
            Modal = v6.createElement(l_ModalWindow_0, {
                isFullHeight = false, 
                screenSize = Vector2.new(v22.viewportWidth, v22.viewportHeight)
            }, {
                ModalContent = v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v26), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 20)
                }, (v13.Dictionary.join(v29, {
                    SelectorFrame = v6.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, v28), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3
                    }, {
                        Paddings = v6.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, v27)
                        }), 
                        ModalSelector = v6.createElement(l_ScrollingListTable_0, {
                            selectable = false, 
                            size = UDim2.new(1, 0, 1, 0), 
                            cells = v12.map(v22.cellData, function(v30)
                                return v6.createElement(l_Cell_0, {
                                    head = v6.createElement(l_CellHeadDetail_0, {
                                        labelText = v30.label, 
                                        subLabelText = v30.subLabel
                                    }), 
                                    tail = v6.createElement(l_CellTailDescription_0, {
                                        text = "", 
                                        showArrow = false
                                    }), 
                                    background = v6.createElement("Frame", {
                                        BackgroundTransparency = 1, 
                                        Size = UDim2.fromScale(1, 1)
                                    }), 
                                    size = UDim2.new(1, 0, 0, 40), 
                                    userInteractionEnabled = true, 
                                    onActivated = function()
                                        v22.onSelect(v30.label, v30.subLabel, v30.identifier);
                                        v22.onClose();
                                    end
                                });
                            end)
                        })
                    })
                })))
            })
        })
    });
end;
DialogWrapper = function(v32)
    return v6.createElement(v18, {}, {
        FocusNavigationEffects = v6.createElement(v19, {
            selectionGroupName = v4.ModalBaseSelectorDialogRootName, 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            DialogContainer = v6.createElement(v31, v32)
        })
    });
end;
return DialogWrapper;
