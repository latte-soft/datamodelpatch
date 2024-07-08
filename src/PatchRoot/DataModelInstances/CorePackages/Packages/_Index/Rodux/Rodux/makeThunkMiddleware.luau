local function v1(v0)
    return debug.traceback(v0);
end;
return function(v2)
    return function(v3, v4)
        return function(v5)
            if typeof(v5) == "function" then
                local v6, v7 = xpcall(function()
                    return v5(v4, v2);
                end, v1);
                if v6 then
                    return v7;
                else
                    v4._errorReporter.reportReducerError(v4:getState(), v5, {
                        message = "Caught error in thunk", 
                        thrownValue = v7
                    });
                    return nil;
                end;
            else
                return v3(v5);
            end;
        end;
    end;
end;
