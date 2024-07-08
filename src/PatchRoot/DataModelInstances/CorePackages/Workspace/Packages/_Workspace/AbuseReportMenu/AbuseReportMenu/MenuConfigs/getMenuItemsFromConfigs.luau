local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Components.MenuItems.DropdownReportMenuItem);
local v5 = require(l_script_FirstAncestor_0.Components.MenuItems.ButtonReportMenuItem);
local v6 = require(l_script_FirstAncestor_0.Components.MenuItems.FreeCommentsMenuItem);
local v7 = require(l_script_FirstAncestor_0.Components.MenuItems.ModalBasedSelectorMenuItem);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
return function(v12, v13, v14, v15)
    local v16 = {};
    for v17, v18 in v15, nil, nil do
        if v18.getIsVisible(v12) then
            local l_componentType_0 = v18.componentType;
            local l_componentName_0 = v18.componentName;
            if not (l_componentType_0 == "generic") then
                if l_componentType_0 == "freeComments" then
                    v16[l_componentName_0] = v2.createElement(v6, {
                        layoutOrder = v17, 
                        comment = v12.comment, 
                        menuContainerWidth = v14.menuWidth, 
                        onUpdate = function(v21)
                            v18.onUpdate(v21, v12, v13, v14);
                        end
                    });
                elseif l_componentType_0 == "button" then
                    local v22 = v18.getIconSrc(v14);
                    v16[l_componentName_0] = v2.createElement(v5, {
                        label = v18.fieldLabel, 
                        button = v2.createElement(l_Button_0, {
                            buttonType = if v18.variant == "primary" then l_ButtonType_0.PrimarySystem else l_ButtonType_0.Secondary, 
                            text = v18.getButtonLabel(v14), 
                            size = UDim2.new(1, 0, 0, 36), 
                            icon = if v22 ~= "" then l_Images_0[v22] else nil, 
                            isDisabled = if v18.getIsDisabled ~= nil then v18.getIsDisabled(v12, v14) else false, 
                            onActivated = function()
                                v18.onClick(v12, v13, v14);
                            end
                        }), 
                        menuContainerWidth = v14.menuWidth, 
                        layoutOrder = v17
                    });
                elseif l_componentType_0 == "dropdown" then
                    v16[l_componentName_0] = v2.createElement(v4, {
                        label = v18.fieldLabel, 
                        layoutOrder = v17, 
                        onSelect = function(v23)
                            v18.onUpdateSelectedOption(v23, v12, v13, v14);
                        end, 
                        menuContainerWidth = v14.menuWidth, 
                        readonlyValue = v18.readonlyValue, 
                        selections = v18.getMenuItems(v12)
                    });
                elseif l_componentType_0 == "modalSelector" then
                    v16[l_componentName_0] = v2.createElement(v7, {
                        label = v18.fieldLabel, 
                        layoutOrder = v17, 
                        onSelect = function(v24, v25, v26)
                            v18.onUpdateSelectedOption({
                                label = v24, 
                                subLabel = v25, 
                                identifier = v26
                            }, v12, v13, v14);
                        end, 
                        menuContainerWidth = v14.menuWidth, 
                        selectedValue = if not v18.getSelectedValue then nil else v18.getSelectedValue(v12) or nil, 
                        selections = v18.getMenuItems(v12), 
                        viewportHeight = v14.viewportDimension.height, 
                        viewportWidth = v14.viewportDimension.width
                    });
                end;
            end;
        end;
    end;
    return v16;
end;
