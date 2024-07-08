local l_Parent_0 = script.Parent;
if not require(l_Parent_0.PromiseUpgradeFlag)() then
    return (require(l_Parent_0.Promise330));
else
    return require(l_Parent_0.Promise340);
end;
