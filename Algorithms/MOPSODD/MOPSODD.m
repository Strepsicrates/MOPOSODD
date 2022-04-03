function MOPSODD(Global)
% <algorithm> <D>
%On the Norm of Dominant Difference for Many-Objective Particle Swarm Optimization
%--------------------------------------------------------------------------

    %% Generate random population
    Population   = Global.Initialization();
    Pbest  =  Population;
    Archive = Population;
    Archive1 = Population;
    Archive = ExternalArchiveUpdate1(Population,Archive,Global.N);
    %% Optimization
    while Global.NotTermination(Archive)
        D=DominantDifferenceMatrixConstruction([Pbest,Population]);
        [Gbest,Pbest] = Updatebest(Pbest,Population,Global.N,D,Global.M);
        Population = Operator(Population,Pbest,Gbest);
        Archive = ExternalArchiveUpdate1(Population,Archive,Global.N);
        %Archive1=Archive(NDSort(Archive.objs,1)==1);
    end        
end

