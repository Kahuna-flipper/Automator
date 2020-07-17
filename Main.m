close all

path = pwd;
direc = dir(path);
[elements,~] = size(direc);
rows = zeros(elements,1);   % For hierarchical method
columns = zeros(elements,1);
time_hc = zeros(elements,1);
rows2 = zeros(elements,1);  % For neuronal method
columns2 = zeros(elements,1);
time_nc = zeros(elements,1);

for runs=3:size(direc)
    if(strcmp(direc(runs).name,'Main.m')||strcmp(direc(runs).name,'Hierarchical.m')||strcmp(direc(runs).name,'Neurons.m')||strcmp(direc(runs).name,'OneDTrain.m')||strcmp(direc(runs).name,'FNInitialization.m'))
        continue 
    end
    path2 = strcat(direc(runs).folder,'/',direc(runs).name);
    copyfile('Hierarchical.m',path2);
    copyfile('Neurons.m',path2);
    copyfile('OneDTrain.m',path2);
    copyfile('FNInitialization.m',path2);
    cd(path2)
    run('Hierarchical.m');
    rows(runs) = m;
    columns(runs)=n;
    time_hc(runs) = time;
    run('Neurons.m');
    rows2(runs)=m;
    columns2(runs)=n;
    time_nc(runs) = time2;
    cd ..
    close all
end