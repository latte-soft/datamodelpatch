local l_Cryo_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Cryo;
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Components.Pages);
local v3 = require(l_Parent_0.Actions.NavigateBack);
local v4 = require(l_Parent_0.Actions.SetCurrentPage);
return function(v5, v6)
    local v7 = v2.pagesByKey[v5.menuPage];
    if v6.type == v3.name then
        if not v5.respawn.dialogOpen then
            if not v5.report.dialogOpen then
                if v5.menuPage then
                    local l_parentPage_0 = v7.parentPage;
                    if l_parentPage_0 ~= nil then
                        return l_Cryo_0.Dictionary.join(v5, {
                            menuPage = l_parentPage_0
                        });
                    end;
                end;
            else
                return l_Cryo_0.Dictionary.join(v5, {
                    report = l_Cryo_0.Dictionary.join(v5.report, {
                        dialogOpen = false
                    })
                });
            end;
        else
            return l_Cryo_0.Dictionary.join(v5, {
                respawn = l_Cryo_0.Dictionary.join(v5.respawn, {
                    dialogOpen = false
                })
            });
        end;
    elseif v6.type == v4.name then
        return l_Cryo_0.Dictionary.join(v5, {
            currentlyOpenBubble = l_Cryo_0.None
        });
    end;
    return v5;
end;
