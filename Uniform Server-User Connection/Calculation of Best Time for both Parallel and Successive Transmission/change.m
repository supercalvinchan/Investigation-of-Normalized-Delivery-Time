    c_matrix = [0,0,0,0,0;1,1,1,1,1;0,0,0,0,0;1,1,1,1,1;0,0,0,0,0;1,1,1,1,1;1,1,1,1,1]
    %Define (K choose t)
    D = nchoosek(U,t)

    %Define normalized delivery time
    Part1 = (S/rho)*((U-t)/(t+1))

    %initialize normalized delivery time
    T = 0;
    Part2 = 0;
    W_temp=0;

    %counting q_{p}: no of 1
    for j = 1:S

    q = sum(c_matrix(j, :) == 1);

    if U-q < t+1

       W = 0;
    else

      %Define (K - q_{p} \choose t+1)
      W = nchoosek(U - q, t+1);

    end

    W_temp = W_temp + W;

    end

    Part2 = (1/(rho*D))*(W_temp)

    %Calculating normalized delivery time
    T = Part1 - Part2;
    T_ALL = T_ALL + T;