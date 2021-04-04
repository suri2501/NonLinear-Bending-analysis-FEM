function [prescribedbdof,activedof] = BoundaryCondition(my,mx,ncp,ndof,sdof,Coordinate,typeBC)

% Nodal Extraction
CP = reshape(1:ncp,my,mx);
L1 = CP(1,:)';
L2 = CP(:,end);
L3 = CP(end,:)';
L4 = CP(:,1);

% Geometry Extraction
% L1 = find(Coordinate(:,2)==min(Coordinate(:,2)))';  % at y = 0 (along X-axes)
% L2 = find(Coordinate(:,1)==max(Coordinate(:,1)))';  % at x = a (along Y-axes)
% L3 = find(Coordinate(:,2)==max(Coordinate(:,2)))';  % at y = b (along X-axes)
% L4 = find(Coordinate(:,1)==min(Coordinate(:,1)))';  % at x = 0 (along Y-axes)
    
switch typeBC
	case 'SSSS1'
        fprintf('Movable SSSS-1-NPSDT : Simply supported BCs\n');
        dofL1 = [L1*ndof-6 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        dofL3 = [L3*ndof-6 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        dofL2 = [L2*ndof-5 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        dofL4 = [L4*ndof-5 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);
        
	case 'SSSS2'
        fprintf('SSSS-2-NPSDT : Simply supported BCs\n');
        dofL1 = [L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        dofL3 = [L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        dofL2 = [L2*ndof-6 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        dofL4 = [L4*ndof-6 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);
       
    case 'SSSS3'
        fprintf('Immovable/Hard SSSS-3-NPSDT : Simply supported BCs\n');
        dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);
        
	case 'SSSS4'
        fprintf('Immovable/Soft SSSS-4-NPSDT : Simply supported BCs \n');
        dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4];
        dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4];
        dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4];
        dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4];
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);

	case 'CCCC'
        fprintf('CCCC : Plate is clamped BCs\n');
        dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-2 L1*ndof-1 L1*ndof-0];
        dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-2 L3*ndof-1 L3*ndof-0];
        dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4 L2*ndof-3 L2*ndof-2 L2*ndof-1 L2*ndof-0];
        dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4 L4*ndof-3 L4*ndof-2 L4*ndof-1 L4*ndof-0];
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);

    otherwise
	for iBC = 1:4
	if typeBC(iBC) == 'S' && typeBC(5) == '1'
        if iBC == 1
           dofL1 = [L1*ndof-6 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        elseif iBC == 3 
           dofL3 = [L3*ndof-6 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        elseif iBC == 2
           dofL2 = [L2*ndof-5 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        elseif iBC ==4
           dofL4 = [L4*ndof-5 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        end
	elseif typeBC(iBC) == 'S' && typeBC(5) == '2'
        if iBC == 1
           dofL1 = [L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        elseif iBC == 3 
           dofL3 = [L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        elseif iBC == 2
           dofL2 = [L2*ndof-6 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        elseif iBC ==4
           dofL4 = [L4*ndof-6 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        end
	elseif typeBC(iBC) == 'S' && typeBC(5) == '3'       
        if iBC == 1
           dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-1];
        elseif iBC == 3
           dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-1];
        elseif iBC == 2
           dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4 L2*ndof-2 L2*ndof-0];
        elseif iBC ==4
           dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4 L4*ndof-2 L4*ndof-0];
        end
	elseif typeBC(iBC) == 'S' && typeBC(5) == '4'
        if iBC == 1
           dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4];
        elseif iBC == 3 
           dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4];
        elseif iBC == 2
           dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4];
        elseif iBC ==4
           dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4];
        end
	elseif typeBC(iBC) == 'C'
        if iBC == 1
            dofL1 = [L1*ndof-6 L1*ndof-5 L1*ndof-4 L1*ndof-3 L1*ndof-2 L1*ndof-1 L1*ndof-0];
        elseif iBC == 3    
            dofL3 = [L3*ndof-6 L3*ndof-5 L3*ndof-4 L3*ndof-3 L3*ndof-2 L3*ndof-1 L3*ndof-0];
        elseif iBC == 2    
            dofL2 = [L2*ndof-6 L2*ndof-5 L2*ndof-4 L2*ndof-3 L2*ndof-2 L2*ndof-1 L2*ndof-0];
        elseif iBC == 4    
            dofL4 = [L4*ndof-6 L4*ndof-5 L4*ndof-4 L4*ndof-3 L4*ndof-2 L4*ndof-1 L4*ndof-0];
        end
	elseif typeBC(iBC) == 'F'
        if iBC == 1
            dofL1 = [];
        elseif iBC == 3  
            dofL3 = [];
        elseif iBC == 2   
            dofL2 = [];
        elseif iBC == 4    
            dofL4 = [];
        end
	else
        error('Check Boundary Condition\n');
    end
    end
        L1UL3 = union(dofL1,dofL3);
        L2UL4 = union(dofL2,dofL4);
        bcdof = union(L1UL3,L2UL4);
        prescribedbdof = sort(bcdof);
      
end  
    activedof = setdiff(1:sdof,prescribedbdof);
end