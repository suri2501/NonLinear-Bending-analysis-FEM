function [tangent,stiffness,force] = Assemble(...
    tangent,te,stiffness,ke,force,fe,IEN_e,ndof)

index = [];
for indof = 1:ndof
    index = [index; IEN_e*ndof-(ndof-indof);];
end
index = index(:)';

tangent(index,index) = tangent(index,index) + te;
stiffness(index,index) = stiffness(index,index) + ke;
force(index) = force(index) + fe;

end