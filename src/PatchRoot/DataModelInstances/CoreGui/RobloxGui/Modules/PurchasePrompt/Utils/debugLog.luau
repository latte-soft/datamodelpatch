local v0 = game:DefineFastFlag("PPDebugLogging", false);
return function(v1)
    if v0 and v1 then
        print("[PurchasePrompt]" .. v1());
        return ;
    else
        return ;
    end;
end;
