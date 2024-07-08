local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.EquipOutfitConfirmation);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.CreateOrUpdateOutfitMenu);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.LeaveCatalogToAvatarPrompt);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.InsufficientRobuxPrompt);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PremiumSellOnlyPrompt);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePrompt);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.SellItemPrompt);
local v11 = require(l_Modules_0.LuaApp.Components.More.TwoStepRequiredContainer);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.RemoveCurrentlySellingItemPrompt);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.RemoveItemPrompt);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.ResetLCSortPrompt);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ResetToNewCharacterPrompt);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.OutfitIncompletePrompt);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseLookPrompt);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseOutfitPrompt);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.CatalogContextFrame);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame);
local v21 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.LCSortContextFrame);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceQuickMenu);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionContextualMenu);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.CatalogReport);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.SaveOutfitPrompt);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.RenameOutfitPrompt);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DeleteOutfitPrompt);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitNamePrompt);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitInfoPrompt);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.Prompts.R15UpgradePrompt);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.LayeredClothingR6SwitchPrompt);
local v32 = require(l_Modules_0.LuaApp.Components.AbuseReporting.CatalogReportContainer);
local v33 = require(l_Modules_0.LuaApp.Components.PremiumUpsell.PremiumUpsellContainer);
local v34 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
local v35 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.CollectiblesInfoPrompt);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ResaleFeePolicyPrompt);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.GenericPrompt);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemToExperienceModal);
local v39 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.OpenExperienceTraversalPrompt);
local v40 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorRevertToDefaultPrompt);
local v41 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v42 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesInfoPrompt);
local l_GetFFlagLuafiedReportEntryPoints_0 = v3.GetFFlagLuafiedReportEntryPoints;
local v44 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
local v45 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRevertPpeCustomizationFlow);
local v46 = {
    {
        [v41.PremiumUpsellPrompt] = v33
    }, 
    {
        [v41.CatalogReport] = v24
    }, 
    {
        [v41.SaveOutfitPrompt] = v25
    }, 
    {
        [v41.RenameOutfitPrompt] = v26
    }, 
    {
        [v41.DeleteOutfitPrompt] = v27
    }, 
    {
        [v41.DuplicateOutfitNamePrompt] = v28
    }, 
    {
        [v41.DuplicateOutfitInfoPrompt] = v29
    }, 
    {
        [v41.LayeredClothingR6SwitchPrompt] = v31
    }, 
    {
        [v41.EquipOutfitConfirmation] = v4
    }, 
    {
        [v41.LeaveCatalogToAvatarPrompt] = v6
    }, 
    {
        [v41.InsufficientRobuxPrompt] = v7
    }, 
    {
        [v41.RobuxUpsellPrompt] = v34
    }, 
    {
        [v41.TwoStepRequiredPrompt] = v11
    }, 
    {
        [v41.PremiumSellOnlyPrompt] = v8
    }, 
    {
        [v41.SellItemPrompt] = v10
    }, 
    {
        [v41.RemoveCurrentlySellingItemPrompt] = v12
    }, 
    {
        [v41.RemoveItemPrompt] = v13
    }, 
    {
        [v41.ResetLCSortPrompt] = v14
    }, 
    {
        [v41.ResetToNewCharacterPrompt] = v15
    }, 
    {
        [v41.OutfitIncompletePrompt] = v16
    }, 
    {
        [v41.PurchaseOutfitPrompt] = v18
    }, 
    {
        [v41.PurchaseCatalogItem] = v9
    }, 
    {
        [v41.CreateOrUpdateOutfitMenu] = v5
    }, 
    {
        [v41.AvatarExperienceQuickMenu] = v22
    }, 
    {
        [v41.CatalogContextMenu] = {
            screen = v19, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [v41.LCSortContextMenu] = {
            screen = v21, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [v41.AXTransitionContextualMenu] = {
            screen = v23, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [v41.R15UpgradePrompt] = v30
    }
};
if v44() then
    table.insert(v46, {
        [v41.ItemExperiencesMenu] = v38
    });
end;
if v42() then
    table.insert(v46, {
        [v41.CollectiblesInfoPrompt] = v35
    });
end;
if l_GetFFlagLuafiedReportEntryPoints_0() then
    table.insert(v46, {
        [v41.ReportDialog] = v32
    });
end;
table.insert(v46, {
    [v41.ResaleFeePolicyPrompt] = v36
});
table.insert(v46, {
    [v41.GenericPrompt] = v37
});
table.insert(v46, {
    [v41.ContextMenu] = {
        screen = v20, 
        navigationOptions = {
            overlayTransparency = 1
        }
    }
});
table.insert(v46, {
    [v41.PurchaseLookPrompt] = v17
});
table.insert(v46, {
    [v41.OpenExperienceTraversalPrompt] = v39
});
if v45() then
    table.insert(v46, {
        [v41.ProfilePictureEditorRevertToDefaultPrompt] = v40
    });
end;
return v46;
