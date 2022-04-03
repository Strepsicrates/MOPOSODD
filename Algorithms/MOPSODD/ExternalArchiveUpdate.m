function Archive = ExternalArchiveUpdate(Population,Archive,N)

%------------------------------- Copyright --------------------------------
%--------------------------------------------------------------------------
    
    D=DominantDifferenceMatrixConstruction(Population);
    Ds=sum(D);
    [v,number]=sort(Ds,'descend');
    AD=DominantDifferenceMatrixConstruction(Archive);
    
    ADs=sum(AD);
    
    [vv,number1]=sort(ADs,'descend');
    Archive(number1(N/2+1:end))=Population(number(1:N/2)); 
    
    
end