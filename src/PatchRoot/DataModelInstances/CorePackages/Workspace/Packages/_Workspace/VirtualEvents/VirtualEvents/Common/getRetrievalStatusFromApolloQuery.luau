local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local l_RetrievalStatus_0 = require(l_script_FirstAncestor_0.Parent.Http).Enum.RetrievalStatus;
return function(v3)
    if not v3.loading then
        if not v3.data then
            if not v3.error then
                return l_RetrievalStatus_0.NotStarted;
            else
                return l_RetrievalStatus_0.Failed;
            end;
        else
            return l_RetrievalStatus_0.Done;
        end;
    else
        return l_RetrievalStatus_0.Fetching;
    end;
end;
