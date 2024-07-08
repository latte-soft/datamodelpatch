return function(v0)
    return {
        shouldShowCreatorName = function()
            local l_ShowShareTargetGameCreator_0 = v0.ShowShareTargetGameCreator;
            if l_ShowShareTargetGameCreator_0 ~= nil then
                return l_ShowShareTargetGameCreator_0;
            else
                return false;
            end;
        end
    };
end;
